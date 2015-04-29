package com.tpy.p2p.chesdai.spring.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Viptype;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baofoo.p2p.dto.receive.ResultDto;
import com.baofoo.p2p.dto.request.TransferDto;
import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.cddgg.commons.log.LOG;
import com.tpy.p2p.chesdai.admin.spring.service.systemset.ExpenseRatioService;
import com.tpy.p2p.chesdai.entity.Accountinfo;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.entity.Vipinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.UserInfoVipService;
import com.tpy.p2p.chesdai.spring.service.VipInfoService;
import com.tpy.p2p.pay.entity.PaymentIpsInfo;
import com.tpy.p2p.pay.entity.PaymentReturnInfo;
import com.tpy.p2p.pay.util.ParameterIps;

/**
 * 会员升级
 * 
 * @author RanQiBing 2014-04-17
 * 
 */
@Controller
@RequestMapping("/userinfovip")
@CheckLogin(value = CheckLogin.WEB)
public class UserInfoVipController {

	@Resource
	private UserInfoVipService userInfoVipService;

	@Resource
	private VipInfoService vipInfoService;

	@Resource
	private ExpenseRatioService expenseRatioService;

	@Resource
	private RequestService bfService;

	@Resource
	private ReceiveService receiveService;

	private DecimalFormat df = new DecimalFormat("0.00");

	@RequestMapping("upgrade.htm")
	public String openVip(HttpServletRequest request) {
		Userbasicsinfo userinfo = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		Costratio cost = expenseRatioService.findCostratio();
		Double vipUpgrade = cost.getVipUpgrade();
		if (vipUpgrade > 0) {
			request.setAttribute("vipUpgrade", df.format(cost.getVipUpgrade()));
		} else {
			request.setAttribute("vipUpgrade", "免费");
		}
		Object obj = vipInfoService.isVip(userinfo.getId());
		int typeVip = 0;
		if (null != obj) {
			typeVip = 1;
		}
		request.setAttribute("typeVip", typeVip);
		Vipinfo vip = userInfoVipService.getuserId(userinfo.getId());
		if (null != vip) {
			request.setAttribute("time", vip.getEndtime());
		}
		return "WEB-INF/views/member/vippay/vipsevers";
	}

	/**
	 * 提交会员升级订单
	 * 
	 * @param money
	 *            金额
	 * @param type
	 *            支付方式
	 * @return 返回地址
	 */
	@RequestMapping("payment.htm")
	public String payment(String money, String type, Long id,
			HttpServletRequest request) {
		Userbasicsinfo userinfo = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PaymentIpsInfo payment = new PaymentIpsInfo();
		if (null == id) {
			Viptype viptype = userInfoVipService.getType();
			payment.setAmount(df.format(Double.parseDouble(money)));
			payment.setGateway_Type(type);
			Vipinfo vipinfo = new Vipinfo(payment.getBillno(),
					Constant.STATUES_ONE, userinfo, viptype);
			userInfoVipService.save(vipinfo);
		} else {
			Vipinfo vip = userInfoVipService.get(id);
			payment.setBillno(vip.getNumber());
			payment.setAmount(df.format(vip.getViptype().getMoney()));
		}
		request.setAttribute("payment", payment);
		return "WEB-INF/views/paymentips";
	}

