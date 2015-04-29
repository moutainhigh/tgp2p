package com.tpy.p2p.APP.admin.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.RechargesService;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import com.tpy.p2p.pay.entity.BankInfo;
import com.tpy.p2p.pay.entity.RechargeInfo;
import com.tpy.p2p.pay.payservice.RegisterService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.Recharge;

import freemarker.template.TemplateException;


/**
 * 在线充值
 * @author lsy 2014-08-27
 *
 */
@Controller
@RequestMapping("/apprecharge")
public class APPRechargesController {
    
    @Resource
    private RechargesService rechargesService;
    @Resource
	private UserBaseInfoService userBaseInfoService;
    
    /**
     * 打开在线支付页面
     * @param request request
     * @return JSONObject
     */
    @RequestMapping("openRecharge")
    @ResponseBody
    public JSONObject openRecharge(HttpServletRequest request){
        //获取银行信息列表
        List<BankInfo> bank = RegisterService.bankList();
        return JSONObject.fromObject(bank);
    }
    /**
     * 打开在线充值记录查询页面
     * @param beginTime 开始时间
     * @param endTime 结束时间
     * @param request  request
     * @return 返回页面地址
     */ 
    @RequestMapping("openRechargeRecord")
    public String openRechargeRecord(String beginTime,String endTime,HttpServletRequest request,Integer pageNum){
      //获取当前登录用户的信息
        Userbasicsinfo userbasic = (Userbasicsinfo) request.getSession().getAttribute(Constant.SESSION_USER);
        PageModel page=new PageModel();
        page.setPageNum(pageNum==null?1:pageNum);
        //获取提现信息列表
        List<Recharge> recharges = rechargesService.rechargeList(userbasic.getId(),beginTime,endTime,page);
        page.setTotalCount(Integer.parseInt(rechargesService.count(userbasic.getId()).toString()));
        request.setAttribute("total", rechargesService.totalAmount(userbasic.getId()));
        request.setAttribute("list",recharges);
        request.setAttribute("beginTime", beginTime);
        request.setAttribute("endTime", endTime);
        request.setAttribute("page", page);
        request.setAttribute("cur_date",DateUtils.format(DateUtils.DEFAULT_TIME_FORMAT));
        return "WEB-INF/views/member/recharge/recharge_record";
    }
	
	/**
	 * 在线充值提交
	 * @param rechargeType 充值类型
	 * @param tranAmt 在线充值金额
	 * @param bankCode 银行编号
	 * @param bankinfo 银行名称
	 * @return 返回充值页面
	 */
    @RequestMapping(value="/sign",method=RequestMethod.GET)
    @ResponseBody
	public JSONObject onlineRecharge(String rechargeType,String tranAmt,Long uid,String bankinfo,HttpServletRequest request){
    	//格式化金额
    	DecimalFormat df=new DecimalFormat("0.00");
    	tranAmt=df.format(Float.parseFloat(tranAmt)).toString();
		//获取当前登录用户的信息
		Userbasicsinfo userbasic = userBaseInfoService.queryUserById(uid);
		//将需要提交的信息放在一个实体对象里
		RechargeInfo rechargeInfo = new RechargeInfo();
        rechargeInfo.setpIdentNo(userbasic.getUserrelationinfo().getCardId());  //用户身份证号码
        rechargeInfo.setpRealName(userbasic.getName()); //用户真实姓名
        rechargeInfo.setpIpsAcctNo(userbasic.getUserfundinfo().getpIdentNo()); //用户从ips注册获得的账号
        rechargeInfo.setpTrdAmt(tranAmt);//充值种类
        rechargeInfo.setPChannelType(rechargeType); //充值方式
        rechargeInfo.setpTrdBnkCode(bankinfo);  //充值银行
        rechargeInfo.setpMemo1(userbasic.getId().toString());
        rechargeInfo.setpMemo2(DateUtils.format("yyyy-MM-dd HH:mm:ss"));
		try {
            return JSONObject.fromObject(rechargesService.encryption(rechargeInfo));
		} catch (freemarker.core.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (TemplateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return JSONObject.fromObject("0");
	}
}
