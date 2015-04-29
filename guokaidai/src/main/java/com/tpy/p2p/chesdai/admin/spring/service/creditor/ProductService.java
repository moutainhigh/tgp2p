package com.tpy.p2p.chesdai.admin.spring.service.creditor;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.StringUtil;
import com.tpy.base.view.AjaxResponseView;
import com.tpy.p2p.chesdai.util.DateUtil;
import com.tpy.base.spring.exception.ResponseExceptionFactory;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.admin.spring.transaction.CreditorLinkTransaction;
import com.tpy.p2p.chesdai.admin.spring.transaction.CreditorPayRecordTransaction;
import com.tpy.p2p.chesdai.admin.spring.transaction.ProductTransaction;
import com.tpy.p2p.chesdai.entity.*;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.BidInfo;
import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.exception.ResponseExceptionFactory;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.base.util.StringUtil;
import com.tpy.base.view.AjaxResponseView;
import com.tpy.p2p.chesdai.admin.spring.transaction.CreditorLinkTransaction;
import com.tpy.p2p.chesdai.admin.spring.transaction.CreditorPayRecordTransaction;
import com.tpy.p2p.chesdai.admin.spring.transaction.ProductPayRecordTransaction;
import com.tpy.p2p.chesdai.admin.spring.transaction.ProductTransaction;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.BidInfo;
import com.tpy.p2p.pay.payservice.RegisterService;
import com.tpy.p2p.pay.util.ParseXML;

import freemarker.template.TemplateException;

/**
 * 产品购买服务
 * 
 * @author ldd
 * 
 */
@SuppressWarnings("unchecked")
@Service
public class ProductService {

    /**
     * 注入HibernateSupport
     */
    @Resource
    HibernateSupport dao;

    /**
     * 注入CreditorPayRecordTransaction
     */
    @Resource
    CreditorPayRecordTransaction tranCreditorPayRecord;

    /**
     * ResponseExceptionFactory
     */
    @Resource
    ResponseExceptionFactory factory;

    /**
     * AjaxResponseView
     */
    @Resource
    private AjaxResponseView view;

    /**
     * tranProductPayRecord
     */
    @Resource
    ProductPayRecordTransaction tranProductPayRecord;

    /**
     * tranCreditorLink
     */
    @Resource
    CreditorLinkTransaction tranCreditorLink;

    /**
     * tranProduct
     */
    @Resource
    ProductTransaction tranProduct;

    /**
     * 打包
     * 
     * @param info
     *            信息
     * @return map 结果
     * @throws java.io.IOException
     *             有可能抛出IO异常
     * @throws TemplateException
     *             有可能抛出 Template异常
     */
    public Map<String, String> packPayInfo(BidInfo info) throws IOException,
            TemplateException {

        String xml = com.tpy.p2p.pay.util.ParseXML.bidXml(info);

        Map<String, String> map = RegisterService.registerCall(xml);

        map.put("url", PayURL.BIDTESTURL);

        return map;
    }

    /**
     * 查询所有或根据条件分页查询
     * 
     * @param page
     *            分页参数
     * @param name
     *            产品名称
     * @param deadline
     *            产品期限
     * @param investOnlineMin
     *            线上投资起点
     * @param rate
     *            利率
     * @return 返回产品信息集合
     */
    public List<Product> pateProdict(PageModel page, String name,
            Long deadline, String investOnlineMin, String rate) {

        StringBuffer hql = new StringBuffer("from Product p where 1=1");

        if (null != name && !"".equals(name)) {
            hql.append(" and p.name like '%").append(name).append("%'");
        }
        if (null != deadline && deadline > 0) {
            hql.append(" and p.dayDuring=").append(deadline);
        }
        if (null != investOnlineMin && !"".equals(investOnlineMin)) {
            hql.append(" and p.investOnlineMin=").append(investOnlineMin);
        }
        if (null != rate && !"".equals(rate)) {
            hql.append(" and p.ratePercentYear=").append(rate);
        }

        List<Product> productsList = (List<Product>) dao.pageListByHql(page,hql.toString(), true, null);
        return productsList;
    }

