package com.tpy.p2p.chesdai.spring.service;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.constant.Constant;
import org.springframework.stereotype.Service;

import com.baofoo.p2p.dto.receive.ResultDto;
import com.baofoo.p2p.dto.request.BalanceDto;
import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.baofoo.p2p.util.XMLBuild;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.constant.Enums;
import com.tpy.p2p.chesdai.entity.Adminuser;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.WithdrawApply;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.ExpensesInfo;
import com.tpy.p2p.pay.entity.RechargeInfo;
import com.tpy.p2p.pay.entity.RegisterInfo;
import com.tpy.p2p.pay.entity.RepaymentInvestor;
import com.tpy.p2p.pay.entity.RepaymentReturnInfo;
import com.tpy.p2p.pay.entity.RepaymentSignReturn;
import com.tpy.p2p.pay.entity.TenderAuditInfo;
import com.tpy.p2p.pay.entity.Transfer;
import com.tpy.p2p.pay.entity.WithdrawalInfo;
import com.tpy.p2p.pay.payservice.RegisterService;
import com.tpy.p2p.pay.util.ParameterIps;

/**
 * 环讯返回信息的业务处理
 * 
 * @author RanQiBing 2014-01-27
 * 
 */
@Service
public class ProcessingService {
	/**
	 * 通用方法
	 */
	@Resource
	private HibernateSupport dao;
	// /**
	// *
	// */
	// @Resource
	// private VisitorService visitorService;
	/**
	 * 银行信息
	 */
	@Resource
	private RechargesService rechargeService;

	@Resource
	private LoanManageService loanManageService;

	@Resource
	private UserInfoServices userInfoServices;

	@Resource
	private RequestService bfService;

	@Resource
	private ReceiveService receiveService;

	/**
	 * 查询流水账表
	 * 
	 * @param ips  ips唯一流水号
	 * @return 条数
	 */
	public Integer accountInfoNum(String ips) {
		String sql = "select count(id) from accountinfo a where a.ipsNumber=?";
		Object obj = dao.findObjectBySql(sql, ips);
		return Integer.parseInt(obj.toString());
	}

	/**
	 * 查询还款是否生成有还款记录
	 * 
	 * @param loanid
	 *            标号
	 * @return 条数
	 */
	public Integer repaymentNum(Long loanid) {
		String sql = "select count(id) from repaymentrecord a where a.loanSign_id=?";
		Object obj = dao.findObjectBySql(sql, loanid);
		return Integer.parseInt(obj.toString());
	}

	/**
	 * 修改标当前期的还款状态
	 * 
	 * @return
	 */
	public synchronized int updateRayment(Repaymentrecord repaymentrecord) {
		try {
			dao.update(repaymentrecord);
			return Constant.STATUES_ZERO;
		} catch (Exception e) {
			return Constant.STATUES_ONE;
		}
	}

	// public int getrepaymet
	/**
	 * 修改标的状态
	 * 
	 * @param loan
	 * @return
	 */
	public synchronized int updateLoan(Loansign loan) {
		try {
			dao.update(loan);
			return Constant.STATUES_ZERO;
		} catch (Exception e) {
			return Constant.STATUES_ONE;
		}
	}

