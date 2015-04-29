package com.tpy.p2p.pay.constant;

import com.tpy.p2p.pay.util.ParameterIpsUrl;

/**
 * 
 * 用于存放环讯接口访问地址的常量
 * @author RanQiBing 2014-01-03
 *
 */
public interface PayURL {

	/**用户注册地址**/
	String REGISTRATIONTESTURL = ParameterIpsUrl.getRegistrationurl();
	/**充值地址**/
	String RECHARGETESTURL = ParameterIpsUrl.getRechargeurl();
	/**投标**/
	String BIDTESTURL = ParameterIpsUrl.getBidurl();
	/**自动投标**/
	String AUTOMATICBIDTESTURL = ParameterIpsUrl.getAutomaticbidurl();
	/**还款**/
	String  REPAYMRNTTESTURL = ParameterIpsUrl.getRepaymenturl();
	/**提现**/
	String  WITHDRAWALTESTURL = ParameterIpsUrl.getWithdrawalurl();
	/**账户余额查询**/
	String BALABCEINQUIRYTESTURL = ParameterIpsUrl.getBalabceinquiryurl();
	/**商户端获取银行列表查询(WS)**/
	String BANKLISTQUERYTESTURL = ParameterIpsUrl.getBanklistqeryurl();
	/**发布标同时到环讯登记*/
	String REGSUB=ParameterIpsUrl.getRegSub();
	/**转账地址*/
	String TRANSFERURL=ParameterIpsUrl.getTransferUrl();
	/**查询交易及用户信息的地址*/
	String CREDITWSQUERYURL=ParameterIpsUrl.getCreditWSQuery();
	/**自动授权签约*/
	String REPAYMENTSIGNURL=ParameterIpsUrl.getRepaymentSignUrl();
	/**调用webservice的方法**/
	/**账户余额**/
	String WEBBALANC = "QueryForAccBalance";
	/**获取银行列表**/
	String WEBBANK = "GetBankList";
	/**债权转让投标*/
	String BIDASSIGNMENTTESTURL=ParameterIpsUrl.getBidAssignment();
	/**自动投标规则*/
	String AUTOMATICTESTURL=ParameterIpsUrl.getAutomatic();
}