	@RequestMapping("paymentBF.htm")
	public String paymentBF(String money, String type,
			HttpServletRequest request) {
		Userbasicsinfo userinfo = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		
		Vipinfo vip = userInfoVipService.getuserId(userinfo.getId());
		if (null != vip) {
			request.setAttribute("error",
					"升级VIP失败->失败原因->您已经是VIP会员");
			return "WEB-INF/views/failure";
		}

		TransferDto entity = new TransferDto();
		entity.setMerchant_id(ParameterIps.getMercode());
		String order_id = UUID.randomUUID().toString().replace("-", "");
		entity.setOrder_id(order_id);
		//付款方帐号类型0或1,0为普通用户(平台的user_id) 1为商户号
		entity.setPayer_type("0");
		entity.setPayer_user_id(userinfo.getId().toString());
		//收款方帐号类型0或1,0为普通用户(平台的user_id) 1为商户号
		entity.setPayee_type("1");
		entity.setPayee_user_id(ParameterIps.getMercode());
		entity.setAmount(money);
		entity.setFee("0.00");
		entity.setFee_taken_on("0");
		entity.setReq_time(System.currentTimeMillis() + "");

		try {
			String xml = bfService.serv_Transfer(entity);
			ResultDto resultDto = receiveService.serv_Transfer(xml);		
			if (Constant.BF_SUCCESS.equals(resultDto.getCode())) {
				Viptype viptype = new Viptype();
				viptype.setMoney(Double.parseDouble(money));
				viptype.setMonth(12);
				viptype.setId(new Long(1));
				vipInfoService.addVipinfoBF(
						new Vipinfo(order_id, 2, userinfo, viptype),
						new Accountinfo(userinfo, null, Double
								.parseDouble(money)));
				request.setAttribute("url", "member_index/member_center");
				return "WEB-INF/views/success";
			} else {
				request.setAttribute("error",
						"升级VIP失败->失败原因->" + resultDto.getCode());
				return "WEB-INF/views/failure";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
			return "WEB-INF/views/failure";
		}
	}

	/**
	 * 环迅支付返回信息的处理
	 * 
	 * @param ipsInfo
	 *            支付对象
	 * @param request
	 * @return 返回页面
	 */
	@RequestMapping("sign.htm")
	public String sign(PaymentReturnInfo returnInfo, HttpServletRequest request) {
		if (returnInfo.getSucc().equals("Y")) {
			if (returnInfo.getSignature().equals(returnInfo.getSignmd5())) {
				// 获取当前订单
				Vipinfo vip = userInfoVipService.getVipNumber(returnInfo
						.getBillno());
				vip.setBankbillno(returnInfo.getBankbillno());
				vip.setIpsbillno(returnInfo.getIpsbillno());
				vip.setStatus(Constant.STATUES_TWO);
				Vipinfo vips = userInfoVipService.getuserId(vip
						.getUserbasicsinfo().getId(), vip.getId());
				int num = 0;
				try {
					if (null != vips) {
						if (null != vips.getEndtime()) {
							num = DateUtils.differenceDate("yyyy-MM-dd",
                                    DateUtils.format("yyyy-MM-dd"),
                                    vips.getEndtime());
							if (num > 0) {
								vip.setBegintime(DateUtils.add(
										"yyyy-MM-dd HH:mm:ss",
										vips.getEndtime(), Calendar.DATE, 1));
							} else {
								vip.setBegintime(DateUtils
										.format("yyyy-MM-dd HH:mm:ss"));
							}
						} else {
							vip.setBegintime(DateUtils
									.format("yyyy-MM-dd HH:mm:ss"));
						}
					} else {
						vip.setBegintime(DateUtils
								.format("yyyy-MM-dd HH:mm:ss"));
					}
					vip.setEndtime(DateUtils.add("yyyy-MM-dd HH:mm:ss",
							vip.getBegintime(), Calendar.MONTH, 12));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				userInfoVipService.update(vip);
			}
		} else {
			LOG.error("环迅支付失败-》错误信息:" + returnInfo.getMsg());
		}
		return "WEB-INF/views/member/vippay/viprecord";
	}

	/**
	 * 打开记录页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("vipRecords.htm")
	public String vipRecords(HttpServletRequest request) {

		return "WEB-INF/views/member/vippay/viprecord";
	}

	/**
	 * 分页查询用户升级会员信息
	 * 
	 * @param no
	 *            当前页
	 * @param request
	 * @return 返回页面路径
	 */
	@RequestMapping("vipRecord.htm")
	public String vipRecord(int no, HttpServletRequest request) {
		Userbasicsinfo userinfo = (Userbasicsinfo) request.getSession()
				.getAttribute(Constant.SESSION_USER);
		PageModel page = new PageModel();
		page.setPageNum(no);
		request.setAttribute("page",
				userInfoVipService.getVipInfo(userinfo.getId(), page));
		return "WEB-INF/views/member/vippay/recordtable";
	}

	/**
	 * 删除数据
	 * 
	 * @param id
	 *            会员编号
	 * @return
	 */
	@RequestMapping("delete.htm")
	@ResponseBody
	public String deletes(Long id) {
		try {
			userInfoVipService.delete(userInfoVipService.get(id));
			return "1";
		} catch (Exception e) {
			return "0";
			// TODO: handle exception
		}
	}

	/**
	 * 升级VIP
	 * 
	 * @param vipinfo
	 *            vip
	 */
	@RequestMapping("/freeUpgrade")
	@ResponseBody
	public void update(Vipinfo vipinfo, HttpServletRequest request,
			HttpServletResponse response) {
		vipInfoService.addVipinfo(vipinfo, request);
		try {
			response.sendRedirect("/member_index/member_center");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