	/**
	 * 用户注册
	 * 
	 * @param registerInfo
	 *            用户注册信息
	 * @param userbasics
	 *            用户基本信息
	 * @return <p>
	 *         true
	 *         </p>
	 *         成功
	 *         <p>
	 *         false
	 *         </p>
	 *         失败
	 */
	public Boolean registration(RegisterInfo registerInfo,
			Userbasicsinfo userbasics) {
		/** 调动存储过程 **/
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_REGISTRATION_UPDATE.toString(),
				userbasics.getId(), registerInfo.getpIpsAcctDate(),
				registerInfo.getpMerBillNo(), registerInfo.getpIpsAcctNo());
		return bool;
	}

	public Boolean registrationBF(Userbasicsinfo userbasics) {
		/** 调动存储过程 **/
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_REGISTRATION_UPDATE.toString(),
				userbasics.getId(), DateUtils.format("yyyyMMdd"), "KH"
						+ StringUtil.pMerBillNo(), userbasics
						.getUserrelationinfo().getPhone());
		return bool;
	}

	/**
	 * 用户充值返回信息处理
	 * 
	 * @param recharge 用户充值返回信息对象
	 * @return <p> true </p>  成功
	 *         <p> false</p>  失败
	 */
	public Boolean recharge(RechargeInfo recharge) {
		// 获取当前用户账户余额
		// BalanceInquiryInfo money = RegisterService.accountBalance(recharge
		// .getpIpsAcctNo());

		// 处理充值后的信息
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_RECHARGE_UPDATE.toString(),
				recharge.getpTrdAmt(), 		//充值金额
				recharge.getpMerBillNo(),	//订单号
				recharge.getpIpsBillNo(),	//充值编号
				recharge.getpMemo2(),
				Long.parseLong(recharge.getpMemo1()),
				0);

		LOG.info("recharge=(" + recharge.getpTrdAmt() + ";"
				+ recharge.getpMerBillNo() + ";" + recharge.getpIpsBillNo()
				+ ";" + recharge.getpMemo1() + ")"
				+ Enums.PROCEDURES.PROCEDURE_RECHARGE_UPDATE.toString());

		return bool;
	}

	/**
	 * 提现返回信息异步处理
	 * 
	 * @param withdrawalInfo
	 *            提现信息
	 * @param userbasicsinfo
	 *            用户信息
	 * @return <p>
	 *         true
	 *         </p>
	 *         成功
	 *         <p>
	 *         false
	 *         </p>
	 *         失败
	 */
	public Boolean withdrlRecord(WithdrawalInfo withdrawalInfo,
			Userbasicsinfo userbasicsinfo) {
		// 获取当前用户账户余额
		BalanceInquiryInfo money = RegisterService.accountBalance(userbasicsinfo.getUserfundinfo().getpIdentNo());
		Boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_WITHDRAWAL_MONEY.toString(),
				userbasicsinfo.getId(), withdrawalInfo.getpTrdAmt(),
				withdrawalInfo.getpDwDate(), money.getpBalance(),
				withdrawalInfo.getpIpsBillNo());
		return bool;
	}

	/**
	 * 宝付提现信息处理
	 * 
	 * @param withdrawalInfo
	 * @param userbasicsinfo
	 * @return
	 * @throws Exception
	 */
	public Boolean withdrlRecordByBF(WithdrawalInfo withdrawalInfo,
			WithdrawApply withdrawApply) throws Exception {
		// 获取当前用户账户余额
		String userId = withdrawApply.getUserbasicsinfo().getId() + "";
		BalanceDto dto = new BalanceDto(ParameterIps.getMercode(), userId);
		String xml = bfService.serv_AccountBalance(dto);
		ResultDto result = XMLBuild.parseXMLToEntity(xml, ResultDto.class);
		Boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_WITHDRAWAL_MONEY.toString(), userId,
				withdrawalInfo.getpTrdAmt(), withdrawalInfo.getpDwDate(),
				result.getBalance(), withdrawalInfo.getpIpsBillNo(),
				withdrawApply.getId());
		return bool;
	}

	/**
	 * 提现返回信息同步处理
	 * 
	 * @param withdrawalInfo
	 *            提现信息
	 * @param userbasicsinfo
	 *            用户信息
	 * @return <p>
	 *         true
	 *         </p>
	 *         成功
	 *         <p>
	 *         false
	 *         </p>
	 *         失败
	 */
	public Boolean withdrlwal(WithdrawalInfo withdrawalInfo,
			Userbasicsinfo userbasicsinfo) {

		Boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_WITHDRAWAL_RECORD.toString(),
				userbasicsinfo.getId(), withdrawalInfo.getpTrdAmt(),
				withdrawalInfo.getpMerBillNo(), withdrawalInfo.getpIpsBillNo(),
				withdrawalInfo.getpDwDate());
		return bool;
	}

	/**
	 * 放款操作
	 * 
	 * @param userbasicsinfo
	 *            债权人信息
	 * @param auditInfo
	 *            放款信息
	 * @return <p>
	 *         true
	 *         </p>
	 *         成功
	 *         <p>
	 *         false
	 *         </p>
	 *         失败
	 */
	public Boolean tenderAudit(Userbasicsinfo userbasicsinfo,
			TenderAuditInfo auditInfo, HttpServletRequest request,
			Double myMoney) {

		Adminuser admin = (Adminuser) request.getSession().getAttribute(
				Constant.ADMINLOGIN_SUCCESS);
		// 获取当前用户账户余额
		BalanceInquiryInfo money = RegisterService
				.accountBalance(userbasicsinfo.getUserfundinfo().getpIdentNo());
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_LIANS_INSERT.toString(),
				Double.parseDouble(auditInfo.getpMemo1()),
				auditInfo.getpMemo2(), admin.getId(),
				Long.parseLong(auditInfo.getpMemo3()), userbasicsinfo.getId(),
				money.getpBalance(), auditInfo.getpBidNo(),
				auditInfo.getpIpsBillNo(), myMoney);
		return bool;
	}

	/**
	 * 还款信息返回信息同步处理
	 * 
	 * @param info
	 *            返回信息对象
	 * @param user
	 *            用户信息
	 * @param creditor
	 *            债权人信息
	 * @return <p>
	 *         true
	 *         </p>
	 *         成功
	 *         <p>
	 *         false
	 *         </p>
	 *         失败
	 */
	public Boolean repayment(RepaymentReturnInfo info, Double money,
			Double interest, Adminuser admin, String cont) {
		String time = "";
		try {
			time = DateUtils.format("yyyyMMdd", info.getpRepaymentDate(),
					"yyyy-MM-dd");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCESURE_REPAYMENT_RECORD.toString(),
				admin.getId(), cont, time, info.getpMemo1(), money, interest,
				info.getpMerBillNo(), info.getpIpsBillNo());
		return bool;
	}

	/**
	 * 还款信息返回信息异步处理
	 * 
	 * @param userid
	 *            用户编号
	 * @param loanid
	 *            标编号
	 * @param pIdentNo
	 *            用户ips账号
	 * @param money
	 *            本金
	 * @param interest
	 *            利息
	 * @param penalty
	 *            违约金
	 * @param ips
	 *            ips还款流水号
	 * @param state
	 *            是否需要修改冻结金额
	 * @param managementFee
	 *            管理费
	 * @return <p>
	 *         true
	 *         </p>
	 *         成功
	 *         <p>
	 *         false
	 *         </p>
	 *         失败
	 * @throws Exception 
	 */
	public Boolean repaymentMoney(Long userid, Long loanid, String pIdentNo,
			Double money, Double interest, Double penalty, String ips,
			Integer state, Double management,int type) throws Exception {
		// 获取用户账户信息
		BalanceDto dto = new BalanceDto(ParameterIps.getMercode(), userid.toString());
		String xml = bfService.serv_AccountBalance(dto);
		ResultDto result = XMLBuild.parseXMLToEntity(xml, ResultDto.class);

		System.out.println(result.getBalance());
		System.out.println(ips);
		System.out.println(interest);
		System.out.println(money);
		System.out.println(penalty);
		System.out.println(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		System.out.println(userid);
		System.out.println(loanid);
		System.out.println(state);
		System.out.println(management);
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_REPAYMENT_MONEY.toString(),
				result.getBalance(), ips, interest, money, penalty,
				DateUtils.format("yyyy-MM-dd HH:mm:ss"), userid, loanid, state,
				management,type);
		return bool;
	}

	public boolean updateState(Long id, int status) {
		return dao
				.callProcedureVoid(
						Enums.PROCEDURES.PROCEDURE_PRODUCT_STATE.toString(),
						id, status);
	}

	/**
	 * 获取所有未完成的净值标
	 * 
	 * @return 返回所有的净值标
	 */
	public List<Loansign> getLoan() {
		String hql = "from Loansign l where l.loansignType.id=? and l.loanstate!=?";
		List<Loansign> list = dao.find(hql,
				Constant.STATUES_FOUR,
				Constant.STATUES_FOUR);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	public void getRepaymentBF(List<RepaymentInvestor> investors,
			String pIpsBillNo, Repaymentrecord repaymentrecord,
			ExpensesInfo expensesInfo) throws Exception {
		//记录借款人信息
		this.repaymentMoney(expensesInfo.getUserId(), expensesInfo.getLoanid(),
				expensesInfo.getIpsNumber(), expensesInfo.getMoney(),
				expensesInfo.getInterest(), expensesInfo.getPenalty(),
				pIpsBillNo, 0, expensesInfo.getManagement(),0);
		// 得到投资人还款的所有信息
		List<ExpensesInfo> expensList = loanManageService
				.investorInteest(repaymentrecord);
		for (RepaymentInvestor reInfo : investors) {
			for (int j = 0; j < expensList.size(); j++) {
				ExpensesInfo info = expensList.get(j);
				if (reInfo.getpInAcctNo().equals(info.getIpsNumber())) {
					//if (reInfo.getpStatus().equals("Y")) {
						this.repaymentMoney(info.getUserId(),
								repaymentrecord.getLoansign().getId(),
								reInfo.getpInAcctNo(), info.getMoney(),
								info.getInterest(), info.getPenalty(),
								pIpsBillNo, 1,
								info.getManagement(),1);
						break;
					//}
				}
			}
		}
		// return null;
	}

	/**
	 * 修改用户的资金账户和流水帐
	 * 
	 * @param userbasicsinfo
	 * @param transfer
	 * @param request
	 * @param mgtMoney
	 * @return
	 */
	public boolean tenderAudit(Userbasicsinfo userbasicsinfo,
			Transfer transfer, HttpServletRequest request, Double mgtMoney) {
		// Adminuser admin = (Adminuser)
		// request.getSession().getAttribute(Constant.ADMINLOGIN_SUCCESS);
		String[] ids = transfer.getpMemo3().split(":");
		// 获取当前用户账户余额
		BalanceInquiryInfo money = RegisterService
				.accountBalance(userbasicsinfo.getUserfundinfo().getpIdentNo());
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_LIANS_INSERT.toString(),
				Double.parseDouble(transfer.getpMemo1()), transfer.getpMemo2(),
				ids[1], ids[0], userbasicsinfo.getId(), money.getpBalance(),
				transfer.getpBidNo(), transfer.getpIpsBillNo(), mgtMoney);

		return bool;
	}

	public boolean tenderAuditBF(Userbasicsinfo userbasicsinfo,
			Transfer transfer, HttpServletRequest request, Double mgtMoney)
			throws Exception {
		// request.getSession().getAttribute(Constant.ADMINLOGIN_SUCCESS);
		String[] ids = transfer.getpMemo3().split(":");
		String userId = userbasicsinfo.getId().toString();
		// 获取当前用户账户余额
		BalanceDto dto = new BalanceDto(ParameterIps.getMercode(), userId);
		String xml = bfService.serv_AccountBalance(dto);
		ResultDto result = XMLBuild.parseXMLToEntity(xml, ResultDto.class);
		boolean bool = dao.callProcedureVoid(
				Enums.PROCEDURES.PROCEDURE_LIANS_INSERT.toString(),
				Double.parseDouble(transfer.getpMemo1()), transfer.getpMemo2(), ids[1], ids[0], userId, result.getBalance(), transfer.getpBidNo(), transfer.getpIpsBillNo(), mgtMoney);

		return bool;
	}

	/**
	 * 更新自动还款签约状态
	 * 
	 * @param repaySign
	 * @return
	 */
	public boolean updateRepaySignState(RepaymentSignReturn repaySign) {
		int updateCount = dao
				.executeSql(
						"UPDATE userbasicsinfo SET  repaySignStatus =1,repayAuthNo=? WHERE id=(SELECT id FROM userfundinfo WHERE userfundinfo.pIdentNo=?)",
						repaySign.getpIpsAuthNo(), repaySign.getpIpsAcctNo());
		if (updateCount == 0)
			return false;
		else
			return true;
	}

	/**
	 * 更新自动还款签约状态
	 * 
	 * @param repaySign
	 * @return
	 */
	public boolean isRepaySignState(RepaymentSignReturn repaySign) {
		int isRepaySign = dao
				.queryNumberSql(
						"SELECT  repaySignStatus FROM userbasicsinfo,userfundinfo WHERE userbasicsinfo.id=userfundinfo.id AND userfundinfo.pIdentNo=?",
						repaySign.getpIpsAcctNo()).intValue();
		if (isRepaySign == 0)
			return false;
		else
			return true;
	}
}