    /**
     * 查询所有的条数
     * 
     * @param name
     *            产品名称
     * @param deadline
     *            期限
     * @param investOnlineMin
     *            线上最大投资
     * @param rate
     *            年化利率
     * @return 返回产品信息条数
     */
    public int pageNum(String name, Long deadline, String investOnlineMin,
            String rate) {

        StringBuffer sql = new StringBuffer(
                "SELECT count(p.id) from product p where 1=1");

        if (null != name && !"".equals(name)) {
            sql.append(" and p.name like '%").append(name).append("%'");
        }
        if (null != deadline && deadline > 0) {
            sql.append(" and p.dayDuring=").append(deadline);
        }
        if (null != investOnlineMin && !"".equals(investOnlineMin)) {
            sql.append(" and p.investOnlineMin=").append(investOnlineMin);
        }
        if (null != rate && !"".equals(rate)) {
            sql.append(" and p.ratePercentYear=").append(rate);
        }

        Integer sum = dao.queryNumberSql(sql.toString(), null).intValue();

        return sum;
    }

    /**
     * 根据产品编号查询产品信息
     * 
     * @param id
     *            产品编号
     * @return 返回产品信息对象
     */
    public Product getProductId(Long id) {
        Product product = dao.get(Product.class, id);
        return product;
    }

    /**
     * 根据产品名称查询单个对象
     * 
     * @param name
     *            产品名称
     * @return 返回产品信息对象
     */
    public Product getProductName(String name) {
        String hql = "from Product p where p.name=?";
        Product product = (Product) dao.findObject(hql, name);
        return product;
    }

    /**
     * 在添加时查询当前用户输入的产品名称是否和其他产品名称重复
     * 
     * @param name
     *            产品名称
     * @param id
     *            产品编号
     * @return 返回产品信息对象
     */

    public Product getPrductNameRepeat(String name, Long id) {
        String hql = "from Product p where p.name=? and p.id!=?";
        Product product = (Product) dao.findObject(hql, name, id);
        return product;
    }

    /**
     * 新增产品
     * 
     * @param product
     *            产品对象
     */
    public void saveProduct(Product product) {
        dao.save(product);
    }

    /**
     * 修改产品信息
     * 
     * @param product
     *            产品对象
     * @return 修改额状态
     */
    public Integer updateProduct(Product product) {
        String sql = "UPDATE product SET name=?,day_during=?,invest_offline_min=?,invest_online_min=?,status=?,shows=?,invest_max=?,employee_award=?,remark=?,bank_rate_id=?,type=?,rate_percent_year=? where id=?";
        int num = dao.executeSql(sql, product.getName(), product
                .getProductType().getDayDuring(),
                product.getInvestOfflineMin(), product.getInvestOnlineMin(),
                product.getStatus(), product.getShows(),
                product.getInvestMax(), Arith.div(product.getEmployeeAward(),
                        100, 4), product.getRemark(), product.getBankRate()
                        .getId(), product.getProductType().getId(), Arith.div(
                        product.getRatePercentYear(), 100, 4), product.getId());
        return num;
    }

    /**
     * 根据产品对象修改产品信息
     * 
     * @param product
     *            产品对象信息
     */
    public void updateProductState(Product product) {
        dao.update(product);
    }

    /**
     * 修改发布状态或是否显示状态
     * 
     * @param product
     *            产品信息
     * @return 1 修改成功
     */
    public Integer updateProductStatue(Product product) {
        String sql = "update product set status=?,shows=? where id=?";
        int num = dao.executeSql(sql, product.getStatus(), product.getShows(),
                product.getId());
        return num;
    }

    /**
     * 根据编号删除产品信息
     * 
     * @param id
     *            id
     */
    public void deleteProduct(Long id) {
        dao.delete(id, Product.class);
    }

    /**
     * 查询银行利率
     * 
     * @return 银行利率集合
     */
    public List<BankRate> queryBanRateList() {
        return dao.find("from BankRate");
    }

    /**
     * 根据产品类型编号查新查询银行利率信息
     * 
     * @param id
     *            银行编号
     * @return 返回银行利率对象
     */
    public BankRate queryBankRate(Long id) {
        BankRate bank = dao.get(BankRate.class, id);
        return bank;
    }

    /**
     * 查询产品类型信息
     * 
     * @return 返回产品类型信息
     */
    public List<ProductType> queryProductTypeList() {
        return dao.find("from ProductType");
    }

    /**
     * 根据产品类型编号查询产品类型信息
     * 
     * @param id
     *            产品类型编号
     * @return 返回产品类型对象
     */
    public ProductType queryProductType(Long id) {
        return dao.get(ProductType.class, id);
    }

    /**
     * 首页查询
     * 
     * @return list
     */
    public List<Object[]> indexProductList() {
        return dao
                .findBySql("SELECT a.id,a.name,b.day_during,a.invest_online_min,a.invest_max,a.rate_percent_year,a.invested_moeny/a.invest_max,b.day_type FROM product a,product_type b WHERE a.type=b.id LIMIT 10");
    }
    
