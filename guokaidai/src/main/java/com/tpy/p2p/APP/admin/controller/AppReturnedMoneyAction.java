package com.tpy.p2p.APP.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.ReturnedMoneyService;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.util.DateUtil;

@Controller
@RequestMapping("/Appcontract")
public class AppReturnedMoneyAction {

	/** returnedMoneyService 回款计划明细查询 */
	@Resource
	private ReturnedMoneyService returnedMoneyService;
	@Resource
	private UserBaseInfoService userBaseInfoService;

	/**
	 * <p>
	 * Title: getReceivablePlan
	 * </p>
	 * <p>
	 * Description: 回款计划明细查询
	 * </p>
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param minMoeny
	 *            最小金额
	 * @param maxMoney
	 *            最大金额
	 * @param minTime
	 *            最小时间
	 * @param maxTime
	 *            最大时间
	 * @param pageModel
	 *            分页模型
	 * @return 数据展示页面
	 */
	@RequestMapping(value = "/query_page", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getReceivablePlan(HttpServletRequest request, Long uid,
			String minMoeny, String maxMoney, String minTime, String maxTime,
			PageModel pageModel) {

		Userbasicsinfo userbasicsinfo = userBaseInfoService.queryUserById(uid);
		Map<String, Object> message = new HashMap<String, Object>();
		if (StringUtil.isBlank(minMoeny)) {
			minMoeny = "0";
		}
		if (StringUtil.isBlank(maxMoney)) {
			maxMoney = "2000000";
		}
		if (StringUtil.isBlank(minTime)) {
			minTime = DateUtil.getSpecifiedMonthAfter(
					DateUtil.format("yyyy-MM-dd"), -12);
			if (StringUtil.isBlank(maxTime)) {
				maxTime = DateUtil.getSpecifiedMonthAfter(
						DateUtil.format("yyyy-MM-dd"), 36);
			}
		} else if ("a".equals(minTime)) {
			minTime = DateUtil.format("yyyy-MM-dd");
			maxTime = DateUtil.getSpecifiedMonthAfter(
					DateUtil.format("yyyy-MM-dd"), 1);
			request.setAttribute("quick", "a");
		} else if ("b".equals(minTime)) {
			minTime = DateUtil.format("yyyy-MM-dd");
			maxTime = DateUtil.getSpecifiedMonthAfter(
					DateUtil.format("yyyy-MM-dd"), 3);
			request.setAttribute("quick", "b");
		} else if ("c".equals(minTime)) {
			minTime = DateUtil.format("yyyy-MM-dd");
			maxTime = DateUtil.getSpecifiedMonthAfter(
					DateUtil.format("yyyy-MM-dd"), 6);
			request.setAttribute("quick", "c");
		} else if ("d".equals(minTime)) {
			minTime = DateUtil.format("yyyy-MM-dd");
			maxTime = DateUtil.getSpecifiedMonthAfter(
					DateUtil.format("yyyy-MM-dd"), 36);
			request.setAttribute("quick", "d");
		}
		if (StringUtil.isBlank(maxTime)) {
			maxTime = DateUtil.getSpecifiedMonthAfter(minTime, 12);
		}

		/**
		 * data[0] 借款标号,data[1] 类型,data[2] 回收日期,data[3] 回收金额,data[4] 本金+利息-佣金,
		 * data[5] 查询期数/总期数,data[6] 合同
		 * 
		 * 借款标id, 本金(分特权和非特权2部分), 产生的利息, 利率， 几个月还完， 借款标号， 是否是特权会员， 普通会员管理费比例，
		 * 普通会员管理费上限， 特权会员管理费比例， 特权会员管理费上限， 借款标借款总金额， 标的类型， 放款时间
		 * 
		 * 
		 */

		List dataList = returnedMoneyService.getReceivablePlan(userbasicsinfo
				.getId().toString(), minMoeny, maxMoney, minTime, maxTime,
				pageModel);
		List<Object> List = new ArrayList<Object>();
		for (Object x : dataList) {
			Map<String, String> sinData = new HashMap<String, String>();
			String[] data = (String[]) x;
			for (int y = 0; y < data.length; y++) {
				switch (y) {
				case 0:
					sinData.put("borrowMoneyNO", data[y]);
					break;
				case 1:
					sinData.put("type", data[y]);
					break;

				case 2:
					sinData.put("recycleDate", data[y]);
					break;

				case 3:
					sinData.put("recycleMoney", data[y]);
					break;

				case 4:
					sinData.put("principalinterestcommission", data[y]);
					break;

				case 5:
					sinData.put("Queryclauses/totalperiods", data[y]);
					break;
				case 6:
					sinData.put(" contract", data[y]);
					break;

				default:
					break;
				}

			}
			List.add(sinData);

		}
		message.put("list", List);
		request.setAttribute("page", pageModel);
		message.put("NumPerPage", pageModel.getNumPerPage());
		message.put("PageNum", pageModel.getPageNum());
		returnedMoneyService.amountMoney(request);
		message.put("minTime", minTime);
		message.put("minMoeny", minMoeny);
		message.put("maxTime", maxTime);
		message.put("maxMoney", maxMoney);
		return JSONObject.fromObject(message);
	}
}
