package com.tpy.p2p.chesdai.spring.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tpy.base.util.StringUtil;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import org.pomo.web.page.model.Page;
import org.springframework.stereotype.Service;

import com.ips.security.utility.IpsCrypto;
import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.entity.Withdraw;
import com.tpy.p2p.chesdai.entity.WithdrawApply;
import com.tpy.p2p.pay.constant.PayURL;
import com.tpy.p2p.pay.entity.WithdrawalInfo;
import com.tpy.p2p.pay.util.ParameterIps;
import com.tpy.p2p.pay.util.ParseXML;

import freemarker.template.TemplateException;

/**
 * 提现业务处理
 * @author RanQiBing 2014-02-13
 *
 */
@Service
public class WithdrawServices {
    
    @Resource
    private HibernateSupport dao;
    /**
     * 查询用户所有的提现信息
     * @return 返回一个提现信息的集合
     */
    public List<Withdraw> queryList(Page page,Long id){
        String hql = "select w.id,w.withdrawAmount,w.strNum,w.pIpsBillNo,w.time from Withdraw w where w.userbasicsinfo.id=?";
        List<Withdraw> list = dao.pageListByHql(page, hql, false, id);
        return list;
    }
    /**
     * 添加用户提现信息
     * @param withdraw 用户提现信息
     */
    public void save(Withdraw withdraw){
        dao.save(withdraw);
    }
    
    /**
     * 修改用户提现信息
     * @param withdraw 用户提现信息
     */
    public void update(WithdrawApply apply){
        dao.update(apply);
    }
    
    /**
     * 保存提现申请
     * @param apply
     */
    public void saveWithdrawApply(WithdrawApply apply){
    	dao.save(apply);
    }
    /**
     * 对信息进行加密处理
     * @param widthdrawal 提现信息
     * @return 返回加密后的提现信息
     * @throws TemplateException 
     * @throws java.io.IOException
     */
    public Map<String,String> encryption(WithdrawalInfo widthdrawal) throws IOException, TemplateException{
      //将充值信息转换成xml文件
        String registerCall = ParseXML.withdrawalXml(widthdrawal);
        System.out.println(registerCall);
      //加密后的信息
        Map<String,String> map = registerCall(registerCall);
        map.put("url",PayURL.WITHDRAWALTESTURL);
        
        return map;
    }
	public static Map<String,String> registerCall(String registerCall){
		//生成xml文件字符串
		//String  = ParseXML.registration(entity);
		//将生成的xml文件进行3des加密
		String desede = IpsCrypto.triDesEncrypt(registerCall,ParameterIps.getDes_algorithm(),ParameterIps.getDesedevector());
		//将加密后的字符串不换行
		desede = desede.replaceAll("\r","");
		desede = desede.replaceAll("\n","");
		//将“ 平台 ”账号 、用户注册信息、证书拼接成一个字符串
		StringBuffer argSign = new StringBuffer(ParameterIps.getCert()).append(desede).append(ParameterIps.getMd5ccertificate());
		//将argSign进行MD5加密
		String md5 = IpsCrypto.md5Sign(argSign.toString());
		//将参数装进map里面
		Map<String,String> map = new HashMap<String, String>();
		map.put("pMerCode",ParameterIps.getCert());
		map.put("p3DesXmlPara", desede);
		map.put("pSign",md5);
		return map;
	}  
    
    /**
     * 根据ips提现编号查询提现信息
     * @param ipsNo
     * @return 返回提现对象
     */
    public Withdraw withdrawIps(String ipsNo){
        String hql = "from Withdraw w where w.pIpsBillNo=?";
        List<Withdraw> with = dao.find(hql, ipsNo);
        if(with.size()>0){
            return with.get(0);
        }
        return null;
    }
    
    /**
     * 用户的提现信息
     * @param id
     * @param beginTime
     * @param endTime
     * @return
     */
    public List<Withdraw> withdrawList(Long id, String beginTime, String endTime,PageModel page) {

        StringBuffer hql = new StringBuffer(
                "SELECT * FROM withdraw w where w.user_id=" + id);

        if (null != beginTime && !"".equals(beginTime)) {
            hql.append(" and date_format(w.time,'%Y-%m-%d')>='").append(StringUtil.replaceAll(beginTime)+"'");
        }

        if (null != endTime && !"".equals(endTime)) {
            hql.append(" and date_format(w.time,'%Y-%m-%d')<='").append(StringUtil.replaceAll(endTime)+"'");
        }
        hql.append(" LIMIT "+page.firstResult()+","+page.getNumPerPage());
        List<Withdraw> list = dao.findBySql(hql.toString(), Withdraw.class);

        return list;
    }
    
    /**
     * 根据id和时间查询提现记录的总条数
     * @param id
     * @param beginTime
     * @param endTime
     * @return
     */
    public Object count(Long id,String beginTime, String endTime){
    	StringBuffer hql=new StringBuffer("SELECT COUNT(w.id) FROM withdraw w WHERE w.user_id=?");
    	if (null != beginTime && !"".equals(beginTime)) {
            hql.append(" and date_format(w.time,'%Y-%m-%d')>='").append(StringUtil.replaceAll(beginTime)+"'");
        }

        if (null != endTime && !"".equals(endTime)) {
            hql.append(" and date_format(w.time,'%Y-%m-%d')<='").append(StringUtil.replaceAll(endTime)+"'");
        }
    	Object obj=dao.findObjectBySql(hql.toString(), id);
    	return obj;
    }
    
    /**
     * 查询apply表
     * @param u 用户
     */
	public List<WithdrawApply> queryWithdrawApp(Userbasicsinfo u) {
		String hql="from WithdrawApply w where w.userbasicsinfo.id="+u.getId()+" order by apply_time desc";
		List<WithdrawApply> applys=(List<WithdrawApply>) dao.query(hql, false);
		return applys;
	}
	
	/**
     * 查询apply表
     * @param u 用户
     * @param page 分页对象
     */
	public List<WithdrawApply> queryWithdrawApplyPage(Userbasicsinfo u,PageModel page) {
		String hql="FROM WithdrawApply w where w.userbasicsinfo.id="+u.getId()+" order by apply_time desc";
		return (List<WithdrawApply>) dao.pageListByHql(page, hql, true);
	}
	
	/**
	 * 查询apply表
	 * @param id 
	 * 			applyId
	 * @return
	 */
	public List<WithdrawApply> queryWithdrawApply(String id){
		String hql="from WithdrawApply w where w.id="+id+" order by apply_time desc";
		List<WithdrawApply> applys=(List<WithdrawApply>) dao.query(hql, false);
		return applys;
	}
	
	/**
	 * 查询apply表
	 * @return
	 */
	public List<WithdrawApply> listAllApply() {
		String hql="from WithdrawApply";
		List<WithdrawApply> applies=dao.find(hql);
		return applies;
	}
}