    /**
    * <p>Title: initTop5latest</p>
    * <p>Description: 首页加载最新的5条借款标信息</p>  2014-7-17修改为返回全部
    * 
    * @return
    */
    public List<Object[]> initTop5latest(){
    	List<Object[]> objs = dao.findBySql("SELECT l.id, s.loanTitle, l.userbasicinfo_id, l.issueLoan, l.rate, l. MONTH, l.useDay, l.loanstate, ROUND( IFNULL(( SELECT SUM(loanrecord.tenderMoney) FROM loanrecord WHERE loanrecord.loanSign_id = l.id ), 0 ) / l.issueLoan, 2), ( SELECT typename FROM loansign_type WHERE loansign_type.id = l.loansignType_id ), l.loansignType_id, l.loanType, s.assure FROM loansign l, loansignbasics s WHERE l.id = s.id AND  l.loanstate != 1 AND l.isRecommand = 1 AND l.isShow = 1 ORDER BY l.id DESC LIMIT 0, 5");
//    	List<Object[]> objs = dao.findBySql("SELECT l.id, s.loanTitle, l.userbasicinfo_id, l.issueLoan, l.rate, l. MONTH, l.useDay, l.loanstate, ROUND( IFNULL(( SELECT SUM(loanrecord.tenderMoney) FROM loanrecord WHERE loanrecord.loanSign_id = l.id ), 0 ) / l.issueLoan, 2), ( SELECT typename FROM loansign_type WHERE loansign_type.id = l.loansignType_id ), l.loansignType_id, l.loanType, s.assure FROM loansign l, loansignbasics s WHERE l.id = s.id AND  l.loanstate != 1 AND l.isRecommand = 1 AND l.isShow = 1 ORDER BY l.id DESC");
    	return objs;
    }
    /**
     * <p>Description: 首页加载最新借款标信息</p>
     * @return List<Loansign>
     */
    public List<Loansign> initToplatest(){
    	String sql="select * from Loansign l where  l.loanstate != 1 AND l.loanType = 1 AND l.isShow=1 ORDER BY l.id  DESC LIMIT 0,5";
    	List<Loansign> loansigns=dao.findBySql(sql, Loansign.class);
    	/*StringBuffer sql=new StringBuffer("select l.id,s.loanTitle,l.issueLoan,l.rate,s.bidTime,l.publishTime,l.refundWay,l.loanUnit,l.vipCounterparts,l.loanstate,l.loanType,s.views,(SELECT sum(tenderMoney) as tenderMoney FROM loanrecord where loanrecord.loanSign_id=l.id),l.month,l.other,l.isShow,l.isRecommand,l.endTime");
    	StringBuffer sqlCount = new StringBuffer("select count(l.id) ");
    	StringBuffer sqlsb = new StringBuffer(" FROM loansign l,loansignbasics s,borrowersbase b WHERE l.id = s.id and l.userbasicinfo_id=b.userbasicinfo_id AND l.loanstate!=1 AND l.isShow=1");
    	sqlsb.append(" order by l.publishTime desc");    
    	page.setTotalCount(dao.queryNumberSql(sqlCount.append(sqlsb).toString()).intValue());
		sqlsb.append(" LIMIT ").append((page.getPageNum()-Constant.STATUES_ONE)*Constant.STATUES_SIX).append(",").append(Constant.STATUES_SIX );
		List<Loansign> list= dao.findBySql(sql.append(sqlsb).toString());
    	page.setList(list);*/
    	return loansigns;
    }
    /**
     * 查询债权转让
     * @param page
     * @return
     */
    public List<Loansign> initToplaAssignment(){
    	String sql="select * from Loansign l where  l.loanstate != 1  AND l.loanType = 6 AND l.isShow=1 ORDER BY l.id  DESC LIMIT 0,5";
    	List<Loansign> loansigns=dao.findBySql(sql, Loansign.class);
    	return loansigns;
    }
    
    public List<Loansign> getRecord(){
    	List<Loansign> loansigns=dao.find("from Loansign l where  l.loanstate != 1 ORDER BY l.id DESC");
     	
    	return loansigns;
    }

    public List<TransferPool> getTransferPools(){
        String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String sql = "select * from transfer_pool where status = 0 and created_at > '"+ now + "' order by id asc";
        List<TransferPool> pools = dao.findBySql(sql,TransferPool.class);

        return pools;
    }
    

