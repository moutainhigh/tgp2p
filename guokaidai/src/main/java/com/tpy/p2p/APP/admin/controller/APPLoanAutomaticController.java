package com.tpy.p2p.APP.admin.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Automatic;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cddgg.commons.log.LOG;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.APP.admin.Util.MyUtil;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.service.LoanAutomaticService;
import com.tpy.p2p.chesdai.spring.service.PlankService;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

/** 自动投标 */
@Controller
@RequestMapping("/appautomatic")
public class APPLoanAutomaticController {
	@Resource
	private HibernateSupport dao;

	@Resource
	private LoanAutomaticService loanAutomaticService;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private PlankService plankService;

	@RequestMapping("/init_automatic")
	@ResponseBody
	public JSONObject automaticAsk(
			Model model,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "no", required = false, defaultValue = "1") Integer no)
			throws ParseException {
		String id = request.getParameter("id");
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		List<Automatic> automaticListOne = loanAutomaticService
				.getAutomaticList(id, user.getId().toString(), (no - 1) * 10);
		List<Object> enctrypCase = new ArrayList<Object>();
		for (Automatic value : automaticListOne) {
			enctrypCase.add(value);
		}
		JSONArray json = MyUtil.sameEntityValue(enctrypCase);
		request.setAttribute("automaticList", automaticListOne);
		return JSONObject.fromObject(json);
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/saveAutomatic", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveAutomatic(HttpServletRequest request,
			Automatic cautomatic, String uid, HttpServletResponse response) {
		ReturnInfo info = null;
		Userbasicsinfo user = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		// 获取当前用户的最新信息
		Userbasicsinfo userbasicsinfo = userInfoServices
				.queryBasicsInfoById(user.getId().toString());
		String pValidType = request.getParameter("pValidType");// 有效期类型
		String pValidDate = request.getParameter("pValidDate"); // 有效期
		String pTrdCycleType = request.getParameter("pTrdCycleType");// 标的借款周期类型
		String pSTrdCycleValue = request.getParameter("pSTrdCycleValue");
		String pETrdCycleValue = request.getParameter("pETrdCycleValue");
		String pSAmtQuota = request.getParameter("pSAmtQuota");
		String pEAmtQuota = request.getParameter("pEAmtQuota");
		String pSIRQuota = request.getParameter("pSIRQuota");
		String pEIRQuota = request.getParameter("pEIRQuota");
		Automatic automatic = new Automatic();
		DecimalFormat df = new DecimalFormat("0.00");
		automatic.setUserbasicsinfo(userbasicsinfo);
		automatic.setState(1);
		automatic.setpValidType(pValidType);
		automatic.setpValidDate(pValidDate);
		automatic.setpTrdCycleType(pTrdCycleType);
		automatic.setpSTrdCycleValue(Integer.parseInt(pSTrdCycleValue));
		automatic.setpETrdCycleValue(Integer.parseInt(pETrdCycleValue));
		automatic.setpSAmtQuota(String.valueOf(df.format(Double
				.parseDouble(pSAmtQuota))));
		automatic.setpEAmtQuota(String.valueOf(df.format(Double
				.parseDouble(pEAmtQuota))));
		automatic.setpSIRQuota(String.valueOf(df.format(Double
				.parseDouble(pSIRQuota))));
		automatic.setpEIRQuota(String.valueOf(df.format(Double
				.parseDouble(pEIRQuota))));
		automatic.setEntrytime(DateUtils.format("yyyy-MM-dd"));
		try {
			// 发送报文
			automatic.setpMerBillNo("ZD" + StringUtil.pMerBillNo());
			automatic.setpSigningDate(DateUtils.format("yyyyMMdd"));
			automatic.setpIdentNo(userbasicsinfo.getUserrelationinfo()
					.getCardId());
			automatic.setpRealName(userbasicsinfo.getName());
			automatic.setpIpsAcctNo(userbasicsinfo.getUserfundinfo()
					.getpIdentNo());
			automatic.setpMemo1(userbasicsinfo.getId().toString() + "_"
					+ automatic.getEntrytime() + "_"
					+ automatic.getpSigningDate());
			automatic.setpMemo2(automatic.getpTrdCycleType() + "_"
					+ automatic.getpValidType());
			automatic.setpMemo3(automatic.getpSTrdCycleValue() + "_"
					+ automatic.getpETrdCycleValue());
			Map<String, String> map = plankService.automaitcBid(automatic);
			request.getSession().setAttribute("map", map);
			return JSONObject.fromObject(map);
			/*
			 * info = RegisterService.transfer(map); // 返回成功进行处理 if
			 * (com.jubaopen
			 * .p2p.chesdai.constant.Constant.SUCCESS.equals(info.getpErrCode
			 * ())) { Log.error("环迅自动投标规则已受理"); dao.save(automatic); return 1;
			 * }else{ Log.error("环迅自动投标规则受理失败"); return 2; }
			 */
		} catch (Exception e) {
			LOG.error("自动投标规则失败,数据解析失败-->需要解析的数据为：" + info.getP3DesXmlPara());
			e.printStackTrace();
			return JSONObject.fromObject(3);
		}
	}

}
