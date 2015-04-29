package com.tpy.p2p.APP.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.tpy.base.model.PageModel;
import com.tpy.base.util.DateUtils;
import com.tpy.p2p.chesdai.entity.CollectRecord;
import com.tpy.p2p.chesdai.entity.Loansign;
import com.tpy.p2p.chesdai.entity.Userbasicsinfo;
import com.tpy.p2p.chesdai.spring.service.CollectRecordService;
import com.tpy.p2p.chesdai.spring.service.UserBaseInfoService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 收藏记录
 * @author lsy
 *
 */
@Controller
@RequestMapping(value ="Appcollectlist" )
public class APPCollectRecordController {
	
	/**
	 * 收藏记录接口
	 */
	@Resource
	private CollectRecordService collectRecordService;
	@Resource
	private UserBaseInfoService userBaseInfoService;
	
    /**
     * 跳转到收藏列表
     * @return
     */
    @RequestMapping(value="/collect",method=RequestMethod.POST)
    public JSONObject collectList(
    		@ModelAttribute("PageModel") PageModel page,Long uid,
    		HttpServletRequest request){
    	Map<String,Object> message=new HashMap<String,Object>();
    	//获取当前用户信息
    	Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
    	//查询用户的收藏记录条数
    	Object obj=collectRecordService.queryCollectCount(user.getId());
    	page.setTotalCount(Integer.parseInt(obj.toString()));
    	//查询用户的收藏记录
    	List collects=collectRecordService.queryUserCollect(user.getId(), page);
    	message.put("page", page);
    	message.put("collects", collects);
    	return JSONObject.fromObject(message);
    }
    
    /**
     * 删除记录
     * @param page分页信息
     * @param id
     * @param request
     * @return
     */
    @RequestMapping(value="/deleteCollect",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject deleteCollect(
    		@ModelAttribute("PageModel") PageModel page,
    		@RequestParam(value = "id", defaultValue = "", required = false) Long id,Long uid,
    		HttpServletRequest request){
    	try {
    		collectRecordService.deleteCollect(id);
    	} catch(Throwable e) {
    		e.getMessage();
    	}
    	return collectList(page,uid, request);
    }
    
    /**
     * 添加收藏记录
     * @param id 借款标id
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/addCollect")
    public String addCollect(
    		@RequestParam(value = "id", defaultValue = "", required = false)Long id,Long uid,
    		HttpServletRequest request){
    	boolean flag=false;
    	//获取当前用户信息
    	Userbasicsinfo user = userBaseInfoService.queryUserById(uid);
    	Loansign loansign=new Loansign(id);
    	CollectRecord collectRecord=new CollectRecord(loansign,user, DateUtils.format(null));
    	flag=collectRecordService.addCollect(collectRecord);
    	if(flag){
    		return "收藏成功！";
    	}
    	return "已经收藏过了！";
    }
}
