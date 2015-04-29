package com.tpy.p2p.chesdai.admin.spring.controller.loan;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.*;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.chesdai.model.RechargeModel;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import com.tpy.base.sms.SmsResult;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.ProcessingService;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.chesdai.util.DwzResponseUtil;
import com.tpy.p2p.core.service.*;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.tpy.p2p.pay.entity.Transfer;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.baofoo.p2p.dto.receive.ResultDto;
import com.baofoo.p2p.dto.request.p2p.Action;
import com.baofoo.p2p.dto.request.p2p.P2pRequestDto;
import com.baofoo.p2p.service.ReceiveService;
import com.baofoo.p2p.service.RequestService;
import com.tpy.base.model.PageModel;
import com.tpy.base.sms.SmsResult;
import com.tpy.base.spring.service.BaseSmsService;
import com.tpy.base.util.ArrayToJson;
import com.tpy.base.util.DateUtils;
import com.tpy.base.util.LOG;
import com.tpy.p2p.chesdai.admin.spring.service.UserInfoServices;
import com.tpy.p2p.chesdai.admin.spring.service.loan.LoansignTypeService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.constant.Enums;
import com.tpy.p2p.chesdai.model.RechargeModel;
import com.tpy.p2p.chesdai.spring.service.EmailService;
import com.tpy.p2p.chesdai.spring.service.LoanInfoService;
import com.tpy.p2p.chesdai.spring.service.ProcessingService;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.chesdai.util.DwzResponseUtil;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import com.tpy.p2p.core.service.BaseLoansignService;
import com.tpy.p2p.core.service.CommentService;
import com.tpy.p2p.core.service.LoanrecordService;
import com.tpy.p2p.core.service.RepaymentSortService;
import com.tpy.p2p.core.service.RepaymentrecordService;
import com.tpy.p2p.pay.entity.BalanceInquiryInfo;
import com.tpy.p2p.pay.entity.RegisterSubject;
import com.tpy.p2p.pay.entity.ReturnInfo;
import com.tpy.p2p.pay.entity.Transfer;
import com.tpy.p2p.pay.payservice.RegisterService;
import com.tpy.p2p.pay.util.ParameterIps;
import com.tpy.p2p.pay.util.XmlParsingBean;

import freemarker.template.TemplateException;

/**
 * 通用标Controller
 * 
 * @author longyang
 * 
 */
@Controller
@RequestMapping("/baseLoanSign")
public class BaseLoanSignController {

	/** baseLoansignService 通用services */
	@Resource
	private BaseLoansignService baseLoansignService;

	/** loanSignQuery 借款标查询 */
	@Autowired
	private LoanSignQuery loanSignQuery;

	/** rechargeModel 导出实体 */
	@Resource
	private RechargeModel rechargeModel;

	/** loanrecordService 认购记录services */
	@Resource
	private LoanrecordService loanrecordService;

	/** repaymentrecordService 还款记录 */
	@Resource
	private RepaymentrecordService repaymentrecordService;

	/** attachmentService 借款标附件 */
	@Resource
	private AttachmentService attachmentService;

	/** commentService 评论Service */
	@Resource
	private CommentService commentService;

	@Resource
	private ProcessingService processingService;

	@Resource
	private UserInfoServices infoServices;

	@Resource
	private BaseSmsService baseSmsService;

	@Resource
	private EmailService emailService;

	@Resource
	private LoansignTypeService loansignTypeService;

	@Resource
	private RequestService bfService;

	@Resource
	private LoanInfoService infoService;

	@Resource
	private ReceiveService receiveService;

	@Resource
	private RegisterService registerService;

	@Resource
    HibernateSupport dao;

