package com.tpy.p2p.chesdai.spring.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Banktype;
import com.tpy.p2p.chesdai.entity.UserBank;
import com.tpy.p2p.chesdai.entity.Validcodeinfo;
import com.tpy.p2p.chesdai.spring.annotation.CheckFundsSafe;
import com.tpy.p2p.chesdai.spring.annotation.CheckLogin;
import com.tpy.p2p.chesdai.spring.service.*;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 我的银行卡
 * @author hsq
 *
 */
@Controller
@RequestMapping("/mybankCard")
@CheckLogin(value = CheckLogin.WEB)
@SuppressWarnings("rawtypes")
public class MyBankCardController {
	
	/**
	 * 注入Service
	 */
	@Resource
    UserBankService myBankCardService;

	@Resource
	BankTypeService bankTypeService;

	@Resource
    ProvinceService provinceService;

	@Resource
    CityService cityService;

	@Resource
	private MyindexService myindexService;

	@Resource
	private HibernateSupport dao;

	/**
	 *
	 * @return
	 */
	@RequestMapping(value = "/delBankCard",method = RequestMethod.GET)
	public String removeBankCard(HttpServletRequest request){
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		UserBank userBank = myBankCardService.getUserBank(user.getId());
		try {
			myBankCardService.delete(userBank.getId());
			request.setAttribute("del_success",true);
			request.setAttribute("to_userbank_add",true);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "WEB-INF/views/member/mybankCard";
	}

	/**
	 *
	 * @return
	 */
	@RequestMapping(value = "/addBankCard",method = RequestMethod.GET)
	public String addBankCard(HttpServletRequest request){
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("userbank_add",true);

		request.setAttribute("bankTypeList",bankTypeService.getBankList());
		request.setAttribute("provinceList", provinceService.getProvinceList());

		return "WEB-INF/views/member/mybankCard";
	}

	/**
	 * 添加用户银行卡信息
	 * @param code 银行卡编号
	 * @param number 银行卡账号
	 * @param name 银行名称
	 * @return 1 验证码已过期  2 验证码输入错误 3 添加成功
	 */
	@RequestMapping("/saveUserBank")
	@ResponseBody
	public String saveUserBank(long banktype,
								String bankAccount,
								String accountName,
								String branch,
								String province,
								String city,
								String bankname,
								String smscode,
								HttpServletRequest request){
		//获取当前登录账户信息
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);

		List valicode = myindexService.queryValicodeByUserId(user.getId());
		Object[] valicodes = (Object[]) ((List) valicode).get(0);

		//验证用户所填写的验证码是否和发送的验证码一致
		if (!smscode.equals(valicodes[1])) {
			return "sms_not_equal";
		}

		//验证短信验证码是否失效
//       if(System.currentTimeMillis() < validcode.getSmsagainTime()){
//           return "sms_code_failure";
//       }

		UserBank bank = new UserBank();
		Banktype bt = new Banktype();

		if(city==null && city.length()<=0){
			bank.setCity("1");
		}
		bt.setId(banktype);
		bt.setName(bankname);
		bank.setBankAccount(bankAccount);
		bank.setAccountName(accountName);
		bank.setBranch(branch);
		bank.setUserbasicsinfo(user);
		bank.setBankname(bankname);
		bank.setProvince(province);
		bank.setBanktype(bt);

		try {
			myBankCardService.save(bank);
			request.setAttribute("userbank_show",true);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}

	/**
	 *
	 * @param province_id
	 * @param request
	 * @return
	 */

	@RequestMapping("/getCityList")
	@ResponseBody
	public List getCityList(int province_id,HttpServletRequest request){
		List cityList = cityService.getCityList(province_id);
		return cityList;
	}

	
	/**
	 * 我的收支单
	 * @param beginTime
	 * @param endTime
	 * @param typeId 事件类型
	 * @param request
	 * @return
	 */
	@CheckFundsSafe
	@RequestMapping("mybankCard.htm")
	public String queryExpenses(String beginTime,String endTime,Long typeId,
			HttpServletRequest request,Integer pageNum){
		Userbasicsinfo user = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
		UserBank userBankCard = myBankCardService.getUserBank(user.getId());

		if(userBankCard!=null) {
			request.setAttribute("userbank", userBankCard);
			request.setAttribute("bankTypeList",bankTypeService.getBankList());
			request.setAttribute("provinceList", provinceService.getProvinceList());
			request.setAttribute("userbank_show",true);
			System.out.println("userbank_show");
		}else{
			request.setAttribute("to_userbank_add",true);
			System.out.println("to_userbank_add");
		}
		return "WEB-INF/views/member/mybankCard";
	}
}
