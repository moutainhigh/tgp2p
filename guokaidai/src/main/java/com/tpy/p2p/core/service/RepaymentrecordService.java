package com.tpy.p2p.core.service;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.HibernateSupportTemplate;
import com.tpy.p2p.chesdai.admin.spring.form.RemindRepaymentListForm;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loanquery.LoanSignQuery;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.HibernateSupportTemplate;
import com.jubaopen.commons.LOG;
import com.tpy.p2p.chesdai.admin.spring.form.RemindRepaymentListForm;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Loansignbasics;
import com.tpy.p2p.chesdai.entity.Repaymentrecord;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.core.loanquery.LoanSignQuery;

/**
 * 还款记录service
 * 
 * @author hsq
 * 
 */
@Service
public class RepaymentrecordService {
	/** dao */
	@Resource
	private HibernateSupportTemplate dao;

	/** loanSignQuery */
	@Resource
	private LoanSignQuery loanSignQuery;

	/**
	 * <p>
	 * Title: getrepaymentRecordCount
	 * </p>
	 * <p>
	 * Description: 借款标为id的还款记录的条数
	 * </p>
	 * 
	 * @param loansignId
	 *            借款标号
	 * @return 结果
	 */
	public int getrepaymentRecordCount(int loansignId) {
		StringBuffer sb = new StringBuffer(
				"SELECT COUNT(1) from repaymentrecord where loanSign_id=");
		return loanSignQuery.queryCount(sb.append(loansignId).toString());
	}

	/**
	 * 更改还款记录对象
	 * 
	 * @param repaymentrecord
	 *            还款记录对象
	 */
	public void update(Repaymentrecord repaymentrecord) {
		dao.update(repaymentrecord);
	}

