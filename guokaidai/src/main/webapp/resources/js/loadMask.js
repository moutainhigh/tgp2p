//遮盖层对象
var loadMask = {
	//开启加载层_node:要遮盖的层ID
	load:function(_id,_info){
		//被遮盖的层对象，并获取其高度宽度左边距上边距，用于遮盖层的定位
		var _node = $("#"+_id);
		var _offset = _node.offset();
		var _width = _node.width();
		var _height = _node.height();
		//遮盖层
		var _loadNode = loadMask.createLayer(_id);
		_loadNode.width(_width);
		_loadNode.height(_height);
		//提示信息层
		var _infoLayer = loadMask.createInfoLayer(_id,_info);
		_node.parent().append(_loadNode);
		_node.parent().append(_infoLayer);
		//定位遮盖层和提示信息层的位置
		_loadNode.offset({top:_offset.top,left:_offset.left});
		_infoLayer.offset({top:(_offset.top+(_height/2)-30),left:(_offset.left+(_width/2)-_infoLayer.width()/2)});
	},
	//关闭加载层_node:要遮盖的层ID
	unload:function(_id){
		if($("#loadDiv_"+_id).length!=0){
			$("#loadDiv_"+_id).remove();
		}
		if($("#loadDiv_content_"+_id).length!=0){
			$("#loadDiv_content_"+_id).remove();
		}
	},
	//创建加载层
	createLayer:function(_id){
		var _div = "<div id='loadDiv_"+_id+"' style='opacity: 0.4;filter: alpha(opacity=40);position: absolute;z-index: 2000;background-color:#CCCCCC;top:0;left:0;'></div>";
		return $(_div);
	},
	createInfoLayer:function(_id,_info){
		_info = _info?_info:"数据正在加载中...";
		var _node = $("#"+_id);
		var _width = _node.width();
		var _height = _node.height();
		var _div = "<div id='loadDiv_content_"+_id+"' style='text-align:left;padding:0px 5px 0px 5px;cursor:wait;border:1px solid #CCCCCC;display:block;background-color:#FFFFFF;height:40px;line-height:40px;position: absolute;z-index: 2001;'><img style='margin-right:5px;' src='resources/css/icons/loading.gif'>"+_info+"</div>";
		return $(_div);
	}
}