    /**
     * <p>
     * Title: queryByUser
     * </p>
     * <p>
     * Description: 会员产品认购记录
     * </p>
     * 
     * @param page
     *            分页信息
     * @param userbasic
     *            用户
     * @return 查询结果
     */
    public List queryByUser(PageModel page, Userbasicsinfo userbasic) {

        String hql = " from ProductPayRecord Where userbasicsinfo.id="
                + userbasic.getId();
        return dao.pageListByHql(page, hql, true);
    }

    /**
     * 修改产品类型信息
     * 
     * @param productType
     *            产品类型信息
     * @return 返回操作结果
     */
    public Integer updateType(ProductType productType) {
        String sql = "update product_type set name=?,invest_online_min =?,invest_offline_min =?,rate_percent_year=?,employee_award=?,invest_max=? where id=?";
        int num = dao.executeSql(sql, productType.getName(),
                productType.getInvestOnlineMin(),
                productType.getInvestOfflineMin(),
                Arith.div(productType.getRatePercentYear(), 100, 4),
                Arith.div(productType.getEmployeeAward(), 100, 4),
                productType.getInvestMax(), productType.getId());
        return num;
    }

    /**
     * <p>
     * Title: getStatistical
     * </p>
     * <p>
     * Description: 后台会员借出记录初始化页面
     * </p>
     * 
     * @param ids
     *            当前选中会员编号
     * @param request
     *            HttpServletRequest
     */
    public void getStatistical(String ids, HttpServletRequest request) {

        // 统计累计认购金额
        StringBuffer sumMoneySql = new StringBuffer(
                "SELECT SUM(product_pay_record.money) FROM product_pay_record WHERE");
        sumMoneySql.append(" product_pay_record.userbasic_id =" + ids);
        request.setAttribute("SumMoney",
                this.query(sumMoneySql.toString(), null));

        // 统计累计获得的利息（收益）
        StringBuffer sumRateSql = new StringBuffer(
                "SELECT SUM(product_pay_record.rate_sum) FROM product_pay_record WHERE  userbasic_id="
                        + ids);
        request.setAttribute("sumRate", this.query(sumRateSql.toString(), null));

        // 根据状态统计认购金额
        StringBuffer getByStatus = new StringBuffer(
                "SELECT SUM(money) FROM product_pay_record WHERE  userbasic_id= "
                        + ids + " AND `status`= ?");

        // 统计回购中金额
        request.setAttribute("loan_0", this.query(getByStatus.toString(), 0));

        // 统计已完成金额
        request.setAttribute("loan_1", this.query(getByStatus.toString(), 1));

        // 统计待分配金额
        request.setAttribute("loan_2", this.query(getByStatus.toString(), 2));

    }

    /**
     * <p>
     * Title: query
     * </p>
     * <p>
     * Description: 根据传入sql查询金额
     * </p>
     * 
     * @param sql
     *            要执行的sql
     * @param params
     *            参数
     * @return 查询结果
     */
    private String query(String sql, Object... params) {

        Object result = dao.findObjectBySql(sql, params);

        // 判断查询结果是否为空
        if (null != result && StringUtil.isNotBlank(result.toString())) {
            return result.toString();
        } else {
            return "0.00";
        }

    }
    /**
     * 首页推荐标
     * @return
     */
    public Loansign getRecommend(){
    	String hql="from Loansign l where l.loanstate!=1 order by l.rate DESC, l.loansignbasics.riskAssess";
    	List ls= dao.find(hql);
       if(ls.size()>0){
    	   Loansign loansign=(Loansign) ls.get(0);
    	   return loansign;
       }else{
    	   return null;
       }

    }
    
    /**
     * 根据loansign的id查询loanrecord记录tenderMoney
     * @param loanId
     * @return
     */
    public String getLoanrecordMoney(String loanId){
    	if(!loanId.equals("")&&loanId!=null){
    		String sql="select tenderMoney from loanrecord where loan_id="+loanId.toString();
        	Object tenderMoney=this.dao.findBySql(sql);
        	return tenderMoney.toString().substring(1, tenderMoney.toString().length()-1);
    	}else{
    		return null;
    	}
    }
    /**
     * 获取前三个提纲
     */
    public List getOutline() {
    	String sql = "select * from outline where isShow=1 order by id LIMIT 3";
        List<Outline> list=dao.findBySql(sql, Outline.class);
        int length = list.size();
        for (int i = 0; i < length; i++) {
			list.get(i).setContent(list.get(i).getContent().replace("span", "b"));
		}
        return list;
    }
    
    /**
     * 获取新手手册
     */
    public List getManual() {
    	String sql = "select * from manual where isShow=1";
        List<Manual> list=dao.findBySql(sql, Manual.class);
        return list;
    }

}