	/**
	 * <p>
	 * Title: queryBorrowersbaseList
	 * </p>
	 * <p>
	 * Description: 查询所有的借款人
	 * </p>
	 * 
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @param page
	 *            分页page
	 * @param conditions
	 *            查询条件
	 * @param request
	 *            请求
	 * @return 列表展示页面
	 */
	@RequestMapping("borrowersbaseList")
	public String queryBorrowersbaseList(
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "cardno", defaultValue = "", required = false) String cardno,
			PageModel page, String conditions, HttpServletRequest request) {
		// 查询借款人条件
		Object count = baseLoansignService.queryBorrowersbasecount(username,cardno);
		page.setTotalCount(Integer.parseInt(count.toString()));
		// 分页查询所有借款人
		Object obj = baseLoansignService.queryBorrowersbaseList(page, username,cardno);
		request.setAttribute("list", obj);
		request.setAttribute("page", page);
		request.setAttribute("username", username.trim());
		request.setAttribute("cardno", cardno);
		return "WEB-INF/views/admin/loansign/borrowerlist";
	}

	/**
	 * <p>
	 * Title: queryBorrowersbaseList
	 * </p>
	 * <p>
	 * Description: 查询所有的债权转让
	 * </p>
	 * 
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @param page
	 *            分页page
	 * @param conditions
	 *            查询条件
	 * @param request
	 *            请求
	 * @return 列表展示页面
	 */
	@RequestMapping("assignmentbaseList")
	public String queryAssignmentbaseList(
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "loanTitle", defaultValue = "", required = false) String loanTitle,
			PageModel page, String conditions, HttpServletRequest request) {
		// 查询借款人条件
		Object count = baseLoansignService.queryAssignmentbasecount(username,
				loanTitle);
		page.setTotalCount(Integer.parseInt(count.toString()));
		// 分页查询所有借款人
		Object obj = baseLoansignService.queryAssignmentbaseList(page,
				username, loanTitle);
		request.setAttribute("list", obj);
		request.setAttribute("page", page);
		request.setAttribute("username", username.trim());
		request.setAttribute("loanTitle", loanTitle);
		return "WEB-INF/views/admin/loansign/borrowerlistflow";
	}

	/**
	 * <p>
	 * Title: queryBorrowersbaseList
	 * </p>
	 * <p>
	 * Description: 查询所有的借款人(针对普通标的情况)
	 * </p>
	 * 
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @param page
	 *            分页page
	 * @param conditions
	 *            查询条件
	 * @param request
	 *            请求
	 * @return 列表展示页面
	 */
	@RequestMapping("borrowersbaseLists")
	public String queryBorrowersbaseLists(
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "cardno", defaultValue = "", required = false) String cardno,
			PageModel page, String conditions, HttpServletRequest request) {
		// 查询借款人条件
		Object count = baseLoansignService.queryBorrowersbasecounts(username,
				cardno);
		page.setTotalCount(Integer.parseInt(count.toString()));
		// 分页查询所有借款人
		Object obj = baseLoansignService.queryBorrowersbaseLists(page,
				username, cardno);
		request.setAttribute("list", obj);
		request.setAttribute("page", page);
		request.getSession().setAttribute("username", username);
		request.setAttribute("cardno", cardno);
		return "WEB-INF/views/admin/loansign/borrowerlists";

	}

	/**
	 * <p>
	 * Title: loanrecordList
	 * </p>
	 * <p>
	 * Description: 认购记录列表
	 * </p>
	 * 
	 * @param start
	 *            开始
	 * @param limit
	 *            结束
	 * @param id
	 *            编号
	 * @param request
	 *            请求
	 * @return 结果集
	 */
	@ResponseBody
	@RequestMapping(value = { "loanrecordList", "/" })
	public JSONObject loanrecordList(
			@RequestParam(value = "start", defaultValue = "0", required = false) int start,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request) {

		// 得到总条数
		Object count = loanrecordService.getLoanrecordCount(id);
		// 分页数据源
		List list = loanrecordService.queryLoanrecordList(start, limit, id, 1);
		JSONArray jsonlist = loanrecordService.getJSONArrayByList(list);

		JSONObject resultjson = new JSONObject();
		// 将数据源封装为json对象（命名必须rows）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", count);
		return resultjson;
	}

	/**
	 * <p>
	 * Title: loanrecordAssigmentList
	 * </p>
	 * <p>
	 * Description: 债权转让认购记录列表
	 * </p>
	 * 
	 * @param start
	 *            开始
	 * @param limit
	 *            结束
	 * @param id
	 *            编号
	 * @param request
	 *            请求
	 * @return 结果集
	 */
	@ResponseBody
	@RequestMapping(value = { "assigmentrecordList", "/" })
	public JSONObject assigmentrecordList(
			@RequestParam(value = "start", defaultValue = "0", required = false) int start,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request) {

		// 得到总条数
		Object count = loanrecordService.getAssignmentCount(id);
		// 分页数据源
		List list = loanrecordService.queryAssignmentList(start, limit, id, 1);
		JSONArray jsonlist = loanrecordService.getJSONArrayByList(list);

		JSONObject resultjson = new JSONObject();
		// 将数据源封装为json对象（命名必须rows）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", count);
		return resultjson;
	}

	/**
	 * <p>
	 * Title: repaymentRecordList
	 * </p>
	 * <p>
	 * Description: 还款记录列表
	 * </p>
	 * 
	 * @param start
	 *            开始
	 * @param limit
	 *            结束
	 * @param id
	 *            借款标编号
	 * @param request
	 *            请求
	 * @return 集合对象
	 */
	@ResponseBody
	@RequestMapping(value = { "repaymentRecordList", "/" })
	public JSONObject repaymentRecordList(
			@RequestParam(value = "start", defaultValue = "0", required = false) int start,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request) {

		// 得到总条数
		Object count = repaymentrecordService.getrepaymentRecordCount(id);
		// 分页数据源
		List list = repaymentrecordService.queryRepaymentrecordList(start,
				limit, id);
		JSONArray jsonlist = repaymentrecordService.getJSONArrayByList(list);

		JSONObject resultjson = new JSONObject();
		// 将数据源封装为json对象（命名必须rows）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", count);
		return resultjson;
	}

	/**
	 * <p>
	 * Title: AttachmentList
	 * </p>
	 * <p>
	 * Description: 附件信息列表
	 * </p>
	 * 
	 * @param start
	 *            开始
	 * @param limit
	 *            结束
	 * @param id
	 *            借款标编号
	 * @param request
	 *            请求
	 * @return 列表对象
	 */
	@ResponseBody
	@RequestMapping(value = { "attachmentList", "/" })
	public JSONObject attachmentList(
			@RequestParam(value = "start", defaultValue = "0", required = false) int start,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request) {

		JSONArray jsonlist = new JSONArray();

		// 得到总条数
		Object count = attachmentService.getAttachmentCount(id);
		// 分页数据源
		List list = attachmentService.queryAttachmentList(start, limit, id);
		String titles = "id,attachmentName,attachmentType,uploadTime,realname";
		ArrayToJson.arrayToJson(titles, list, jsonlist);

		JSONObject resultjson = new JSONObject();
		// 将数据源封装为json对象（命名必须rows）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", count);
		return resultjson;
	}

	/**
	 * <p>
	 * Title: CommentList
	 * </p>
	 * <p>
	 * Description: 评论列表
	 * </p>
	 * 
	 * @param start
	 *            开始
	 * @param limit
	 *            结束
	 * @param id
	 *            借款标编号
	 * @param request
	 *            请求
	 * @return 列表对象
	 */
	@ResponseBody
	@RequestMapping(value = { "commentList", "/" })
	public JSONObject commentList(
			@RequestParam(value = "start", defaultValue = "0", required = false) int start,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit,
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request) {

		JSONArray jsonlist = new JSONArray();
		// 得到总条数
		Object count = commentService.getCommentCount(id);
		// 分页数据源
		List list = commentService.queryCommentList(start, limit, id);
		String titles = "id,cmtcontent,name,cmtReply,cmtIsShow";
		ArrayToJson.arrayToJson(titles, list, jsonlist);
		JSONObject resultjson = new JSONObject();
		// 将数据源封装为json对象（命名必须rows）
		resultjson.element("rows", jsonlist);
		// 总条数(命名必须total)
		resultjson.element("total", count);
		return resultjson;
	}

	/**
	 * <p>
	 * Title: deleteone
	 * </p>
	 * <p>
	 * Description: 删除一个未发布的借款标
	 * </p>
	 * 
	 * @param id
	 *            借款标编号
	 * @return 受影响次数
	 */
	@ResponseBody
	@RequestMapping(value = { "/deleteAll" })
	public int deleteOne(String id) {
		return baseLoansignService.deleteone(id);
	}

	/**
	 * <p>
	 * Title: outPutLoanrecordExcel
	 * </p>
	 * <p>
	 * Description: 导出出借记录
	 * </p>
	 * 
	 * @param id
	 *            编号
	 * @param response
	 *            response
	 */
	@RequestMapping("outPutLoanrecordExcel")
	public void outPutLoanrecordExcel(int id, HttpServletResponse response) {

		// 标题
		String[] header = new String[] { "出借人", "年化利率", "投标金额", "支付状态", "投标时间" };
		// 行宽度
		Integer[] column = new Integer[] { 8, 10, 12, 10, 12 };
		// 获取数据源
		List list = loanrecordService.queryLoanrecordList(0, 0, id, 2);

		List<Map<String, String>> content = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;
		for (Object obj : list) {
			Object[] str = (Object[]) obj;
			map = new HashMap<String, String>();
			map.put("出借人", str[0] + "");
			map.put("年化利率", Arith.round(new BigDecimal(str[1].toString()), 2) + "%");
			map.put("投标金额", Arith.round(new BigDecimal(str[2].toString()), 2) + "元");
			map.put("支付状态", str[3] + "");
			map.put("投标时间", str[4] + "");
			content.add(map);
		}
		// 下载excel
		rechargeModel.downloadExcel("出借记录", column, header, content, response);
	}

	/**
	 * <p>
	 * Title: publish
	 * </p>
	 * <p>
	 * Description: 发布(普通标，天标，秒标)
	 * </p>
	 * 
	 * @param loanSignId  标号
	 * @return 数字状态1.成功2.状态不是未发布的3发布报错
	 * @throws Exception  异常
	 */
	@ResponseBody
	@RequestMapping("/publish")
	public String publish(String loanSignId, HttpServletRequest request) {
		Loansign loansign = loanSignQuery.getLoansignById(loanSignId);
		// 借款标状态：1未发布、2进行中、3回款中、4已完成
		if (loansign.getLoanstate() == 1) {
			if (!baseLoansignService.publish(loansign)) {
				// publish is fail
				loansign.setLoanstate(1);
				baseLoansignService.update(loansign);
			}
		}
		return String.valueOf(loansign.getLoanstate());

		// // 2.发布
		// // 2014-8-15添加环讯接口
		//
		// RegisterSubject subject = null;
		// // 0代表保证金暂时设置,1代表“新增”
		// subject = new
		// RegisterSubject(loansign,loansign.getLoansignbasics().getGuaranteesAmt()==null?"0.00":loansign.getLoansignbasics().getGuaranteesAmt().toString(),
		// "1");
		// try {
		// request.getSession().setAttribute("map",
		// baseLoansignService.encryption(subject));
		// //TODO DWZ 页面跳转
		// return "3";
		// } catch (IOException | TemplateException e) {
		// e.printStackTrace();
		// return "2";
		// }

	}

	/**
	 * 标结束
	 * 进行中的标，且到期未满标，可以结束（流标）
	 * 已完成还款的标，可以结束
	 * 
	 * @param loanSignId
	 *            标号
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loanEnd_bak")
	public String loanEnd_bak(String loanSignId, HttpServletRequest request) {
		// 获取标
		Loansign loansign = loanSignQuery.getLoansignById(loanSignId);
		loanSignId = String.valueOf(loansign.getId());
		// 未发布的标，不能结束
		if (loansign.getLoanstate() == 1) {
			return "6";
		}

		boolean endFlag = false;
		int gap = 0;
		// 已经发布的，进行中的标的,满标没有?招标期限过了没有?
		 /** 借款标状态：1未发布、2进行中、3回款中、4已完成 、5投标处理中 */
		if (loansign.getLoanstate() == 2 && !loanSignQuery.isFull(loanSignId)) {

			try {
				gap = -DateUtils.differenceDateSimple(loansign.getPublishTime());
				if (gap > loansign.getLoansignbasics().getBidTime()) {
					endFlag = true;
				}
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}

		// 回款中的标，完成最后一期还款，结束
		if (loansign.getLoanstate() == 3) {
			int count = repaymentrecordService.getrepaymentRecordCount(Integer
					.parseInt(loanSignId));
			List objs = repaymentrecordService.queryRepaymentrecordList(0,
					count, Integer.parseInt(loanSignId));

			// 排序
			RepaymentSortService sort = new RepaymentSortService();
			// Collections.sort(records, sort);
			Object[] record = (Object[]) objs.get(objs.size() - 1);
			try {
				gap = DateUtils.differenceDateSimple(record[2].toString());
				if (gap < 0) {
					endFlag = true;
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// 结束
		if (endFlag) {

			// TODO 0代表保证金暂时设置,2代表“新增”
			P2pRequestDto entity = new P2pRequestDto();
			try {
				Set<Loanrecord> loanrecords = loansign.getLoanrecords();
				if (loanrecords.size() > 0) {
					entity.setMerchant_id(ParameterIps.getMercode());
					String order_id = "DDH" + System.currentTimeMillis();
					entity.setOrder_id(order_id);
					entity.setCus_id(loanSignId);
					entity.setCus_name(loanSignId);
					entity.setBrw_id(String.valueOf(loansign.getUserbasicsinfo().getId()));
					entity.setReq_time(String.valueOf(System.currentTimeMillis()));

					List<Action> actions = new ArrayList<Action>();

					for (Loanrecord lr : loanrecords) {
						Action action = new Action();
						action.setUser_id(lr.getUserbasicsinfo().getId() + "");
						action.setAmount(lr.getTenderMoney().toString());
						actions.add(action);
					}

					entity.setActions(actions);
					entity.setFee("0");
					entity.setAction_type("3");
					String xml = bfService.serv_p2pRequest(entity);
					LOG.info("流标业务|request="+entity.getRequestXml());
					LOG.info("流标业务|response="+xml);
					ResultDto resultDto = receiveService.serv_p2pRequest(xml);
					if ((Constant.BF_SUCCESS).equals(resultDto.getCode())) {
						loansign = loanSignQuery.getLoansignById(loanSignId);
						if (loansign.getEndTime() == null) {
							Loansignbasics lb = loansign.getLoansignbasics();
							lb.setpIpsBillNo(order_id);
							loansign.setLoansignbasics(lb);
							loansign.setLoanstate(4);
							loansign.setEndTime(DateUtils.formatSimple());
							baseLoansignService.endLoan(loansign);
							return "0";
						} else {
							return "3";
						}
					}else{
						return "2";
					}
				}else{
					if (loansign.getEndTime() == null) {
						Loansignbasics lb = loansign.getLoansignbasics();
						lb.setpIpsBillNo("000000000000");
						loansign.setLoansignbasics(lb);
						loansign.setLoanstate(4);
						loansign.setEndTime(DateUtils.formatSimple());
						baseLoansignService.endLoan(loansign);
						return "0";
					} else {
						return "3";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "2";
			}
		}
		return "3";
	}

	/**
	 * 标结束
	 * 进行中的标，且到期未满标，可以结束（流标）
	 * 已完成还款的标，可以结束
	 *
	 * @param loanSignId
	 *            标号
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loanEnd")
	public String loanEnd(String loanSignId, HttpServletRequest request) {
		// 获取标
		Loansign loansign = loanSignQuery.getLoansignById(loanSignId);
		loanSignId = String.valueOf(loansign.getId());
		// 未发布的标，不能结束
		if (loansign.getLoanstate() == 1) {
			return "6";
		}

		boolean endFlag = false;
		int gap = 0;
		// 已经发布的，进行中的标的,满标没有?招标期限过了没有?
		/** 借款标状态：1未发布、2进行中、3回款中、4已完成 、5投标处理中 */
		if (loansign.getLoanstate() == 2 && !loanSignQuery.isFull(loanSignId)) {

			try {
				gap = -DateUtils.differenceDateSimple(loansign.getPublishTime());
				if (gap > loansign.getLoansignbasics().getBidTime()) {
					endFlag = true;
				}
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}

		// 回款中的标，完成最后一期还款，结束
		if (loansign.getLoanstate() == 3) {
			int count = repaymentrecordService.getrepaymentRecordCount(Integer.parseInt(loanSignId));
			List objs = repaymentrecordService.queryRepaymentrecordList(0,count, Integer.parseInt(loanSignId));

			// 排序
			RepaymentSortService sort = new RepaymentSortService();
			// Collections.sort(records, sort);
			Object[] record = (Object[]) objs.get(objs.size() - 1);
			try {
				gap = DateUtils.differenceDateSimple(record[2].toString());
				if (gap < 0) {
					endFlag = true;
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// 结束
		if (endFlag) {

			// TODO 0代表保证金暂时设置,2代表“新增”
			try {
				Set<Loanrecord> loanrecords = loansign.getLoanrecords();
				if (loanrecords.size() > 0) {
					List<Loanrecord> loanrecordList =  baseLoansignService.getLoanrecord(Long.parseLong(loanSignId));

					//流标,解冻并回补资金
					baseLoansignService.rollbackFrozenAmt(loanrecordList);

					loansign = loanSignQuery.getLoansignById(loanSignId);
					if (loansign.getEndTime() == null) {
						Loansignbasics lb = loansign.getLoansignbasics();
						lb.setpIpsBillNo("111111111111");	//商户订单
						loansign.setLoansignbasics(lb);
						loansign.setLoanstate(4);
						loansign.setEndTime(DateUtils.formatSimple());
						baseLoansignService.endLoan(loansign);
						return "0";
					} else {
						return "3";
					}
				}else{
					if (loansign.getEndTime() == null) {
						Loansignbasics lb = loansign.getLoansignbasics();
						lb.setpIpsBillNo("000000000000");
						loansign.setLoansignbasics(lb);
						loansign.setLoanstate(4);
						loansign.setEndTime(DateUtils.formatSimple());
						baseLoansignService.endLoan(loansign);
						return "0";
					} else {
						return "3";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "2";
			}
		}
		return "3";
	}


	@RequestMapping("gotoIPS.htm")
	public String publishToIps() {
		return "WEB-INF/views/regSub_news";
	}

	/**
	 * 标的登记（发布、结束） 接收IPS返回标的注册信息 同步时不操作数据
	 * 
	 * @param info
	 *            返回的数据
	 * @param request
	 * @return
	 * @throws
	 */
	@RequestMapping("pubback.htm")
	public String pubBack(ReturnInfo info, HttpServletRequest request) {
		Loansign loansign = null;
		RegisterSubject subject = null;
		// 标新增,ips同步返回，跳到受理页面
		if (info.getpErrCode().equals(
				Constant.ADD_LOANSIGN)) {
			return "WEB-INF/views/ipsReceived";

			// 标结束,ips同步返回,跳到受理页面
		} else if (info.getpErrCode().equals(
				Constant.ENDING_LOANSIGN)) {
			return "WEB-INF/views/ipsReceived";
		} else { // if(info.getpErrCode().equals(Constant.FAIL_LOANSIGN)){
			return "WEB-INF/views/failure";
		}
	}

	/**
	 * 即将到期的标
	 * 
	 * @param page
	 *            分页
	 * @param loanType
	 *            借款标类型
	 * @param request
	 *            请求
	 * @return 页面
	 */
	@RequestMapping("toLoanSignExpiring")
	public ModelAndView toLoanSignExpiring(PageModel page, int loanType,
			HttpServletRequest request) {
		request.setAttribute("loanSignExpir",
				baseLoansignService.findExpirLoanSign(page, loanType));
		request.setAttribute("loanType", loanType);
		request.setAttribute("page", page);
		return new ModelAndView("WEB-INF/views/admin/loansign/loansignexpiring");
	}

	/**
	 * 通过宝付进行放款操作
	 * 
	 * @param id
	 *            标编号
	 * @return 返回放款情况
	 */
	@RequestMapping("/credit_bak")
	@ResponseBody
	public int credit_bak(String id, HttpServletRequest request,
			HttpServletResponse response) {

		// 获取后台操作人员信息
		Adminuser admin = (Adminuser) request.getSession().getAttribute(
				Constant.ADMINLOGIN_SUCCESS);
		// 获取标的情况
		Loansign loan = loanSignQuery.getLoansignById(id);

		// 判断该标是否能放款
		int state = Constant.STATUES_ZERO;
		// 1、检查是否可以放款
		if (!loan.getLoanstate().equals(
				Constant.STATUES_TWO)) {// 是否是进行中
			state = Constant.STATUES_TWO;
		}
		// 满标才能放款
		if (state == Constant.STATUES_ZERO
				&& !loanSignQuery.isFull(id)) {
			state = Constant.STATUES_THERE;
		}

		if (state == Constant.STATUES_ZERO) {
			// 封装标的放款实体
			boolean bool = baseLoansignService.loanerVip(loan);
			Transfer transfer = new Transfer(loan, "1", "1", admin.getId(),
					bool);
			try {
				String userId = loan.getUserbasicsinfo().getId().toString();
				P2pRequestDto requestDto = new P2pRequestDto();
				requestDto.setAction_type("2");
				List<Action> actions = new ArrayList<Action>();
				Action action = new Action();
				action.setAmount(loan.getIssueLoan().toString());
				// is_voucher=0表示借款人(唯一)
				action.setIs_voucher("0");
				action.setUser_id(userId);
				actions.add(action);
				requestDto.setActions(actions);
				requestDto.setBrw_id(userId);
				requestDto.setCus_id(loan.getLoansignbasics().getpBidNo());
				requestDto.setCus_name(loan.getLoansignbasics().getLoanTitle());
				// rquestDto.setFee(loan.getShouldPmfee().toString());
				requestDto.setFee("0");
				requestDto.setMerchant_id(com.tpy.p2p.pay.util.ParameterIps.getMercode());
				requestDto.setOrder_id(transfer.getpMerBillNo());
				requestDto.setReq_time(String.valueOf(System.currentTimeMillis()));
				LOG.info("放款信息:order_id=" + requestDto.getOrder_id() + ",标名称=" + requestDto.getCus_name() + ",标ID=" + requestDto.getCus_id());
				String xml = bfService.serv_p2pRequest(requestDto);

				ResultDto resultDto = receiveService.serv_p2pRequest(xml);
				// 返回成功进行处理
				if (Constant.BF_SUCCESS.equals(resultDto.getCode())) {
					// 判断数据是否已处理
					int num = processingService.accountInfoNum(resultDto
							.getOrder_id());
					if (num <= 0) {
						// 对借款人账户的处理 boolean
						bool = processingService.tenderAuditBF(
								loan.getUserbasicsinfo(), transfer, request,
								loan.getLoansignbasics().getMgtMoney());
						if (!bool) {
							Log.error("宝付放款成功-->我方放款失败-->数据处理失败-->还款ips编号:"
									+ transfer.getpIpsBillNo() + "还款标号:"
									+ loan.getLoansignbasics().getpBidNo());
						}
					}
					// 当标的类型不为流转标的时候生成还款计划
					if (!loan
							.getLoanType()
							.equals(Constant.STATUES_FOUR)) { // 生成还款计划
						try {
							int nums = processingService.repaymentNum(loan
									.getId());
							if (nums <= 0) {
								baseLoansignService.repaymentRecords(loan);
							}
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}

					Log.error("宝付放款受理-->还款订单号:" + "还款标号:" + loan.getLoansignbasics().getpBidNo());
					state = Constant.STATUES_FIVE;
					/*
					 * if (ParameterIps.pianText(info)) { TenderAuditInfo
					 * auditInfo = (TenderAuditInfo) XmlParsingBean
					 * .simplexml1Object(info.getP3DesXmlPara(), new
					 * Transfer()); // 对借款人账户的处理 boolean bool =
					 * processingService.tenderAudit( loan.getUserbasicsinfo(),
					 * auditInfo, request,
					 * loan.getLoansignbasics().getMgtMoney()); if (!bool) {
					 * Log.error("环迅放款成功-->我放放款失败-->数据处理失败-->还款ips编号:" +
					 * auditInfo.getpIpsBillNo() + "还款标号:" + loan.getId());
					 * state =
					 * Constant.STATUES_FOUR;
					 * } // 生成还款计划 baseLoansignService.repaymentRecords(loan); }
					 * else { Log.error("该次放款信息不是由环迅返回"); state =
					 * Constant.STATUES_FOUR;
					 * }
					 */
				} else {
					Log.error("宝付放款失败");
					LOG.info("放款失败->" + resultDto.getCode());
					state = Constant.STATUES_FOUR;
				}
			} catch (Exception e) {
				state = Constant.STATUES_FOUR;
				e.printStackTrace();
			}
		}
		return state;
	}



	/**
	 * 进行放款操作
	 *
	 * @param id 标编号
	 * @return 返回放款情况
	 */
	@RequestMapping("/credit")
	@ResponseBody
	@Transactional
	public int credit(String id, HttpServletRequest request,
					  HttpServletResponse response) {

		// 获取后台操作人员信息
		Adminuser admin = (Adminuser) request.getSession().getAttribute(Constant.ADMINLOGIN_SUCCESS);
		// 获取标的情况
		Loansign loan = loanSignQuery.getLoansignById(id);

		// 判断该标是否能放款
		int state = Constant.STATUES_ZERO;
		// 1、检查是否可以放款
		if (!loan.getLoanstate().equals(Constant.STATUES_TWO)) {// 是否是进行中
			state = Constant.STATUES_TWO;
		}
		// 满标才能放款
		if (state == Constant.STATUES_ZERO && !loanSignQuery.isFull(id)) {
			state = Constant.STATUES_THERE;
		}

		if (state == Constant.STATUES_ZERO) {
			// 封装标的放款实体
			boolean bool = baseLoansignService.loanerVip(loan);
			Transfer transfer = new Transfer(loan, "1", "1", admin.getId(),bool);
			try {

				//1.从loanrecord里查出当前标的借入记录
				List<Loanrecord> loanrecordList =  baseLoansignService.getLoanrecord(Long.parseLong(id));

				//2.从userfundinfo表查出投标的用户对应的冻结资金,减掉冻结资金,增加至发标人帐户金额.更新相关状态、
				boolean flag = baseLoansignService.credit(loanrecordList,loan);

				if(flag){
						Log.error("放款成功-->我方放款失败-->数据处理失败-->还款ips编号:"
								+ transfer.getpIpsBillNo() + "还款标号:"
								+ loan.getLoansignbasics().getpBidNo());
				}

				// 当标的类型不为流转标的时候生成还款计划
				if (!loan.getLoanType().equals(Constant.STATUES_FOUR)) { // 生成还款计划
					try {
						int nums = processingService.repaymentNum(loan.getId());
						if (nums <= 0) {
							baseLoansignService.repaymentRecords(loan);
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
				Log.error("放款己受理-->还款订单号:" + "还款标号:" + loan.getLoansignbasics().getpBidNo());
				state = Constant.STATUES_FIVE;

			} catch (Exception e) {
				Log.error("放款失败");
				state = Constant.STATUES_FOUR;
				e.printStackTrace();
			}
		}
		return state;
	}

	/**
	 * 通过环迅进行债权转让放款操作
	 * 
	 * @param id
	 *            标编号
	 * @return 返回放款情况
	 */
	@RequestMapping("/creditAssigment")
	@ResponseBody
	public Integer ipsLoansAssigment(String id, HttpServletRequest request) {
		// 获取后台操作人员信息
		Adminuser admin = (Adminuser) request.getSession().getAttribute(
				Constant.ADMINLOGIN_SUCCESS);
		// 获取标的情况
		Loansign loan = loanSignQuery.getLoansignById(id);

		// 新标记录
		Loanrecord loanrecord = loanSignQuery
				.getLoanrecordLoanID(id.toString());

		// 判断该标是否能放款
		int state = Constant.STATUES_ZERO;
		// 1、检查是否可以放款
		if (!loan.getLoanstate().equals(
				Constant.STATUES_TWO)) {// 是否是进行中
			state = Constant.STATUES_TWO;
		}

		// 满标才能放款
		if (state == Constant.STATUES_ZERO
				&& loanSignQuery.isFullAssigment(id) == false) {
			state = Constant.STATUES_THERE;
		}
		String flowid = loanSignQuery.getflowId(id.toString(),
				String.valueOf(loan.getUserbasicsinfo().getId()));
		Loansignflow loanSignflow = loanSignQuery.getLoansignflow(flowid
				.toString());
		if (state == Constant.STATUES_ZERO) {
			// 封装标的放款实体
			Transfer transfer = new Transfer(loan, "4", "1", admin.getId(),
					loanrecord, loanSignflow);
			ReturnInfo info = null;
			try {
				// 将实体进行加密操作
				Map<String, String> map = baseLoansignService
						.transferCall(transfer);
				info = RegisterService.transfer(map);
				// 返回成功进行处理
				if (Constant.Transfer_Success
						.equals(info.getpErrCode())) {
					// Log.error("环迅放款受理-->还款ips编号:"+ "还款标号:" + loan.getId());
					Transfer transferInfo = null;
					String xml = XmlParsingBean.md52Xml(info.getP3DesXmlPara());
					transferInfo = (Transfer) XmlParsingBean
							.xml2TransferOne(xml);
					// 获取标的情况
					String[] ids = transferInfo.getpMemo3().split(":");

					Loansign loansign = loanSignQuery.getLoansignById(ids[0]);
					// 判断数据是否已处理
					int num = processingService.accountInfoNum(transferInfo
							.getpIpsBillNo());
					if (num <= 0) {

						// 对借款人账户的处理
						boolean bool = processingService.tenderAudit(loansign
								.getUserbasicsinfo(), transferInfo, request,
								loansign.getLoansignbasics().getMgtMoney());
						if (!bool) {
							Log.error("环迅放款成功-->我方放款失败-->数据处理失败-->还款ips编号:"
									+ transferInfo.getpIpsBillNo() + "还款标号:"
									+ loansign.getId());
						}

					}
					loansign.setLoanstate(4);
					processingService.updateLoan(loansign);
					state = Constant.STATUES_FIVE;
				} else {
					Log.error("环迅放款失败");
					state = Constant.STATUES_FOUR;
				}
			} catch (Exception e) {
				LOG.error("放款失败,数据解析失败-->需要解析的数据为：" + info.getP3DesXmlPara());
				state = Constant.STATUES_FOUR;
				e.printStackTrace();
			}
		}
		return state;
	}

	/**
	 * 初始化发送信息页面
	 * 
	 * @return 返回发送信息页面
	 */
	@RequestMapping("openMessage")
	public String openMessage(Long loanId, HttpServletRequest request) {
		request.setAttribute("loan", baseLoansignService.get(loanId));
		return "WEB-INF/views/admin/loansign/add_remind";
	}

	/**
	 * 发送短信或邮件
	 * 
	 * @param fashion
	 *            发送方式0 表示发送短信 1表示发送邮件
	 * @param content
	 *            发送内容
	 * @return 发送是否成功
	 */
	@RequestMapping("sendSms.htm")
	@ResponseBody
	public JSONObject sendChatMessage(int fashion, String content,
			String phone, String email) {
		JSONObject json = new JSONObject();
		// 发送短信
		try {
			if (fashion == Constant.STATUES_ZERO) {
				SmsResult sms = baseSmsService.sendSMS(content, phone);
				if (sms.isSuccess()) {
					return DwzResponseUtil.setJson(json, "200", "短信发送成功", null,
							"closeCurrent");
				} else {
					return DwzResponseUtil.setJson(json, "300", "短信发送失败", null,
							"closeCurrent");
				}
			} else {
				emailService.sendEmail("太平洋理财标到期提醒", content, email);
				return DwzResponseUtil.setJson(json, "200", "邮件发送成功", null,
						"closeCurrent");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return DwzResponseUtil.setJson(json, "300", "发送失败", null,
                    "closeCurrent");
		}
	}

	/**
	 * 获取标类型的数据
	 * 
	 * @return 返回一个json数组
	 */
	@RequestMapping("loanType.htm")
	@ResponseBody
	public JSONArray getLoanType() {
		JSONArray json = new JSONArray();
		List<LoansignType> listType = loansignTypeService.queryLoanType();
		for (int i = 0; i < listType.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.accumulate("text", listType.get(i).getTypename());
			jsonObject.accumulate("value", listType.get(i).getId());
			json.add(jsonObject);
		}
		return json;
	}

}
