package com.tpy.p2p.chesdai.admin.spring.controller.systemset;

import java.text.DecimalFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.p2p.chesdai.admin.spring.service.systemset.ExpenseRatioService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.util.Arith;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tpy.p2p.chesdai.admin.spring.service.systemset.ExpenseRatioService;
import com.tpy.p2p.chesdai.constant.Constant;
import com.tpy.p2p.chesdai.entity.Costratio;
import com.tpy.p2p.chesdai.util.Arith;
import com.tpy.p2p.chesdai.util.DwzResponseUtil;

/**
 * 费用比例设置
 * @author frank 2014-10-01
 *
 */
@Controller
@RequestMapping("/expenseRatio")
public class ExpenseRatioContaroller {
    
    @Resource
    private ExpenseRatioService expenseRatioService;
    
    /**
     * 打开费用比例设置页面
     * @param request request
     * @return 返回费用比例设置路径
     */
    @RequestMapping("openRatio.htm")
    public String openRatio(HttpServletRequest request){
        request.setAttribute("costratio", expenseRatioService.findCostratio());
        return "WEB-INF/views/admin/fund/expense_ratio";
    }
    /**
     * 添加或修改
     * @param id 编号
     * @param oneyear 第一年
     * @param twoyear 第二年
     * @param threeyear 第三年
     * @return 返回处理信息
     */ 
    @RequestMapping("add.htm")
    @ResponseBody
    public JSONObject addCostratio(Costratio costratio){
        JSONObject json = new JSONObject();
        
     //   costratio.setDayRate(Arith.div(costratio.getDayRate(), 100, 4).doubleValue());
        DecimalFormat df=new DecimalFormat("0.00");
        //投资者居间费
        costratio.setMfeeratio(Arith.div(costratio.getMfeeratio(), 100, 4).doubleValue());
        costratio.setVipMfeeratio(Arith.div(costratio.getVipMfeeratio(), 100, 4).doubleValue());
        costratio.setVipMfeetop(Double.parseDouble(df.format(costratio.getVipMfeetop())));
        
        //借款者居间费
        costratio.setPmfeeratio(Arith.div(costratio.getPmfeeratio(),100,4).doubleValue());
        costratio.setVipPmfeeratio(Arith.div(costratio.getVipPmfeeratio(), 100,4).doubleValue());
        costratio.setVipPmfeetop(Double.parseDouble(df.format(costratio.getVipPmfeetop())));
        
        //违约金(借款人)
        costratio.setOverdueRepayment(Arith.div(costratio.getOverdueRepayment(), 100, 4).doubleValue());
        costratio.setPrepaymentRate(Arith.div(costratio.getPrepaymentRate(), 100, 4).doubleValue());
        
        //充值提现
        costratio.setRecharge(Arith.div(costratio.getRecharge(), 100, 4).doubleValue());
        costratio.setViprecharge(Arith.div(costratio.getViprecharge(), 100, 4).doubleValue());
        costratio.setWithdraw(Arith.div(costratio.getWithdraw(), 100, 4).doubleValue());
        costratio.setVipwithdraw(Arith.div(costratio.getVipwithdraw(), 100, 4).doubleValue());
        costratio.setVipwithdrawtop(Double.parseDouble(df.format(costratio.getVipwithdrawtop())));
        //充值Vip
        costratio.setVipUpgrade(Double.parseDouble(df.format(costratio.getVipUpgrade())));
        
        try {
        	if(null!=costratio.getId()){
        		expenseRatioService.update(costratio);
        	}else{
        		expenseRatioService.save(costratio);
        	}
        	return DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_SUCCESS, "保存成功","#main31",null);
		} catch (Exception e) {
			return DwzResponseUtil.setJson(json, Constant.HTTP_STATUSCODE_SUCCESS, "保存失败","#main31",null);
		}	
    }
}
