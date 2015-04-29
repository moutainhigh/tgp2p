! function($, window, i) {
	$.fn.responsiveSlides = function(options) {
		var settings = $.extend({
			auto: !0,
			speed: 500,
			timeout: 4e3,
			pager: !1,
			nav: !1,
			random: !1,
			pause: !1,
			pauseControls: !0,
			prevText: "Previous",
			nextText: "Next",
			maxwidth: "",
			navContainer: "",
			manualControls: "",
			namespace: "rslides",
			before: $.noop,
			after: $.noop
		}, options);
		return this.each(function() {
			i++;
			var vendor, selectTab, startCycle, restartCycle, rotate, $tabs, $this = $(this),
				index = 0,
				$slide = $this.children(),
				length = $slide.size(),
				fadeTime = parseFloat(settings.speed),
				waitTime = parseFloat(settings.timeout),
				maxw = parseFloat(settings.maxwidth),
				namespace = settings.namespace,
				namespaceIdx = namespace + i,
				navClass = namespace + "_nav " + namespaceIdx + "_nav",
				activeClass = namespace + "_here",
				visibleClass = namespaceIdx + "_on",
				slideClassPrefix = namespaceIdx + "_s",
				$pager = $("<ul class='" + namespace + "_tabs " + namespaceIdx + "_tabs' />"),
				visible = {
					"float": "left",
					position: "absolute",
					opacity: 1,
					zIndex: 2,
					top: "150px"
				},
				hidden = {
					"float": "none",
					position: "absolute",
					opacity: 0,
					zIndex: 1,
					top: "150px"
				},
				supportsTransitions = function() {
					var docBody = document.body || document.documentElement,
						styles = docBody.style,
						prop = "transition";
					if ("string" == typeof styles[prop]) return !0;
					vendor = ["Moz", "Webkit", "Khtml", "O", "ms"], prop = prop.charAt(0).toUpperCase() + prop.substr(1);
					var i;
					for (i = 0; i < vendor.length; i++)
						if ("string" == typeof styles[vendor[i] + prop]) return !0;
					return !1
				}(),
				slideTo = function(idx) {
					settings.before(idx), supportsTransitions ? ($slide.removeClass(visibleClass).css(hidden).eq(idx).addClass(visibleClass).css(visible), index = idx, setTimeout(function() {
						settings.after(idx)
					}, fadeTime)) : $slide.stop().fadeOut(fadeTime, function() {
						$(this).removeClass(visibleClass).css(hidden).css("opacity", 1)
					}).eq(idx).fadeIn(fadeTime, function() {
						$(this).addClass(visibleClass).css(visible), settings.after(idx), index = idx
					})
				};
			if (settings.random && ($slide.sort(function() {
				return Math.round(Math.random()) - .5
			}), $this.empty().append($slide)), $slide.each(function(i) {
				this.id = slideClassPrefix + i
			}), $this.addClass(namespace + " " + namespaceIdx), options && options.maxwidth && $this.css("max-width", maxw), $slide.hide().css(hidden).eq(0).addClass(visibleClass).css(visible).show(), supportsTransitions && $slide.show().css({
				"-webkit-transition": "opacity " + fadeTime + "ms ease-in-out",
				"-moz-transition": "opacity " + fadeTime + "ms ease-in-out",
				"-o-transition": "opacity " + fadeTime + "ms ease-in-out",
				transition: "opacity " + fadeTime + "ms ease-in-out"
			}), $slide.size() > 1) {
				if (fadeTime + 100 > waitTime) return;
				if (settings.pager && !settings.manualControls) {
					var tabMarkup = [];
					$slide.each(function(i) {
						var n = i + 1;
						tabMarkup += "<li><a href='#' class='" + slideClassPrefix + n + "'>" + n + "</a></li>"
					}), $pager.append(tabMarkup), options.navContainer ? $(settings.navContainer).append($pager) : $this.after($pager)
				}
				if (settings.manualControls && ($pager = $(settings.manualControls), $pager.addClass(namespace + "_tabs " + namespaceIdx + "_tabs")), (settings.pager || settings.manualControls) && $pager.find("li").each(function(i) {
					$(this).addClass(slideClassPrefix + (i + 1))
				}), (settings.pager || settings.manualControls) && ($tabs = $pager.find("a"), selectTab = function(idx) {
					$tabs.closest("li").removeClass(activeClass).eq(idx).addClass(activeClass)
				}), settings.auto && (startCycle = function() {
					rotate = setInterval(function() {
						$slide.stop(!0, !0);
						var idx = length > index + 1 ? index + 1 : 0;
						(settings.pager || settings.manualControls) && selectTab(idx), slideTo(idx)
					}, waitTime)
				}, startCycle()), restartCycle = function() {
					settings.auto && (clearInterval(rotate), startCycle())
				}, settings.pause && $this.hover(function() {
					clearInterval(rotate)
				}, function() {
					restartCycle()
				}), (settings.pager || settings.manualControls) && ($tabs.bind("click", function(e) {
					e.preventDefault(), settings.pauseControls || restartCycle();
					var idx = $tabs.index(this);
					index === idx || $("." + visibleClass).queue("fx").length || (selectTab(idx), slideTo(idx))
				}).eq(0).closest("li").addClass(activeClass), settings.pauseControls && $tabs.hover(function() {
					clearInterval(rotate)
				}, function() {
					restartCycle()
				})), settings.nav) {
					var navMarkup = "<a href='#' class='" + navClass + " prev'>" + settings.prevText + "</a><a href='#' class='" + navClass + " next'>" + settings.nextText + "</a>";
					options.navContainer ? $(settings.navContainer).append(navMarkup) : $this.after(navMarkup);
					var $trigger = $("." + namespaceIdx + "_nav"),
						$prev = $trigger.filter(".prev");
					$trigger.bind("click", function(e) {
						e.preventDefault();
						var $visibleClass = $("." + visibleClass);
						if (!$visibleClass.queue("fx").length) {
							var idx = $slide.index($visibleClass),
								prevIdx = idx - 1,
								nextIdx = length > idx + 1 ? index + 1 : 0;
							slideTo($(this)[0] === $prev[0] ? prevIdx : nextIdx), (settings.pager || settings.manualControls) && selectTab($(this)[0] === $prev[0] ? prevIdx : nextIdx), settings.pauseControls || restartCycle()
						}
					}), settings.pauseControls && $trigger.hover(function() {
						clearInterval(rotate)
					}, function() {
						restartCycle()
					})
				}
			}
			if ("undefined" == typeof document.body.style.maxWidth && options.maxwidth) {
				var widthSupport = function() {
					$this.css("width", "100%"), $this.width() > maxw && $this.css("width", maxw)
				};
				widthSupport(), $(window).bind("resize", function() {
					widthSupport()
				})
			}
		})
	}
}(jQuery, this, 0),
function(factory) {
	"function" == typeof define && define.amd ? define(["jquery"], factory) : factory(jQuery)
}(function($) {
	"use strict";

	function parseDateString(dateString) {
		if (dateString instanceof Date) return dateString;
		if (String(dateString).match(matchers)) return String(dateString).match(/^[0-9]*$/) && (dateString = Number(dateString)), new Date(dateString);
		throw new Error("Couldn't cast `" + dateString + "` to a date object.")
	}

	function strftime(offsetObject) {
		return function(format) {
			var directives = format.match(/%(-|!)?[A-Z]{1}(:[^;]+;)?/gi);
			if (directives)
				for (var i = 0, len = directives.length; len > i; ++i) {
					var directive = directives[i].match(/%(-|!)?([a-zA-Z]{1})(:[^;]+;)?/),
						regexp = new RegExp(directive[0]),
						modifier = directive[1] || "",
						plural = directive[3] || "",
						value = null;
					directive = directive[2], DIRECTIVE_KEY_MAP.hasOwnProperty(directive) && (value = DIRECTIVE_KEY_MAP[directive], value = Number(offsetObject[value])), null !== value && ("!" === modifier && (value = pluralize(plural, value)), "" === modifier && 10 > value && (value = "0" + value.toString()), format = format.replace(regexp, value.toString()))
				}
			return format = format.replace(/%%/, "%")
		}
	}

	function pluralize(format, count) {
		var plural = "s",
			singular = "";
		return format && (format = format.replace(/(:|;|\s)/gi, "").split(/\,/), 1 === format.length ? plural = format[0] : (singular = format[0], plural = format[1])), 1 === Math.abs(count) ? singular : plural
	}
	var PRECISION = 1e3,
		instances = [],
		matchers = [];
	matchers.push(/^[0-9]*$/.source), matchers.push(/([0-9]{1,2}\/){2}[0-9]{4}( [0-9]{1,2}(:[0-9]{2}){2})?/.source), matchers.push(/[0-9]{4}(\/[0-9]{1,2}){2}( [0-9]{1,2}(:[0-9]{2}){2})?/.source), matchers = new RegExp(matchers.join("|"));
	var DIRECTIVE_KEY_MAP = {
			Y: "years",
			m: "months",
			w: "weeks",
			d: "days",
			D: "totalDays",
			H: "hours",
			M: "minutes",
			S: "seconds"
		},
		Countdown = function(el, finalDate, currentServerDate, callback) {
			this.el = el, this.$el = $(el), this.interval = null, this.offset = {}, this.setFinalDate(finalDate), this.setCurrentServerDate(currentServerDate), this.instanceNumber = instances.length, instances.push(this), this.$el.data("countdown-instance", this.instanceNumber), callback && (this.$el.on("update.countdown", callback), this.$el.on("stoped.countdown", callback), this.$el.on("finish.countdown", callback)), this.start()
		};
	$.extend(Countdown.prototype, {
		start: function() {
			if (null !== this.interval) throw new Error("Countdown is already running!");
			var self = this;
			this.update(), this.interval = setInterval(function() {
				self.update.call(self)
			}, PRECISION)
		},
		stop: function() {
			clearInterval(this.interval), this.interval = null, this.dispatchEvent("stoped")
		},
		pause: function() {
			this.stop.call(this)
		},
		resume: function() {
			this.start.call(this)
		},
		remove: function() {
			this.stop(), delete instances[this.instanceNumber]
		},
		setFinalDate: function(value) {
			this.finalDate = parseDateString(value)
		},
		setCurrentServerDate: function(value) {
			void 0 !== value && (this.lastTimeStamp = this.finalDate.valueOf() - value), this.currentServerDate = value
		},
		update: function() {
			return 0 === this.$el.closest("html").length ? (this.remove(), void 0) : (this.totalSecsLeft = this.lastTimeStamp ? this.lastTimeStamp = this.lastTimeStamp - 1e3 : this.finalDate.valueOf() - (new Date).valueOf(), this.totalSecsLeft = Math.ceil(this.totalSecsLeft / 1e3), this.totalSecsLeft = this.totalSecsLeft < 0 ? 0 : this.totalSecsLeft, this.offset = {
				seconds: this.totalSecsLeft % 60,
				minutes: Math.floor(this.totalSecsLeft / 60) % 60,
				hours: Math.floor(this.totalSecsLeft / 60 / 60) % 24,
				days: Math.floor(this.totalSecsLeft / 60 / 60 / 24) % 7,
				totalDays: Math.floor(this.totalSecsLeft / 60 / 60 / 24),
				weeks: Math.floor(this.totalSecsLeft / 60 / 60 / 24 / 7),
				months: Math.floor(this.totalSecsLeft / 60 / 60 / 24 / 30),
				years: Math.floor(this.totalSecsLeft / 60 / 60 / 24 / 365)
			}, 0 === this.totalSecsLeft && (this.stop(), this.dispatchEvent("finish")), this.dispatchEvent("update"), void 0)
		},
		dispatchEvent: function(eventName) {
			var event = $.Event(eventName + ".countdown");
			event.finalDate = this.finalDate, event.offset = $.extend({}, this.offset), event.strftime = strftime(this.offset), this.$el.trigger(event)
		}
	}), $.fn.countdown = function() {
		var argumentsArray = Array.prototype.slice.call(arguments, 0);
		return this.each(function() {
			var instanceNumber = $(this).data("countdown-instance");
			if (void 0 !== instanceNumber) {
				var instance = instances[instanceNumber],
					method = argumentsArray[0];
				Countdown.prototype.hasOwnProperty(method) ? instance[method].apply(instance, argumentsArray.slice(1)) : null === String(method).match(/^[$A-Z_][0-9A-Z_$]*$/i) ? instance.setFinalDate.call(instance, method) : $.error("Method %s does not exist on jQuery.countdown".replace(/\%s/gi, method))
			} else new Countdown(this, argumentsArray[0], argumentsArray[1])
		})
	}
}),
function(factory) {
	"function" == typeof define && define.amd ? define(["jquery"], factory) : factory(jQuery)
}(function($) {
	function encode(s) {
		return config.raw ? s : encodeURIComponent(s)
	}

	function decode(s) {
		return config.raw ? s : decodeURIComponent(s)
	}

	function stringifyCookieValue(value) {
		return encode(config.json ? JSON.stringify(value) : String(value))
	}

	function parseCookieValue(s) {
		0 === s.indexOf('"') && (s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, "\\"));
		try {
			return s = decodeURIComponent(s.replace(pluses, " ")), config.json ? JSON.parse(s) : s
		} catch (e) {}
	}

	function read(s, converter) {
		var value = config.raw ? s : parseCookieValue(s);
		return $.isFunction(converter) ? converter(value) : value
	}
	var pluses = /\+/g,
		config = $.cookie = function(key, value, options) {
			if (void 0 !== value && !$.isFunction(value)) {
				if (options = $.extend({}, config.defaults, options), "number" == typeof options.expires) {
					var days = options.expires,
						t = options.expires = new Date;
					t.setTime(+t + 864e5 * days)
				}
				return document.cookie = [encode(key), "=", stringifyCookieValue(value), options.expires ? "; expires=" + options.expires.toUTCString() : "", options.path ? "; path=" + options.path : "", options.domain ? "; domain=" + options.domain : "", options.secure ? "; secure" : ""].join("")
			}
			for (var result = key ? void 0 : {}, cookies = document.cookie ? document.cookie.split("; ") : [], i = 0, l = cookies.length; l > i; i++) {
				var parts = cookies[i].split("="),
					name = decode(parts.shift()),
					cookie = parts.join("=");
				if (key && key === name) {
					result = read(cookie, value);
					break
				}
				key || void 0 === (cookie = read(cookie)) || (result[name] = cookie)
			}
			return result
		};
	config.defaults = {}, $.removeCookie = function(key, options) {
		return void 0 === $.cookie(key) ? !1 : ($.cookie(key, "", $.extend({}, options, {
			expires: -1
		})), !$.cookie(key))
	}
});
var itz = itz || {};
itz.index = {}, itz.index.init = function() {
	itz.updateHeaderStatus(), $(".tips").length > 0 && $(".tips").tip({
		words_per_line: 31,
		tip_top: 10
	}), $("#indexSlide").responsiveSlides({
		nav: !0,
		pager: !0,
		namespace: "indexSlide",
		pause: !0
	}), $("#topNotice").click(function() {
		var $con = $("#topNoticeCon");
		$con.is(":hidden") ? ($con.slideDown("fast"), $(this).addClass("top-notice-expanded").parent().addClass("website-notice-icon-expand")) : ($con.slideUp("fast"), $(this).removeClass("top-notice-expanded").parent().removeClass("website-notice-icon-expand"))
	}), itz.getTimeStamp(function(data) {
		if (!(data.code > 0)) {
			var curSt = 1e3 * data.data;
			$(".index-clock").each(function() {
				var $t = $(this),
					bt = $t.attr("_beginTime");
				if (curSt >= bt) {
					var $p = $t.parent();
					$p.find(".countdonw-show").hide(), $p.find(".countdonw-hide").fadeIn()
				} else $t.countdown(bt, curSt).on("update.countdown", function(event) {
					var o = event.offset;
					o.days > 0 && (o.hours = o.hours + 24 * o.days), o.hours < 10 && (o.hours = "0" + o.hours), $(this).html(event.strftime("<span>" + o.hours + "</span><b>:</b> <span>%M</span><b>:</b> <span>%S</span>"))
				}).on("finish.countdown", function() {
					itz.getTimeStamp(function(data) {
						if (0 == data.code && bt - 1e3 <= 1e3 * data.data) {
							var $p = $t.parent();
							$p.find(".countdonw-show").hide(), $p.find(".countdonw-hide").fadeIn()
						}
					})
				})
			})
		}
	});
	var $tabWrapper = $("#noticeTabs");
	$tabWrapper.find(".w-n-l-tab-nav span").itzTabs({
		$content: $tabWrapper.find(".w-n-l-tab-content"),
		currentClass: "cur",
		afterFn: function(index) {
			var $more = $tabWrapper.find(".w-n-l-tab-more a").hide();
			$($more[index]).show()
		}
	}), $("#media-news .m-slide-w").responsiveSlides({
		pause: !0,
		namespace: "m-slide-w"
	})
};