	/**
	 * 通过借款标标号查询到该借款标的还款记录（适用于所有的借款标）
	 * 
	 * @param loanSignId
	 *            借款标id
	 * @param start
	 *            start
	 * @param limit
	 *            limit
	 * @return 集合
	 */
	public List<Repaymentrecord> queryRepaymentrecordList(int start, int limit,
			int loanSignId) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"SELECT id, periods, preRepayDate, (money + preRepayMoney), CASE WHEN repayState = 2 THEN '按时还款' ");
		sb.append("WHEN repayState = 3 THEN '逾期未还款' WHEN repayState = 4 THEN '逾期已还款' WHEN repayState = 5 THEN '提前还款' ELSE '' END,repayTime, ");
		sb.append(
				" repayState, money + realMoney FROM repaymentrecord WHERE loanSign_id = ")
				.append(loanSignId);
		sb.append(" LIMIT ").append(start).append(" , ").append(limit);
		list = dao.findBySql(sb.toString());
		return list;
	}

	/**
	 * 查询表的记录
	 * 
	 * @param start
	 * @param limit
	 * @param loanSignId
	 * @return
	 */
	public List<Repaymentrecord> queryRepaymentrecord(String loanSignId) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"SELECT id, periods, preRepayDate, (money + preRepayMoney), CASE WHEN repayState = 2 THEN '按时还款' ");
		sb.append("WHEN repayState = 3 THEN '逾期未还款' WHEN repayState = 4 THEN '逾期已还款' WHEN repayState = 5 THEN '提前还款' ELSE '' END,repayTime, ");
		sb.append(
				" repayState, money + realMoney FROM repaymentrecord WHERE loanSign_id = ")
				.append(loanSignId);
		list = dao.findBySql(sb.toString());
		return list;
	}

	/**
	 * <p>
	 * Title: getJSONArrayByList
	 * </p>
	 * <p>
	 * Description: 还款记录 转JSONArray
	 * </p>
	 * 
	 * @param list
	 *            集合
	 * @return JSONArray
	 */
	public JSONArray getJSONArrayByList(List list) {
		JSONObject json = null;
		JSONArray jsonlist = new JSONArray();
		// 给每条数据添加标题
		for (Object obj : list) {
			json = new JSONObject();
			Object[] str = (Object[]) obj;
			json.element("id", str[0]);
			json.element("periods", str[1]);
			json.element("preRepayDate", str[2]);
			json.element("money",
					Arith.round(new BigDecimal(str[3].toString()), 2) + "元");
			json.element("repayState", str[4]);
			json.element("repayTime", str[5]);
			if ("1".equals(str[6].toString()) || "3".equals(str[6].toString())) {
				json.element("realmoney", "");
			} else {
				json.element("realmoney",
						Arith.round(new BigDecimal(str[7].toString()), 2) + "元");
			}
			jsonlist.add(json);
		}
		return jsonlist;
	}

	/**
	 * 查询催收列表
	 * 
	 * @param page
	 * @param loansignbasics
	 * @param day
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List remindRepaymentPage(PageModel page,RemindRepaymentListForm remindRepayForm) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"SELECT repaymentrecord.id,loansignbasics.loanNumber,loansignbasics.loanTitle,");
		sb.append(" CASE WHEN loansign.loanType=1 THEN '普通标' WHEN loansign.loanType=2 THEN '天标' WHEN loansign.loanType=3 THEN '秒标' ");
		sb.append(" WHEN loansign.loanType=4 THEN '流标' ELSE '' END,");
		sb.append(" CASE WHEN (loansign.loansigntype_id is not null) THEN (SELECT typename FROM loansign_type  WHERE id=loansign.loansigntype_id) ELSE '' END, ");
		sb.append(" userbasicsinfo.NAME,loansign.issueLoan, loansign.`month`,loansign.rate * 100,");
		sb.append(" CASE WHEN loansign.refundWay=1 THEN '按月等额本息' WHEN loansign.refundWay=2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END,");
		sb.append(" loansign.publishTime, CASE WHEN loansign.loanstate = 3 OR loansign.loanstate = 4 THEN '已放款' ELSE '未放款' END,");
		sb.append(" loansignbasics.creditTime, repaymentrecord.periods, repaymentrecord.preRepayDate, (repaymentrecord.money + repaymentrecord.preRepayMoney),");
		sb.append("  CASE WHEN repaymentrecord.repayState =1 THEN '未还款' WHEN repaymentrecord.repayState = 2 THEN '按时还款' ");
		sb.append(" WHEN repaymentrecord.repayState = 3 THEN '逾期未还款' WHEN repaymentrecord.repayState = 4 THEN '逾期已还款' ");
		sb.append(" WHEN repaymentrecord.repayState = 5 THEN '提前还款' ELSE '' END,");
		sb.append("  repayTime,repayState, money + realMoney,remindEmailCount,remindSMSCount");
		sb.append(" FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id ");
		sb.append(" INNER JOIN repaymentrecord ON loansign.id=repaymentrecord.loanSign_id WHERE  ");
		sb.append(" (loansign.loanstate=3 or  loansign.loanstate =4) ");
		String queryCondition = this.getQueryConditions(remindRepayForm);
		sb.append(queryCondition);
		sb.append("   ORDER BY loansign.loanstate asc,loansign.id DESC ");

		StringBuffer sbl = new StringBuffer(
				"SELECT count(loansign.id) FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id ");
		sbl.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id  ");
		sbl.append(" INNER JOIN repaymentrecord ON loansign.id=repaymentrecord.loanSign_id WHERE  ");
		sbl.append(" (loansign.loanstate=3 or  loansign.loanstate =4) ");
		sbl.append(queryCondition);
		LOG.info(sbl.toString());
		if(page!=null){//page不为空即是查询
			list = dao.pageListBySql(page, sbl.toString(), sb.toString(), null);
		}else{//page为空是下载中的查询
			list = dao.findBySql(sb.toString(), new Object[]{});
		}
		return list;
	}

	/**
	 * <p>
	 * Title: GetQueryConditions
	 * </p>
	 * <p>
	 * Description: 组装的查询条件
	 * </p>
	 * 
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return sql语句
	 */
	public String getQueryConditions(RemindRepaymentListForm remindRepayForm) {
		StringBuffer sb = new StringBuffer();
		if (null != remindRepayForm.getLoanTitle()
				&& !"".equals(remindRepayForm.getLoanTitle())) {
			sb.append(" and loansignbasics.loanTitle like '%")
					.append(remindRepayForm.getLoanTitle()).append("%'");
		}
		if (null != remindRepayForm.getLoanNumber()
				&& !"".equals(remindRepayForm.getLoanNumber())) {
			sb.append(" and loansignbasics.loanNumber like '%")
					.append(remindRepayForm.getLoanNumber()).append("%'");
		}
		if (null != remindRepayForm.getName() && !"".equals( remindRepayForm.getName())) {
			sb.append(" and userbasicsinfo.name like '%").append( remindRepayForm.getName())
					.append("%'");
		}
		if (null != remindRepayForm.getLoanType()
				&& !"".equals(remindRepayForm.getLoanType())) {
			sb.append(" and loansign.loanType =")
					.append(remindRepayForm.getLoanType());
		}
		if (null != remindRepayForm.getLoanProductType()
				&& !"".equals(remindRepayForm.getLoanProductType())) {
			sb.append(" and loansign.loansignType_id =").append(
					remindRepayForm.getLoanProductType());
		}
		if (null != remindRepayForm.getPublishTimeStart()
				&& !"".equals(remindRepayForm.getPublishTimeStart())) {
			sb.append(" and loansign.publishTime>='")
					.append(remindRepayForm.getPublishTimeStart()).append("'");
		}
		if (null != remindRepayForm.getPublishTimeEnd() &&
				!"".equals(remindRepayForm.getPublishTimeEnd())) {
			sb.append(" and loansign.publishTime<='")
			.append(remindRepayForm.getPublishTimeEnd()).append("'");
		}
		if (null != remindRepayForm.getPreRepayDateStart()
				&& !"".equals(remindRepayForm.getPreRepayDateStart())) {
			sb.append(" and repaymentrecord.preRepayDate>='")
			.append(remindRepayForm.getPreRepayDateStart()).append("'");
		}
		if (null != remindRepayForm.getPreRepayDateEnd() &&
				!"".equals(remindRepayForm.getPreRepayDateEnd())) {
			sb.append(" and repaymentrecord.preRepayDate<='")
			.append(remindRepayForm.getPreRepayDateEnd()).append("'");
		}
		if (null != remindRepayForm.getFactRepayDateStart()
				&& !"".equals(remindRepayForm.getFactRepayDateStart())) {
			sb.append(" and repaymentrecord.repayTime>='")
			.append(remindRepayForm.getFactRepayDateStart()).append("'");
		}
		if (null != remindRepayForm.getFactRepayDateEnd()&&
				!"".equals(remindRepayForm.getFactRepayDateEnd())) {
			sb.append(" and repaymentrecord.repayTime<='")
			.append(remindRepayForm.getFactRepayDateEnd()).append("'");
		}
		if (null != remindRepayForm.getRepayState()
				&& !"".equals(remindRepayForm.getRepayState())) {
			sb.append(" and repaymentrecord.repayState=").append(
			remindRepayForm.getRepayState());
		}
		if (null != remindRepayForm.getRemindEmailCount()
				&& !"".equals(remindRepayForm.getRemindEmailCount())) {
			sb.append(" and repaymentrecord.remindEmailCount =").append(
			remindRepayForm.getRemindEmailCount());
		}
		if (null != remindRepayForm.getRemindSMSCount()
				&& !"".equals(remindRepayForm.getRemindSMSCount())) {
			sb.append(" and repaymentrecord.remindSMSCount=").append(
			remindRepayForm.getRemindSMSCount());
		}
		return sb.toString();
	}

	/**
	 * 获取联系方式用来催收通知
	 * 
	 * @param repaymentRecordId
	 * @return
	 */
	public Object[] getContact(Long repaymentRecordId) {
		StringBuilder sb = new StringBuilder(" SELECT b.realName,b.isCard,u.phone,c.newaddress,s.companyName,u.email,");
		sb.append(" lb.loanNumber,lb.loanTitle, CASE WHEN l.loanType=1 THEN '普通标' WHEN l.loanType=2 THEN '天标'");
		sb.append(" WHEN l.loanType=3 THEN '秒标'  WHEN l.loanType=4 THEN '流标' ELSE '' END,");
		sb.append(" l.issueLoan, l.`month`,");
		sb.append(" CASE WHEN l.refundWay=1 THEN '按月等额本息' WHEN l.refundWay=2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END,");
		sb.append(" r.periods, preRepayDate,(r.money + r.preRepayMoney),r.remindEmailCount,r.remindSMSCount ");
		sb.append(" FROM borrowersbase b,borrowerscompany s,borrowerscontact c,userrelationinfo u,repaymentrecord r,loansign l,loansignBasics lb ");
		sb.append(" WHERE b.id=s.id AND b.id=c.id AND b.userbasicinfo_id=u.id AND r.loanSign_id = l.id AND l.id=lb.id AND lb.id=r.loanSign_id AND r.id=?");
		List<Object[]> list = (List<Object[]>) dao.findBySql(sb.toString(),
				repaymentRecordId);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	/**
	 * 更新催款通知次数
	 * 
	 * @param fashion
	 * @param repayId
	 */
	public void updateSendTimes(int fashion, Long repayId) {
		int sms = 0;
		int email = 0;
		if (fashion == Constant.STATUES_ZERO) {
			sms++;
		} else {
			email++;
		}
		String sql = "update repaymentrecord set  remindEmailCount=remindEmailCount+?,remindSMSCount=remindSMSCount+? where id=?";
		dao.executeSql(sql, email, sms, repayId);
	}
	
	 /**
     * excel导出
     * 
     * @param title
     *            标题
     * @param column
     *            列宽度（如果为null，默认高度为15）
     * @param header
     *            头部
     * @param content
     *            内容
     * @param response
     *            响应
     * @return 是否成功
     */
    public boolean downloadExcel(String title, Integer[] column,
            String[] header, List<Map<String, String>> content,
            HttpServletResponse response) {
        try {
            String filename = title
                    + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
            filename = new String(filename.getBytes(), "ISO-8859-1");
            response.reset();
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/msexcel");// 设置为下载application/x-download
            response.setHeader("Content-Disposition", "inline;filename=\""
                    + filename + ".xls\"");
            OutputStream os = response.getOutputStream();// 取得输出流
            // 提示下载
            WritableWorkbook wwb = Workbook.createWorkbook(os);
            // 创建excel工作表，指定名字和位置
            WritableSheet sheet = wwb.createSheet(title, 0);

            // 添加标题（行宽）
            for (int i = 0; i < header.length; i++) {
                sheet.addCell(new Label(i, 0, header[i]));
                // 设置excel列宽
                if (column != null) {
                    sheet.setColumnView(i, column[i]);
                } else {// 如果没有设置默认为宽度为50
                    sheet.setColumnView(i, 15);
                }
            }

            // 添加内容
            for (int i = 0; i < content.size(); i++) {
                for (int j = 0; j < content.get(i).size(); j++) {
                    sheet.addCell(new Label(j, i + 1, content.get(i).get(
                            header[j])
                            + ""));
                }
            }

            // 写入工作表
            wwb.write();
            wwb.close();
            os.close();
        } catch (IOException | WriteException e) {
            LOG.error(e.getMessage());
        }
        return true;
    }

}
