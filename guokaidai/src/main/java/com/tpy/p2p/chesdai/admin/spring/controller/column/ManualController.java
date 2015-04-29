package com.tpy.p2p.chesdai.admin.spring.controller.column;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.p2p.chesdai.admin.spring.service.ColumnManageService;
import com.tpy.p2p.chesdai.admin.spring.service.column.ManualService;
import com.tpy.p2p.chesdai.entity.Manual;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tpy.base.model.PageModel;
import com.tpy.p2p.chesdai.admin.spring.service.ColumnManageService;
import com.tpy.p2p.chesdai.entity.Manual;
import com.tpy.p2p.chesdai.entity.Outline;
import com.tpy.p2p.chesdai.admin.spring.service.column.ManualService;
import com.tpy.p2p.chesdai.admin.spring.service.column.OutlineService;

/**
 * 新手手册管理
 * @author My_Ascii
 *
 */
@Controller
@RequestMapping(value = { "manual" })
public class ManualController {

    /*** 注入OutlineService*/
    @Resource
    ManualService manualService;
    
    /*** 引用ColumnManageService*/
    @Resource
    ColumnManageService columnservice;
    
    /*** manualList 用来存放manualList的集合的名称*/
    private String manualList = "manualList";
    
    /*** page 分页*/
    private String page = "page";
    
    /**
     * 查询所有手册
     * 
     * @param pageModel 分页
     * @param request 请求
     * @return 返回页面
     */
    @RequestMapping(value = { "queryAllManual", "" })
    public ModelAndView queryAllTopics(PageModel pageModel,
            HttpServletRequest request) {
        request.setAttribute(manualList, manualService.queryAllManual(pageModel));
        request.setAttribute(page, pageModel);
        return new ModelAndView("WEB-INF/views/admin/column/manuallist");
    }

    /**
     * 跳转到添加/修改手册的页面
     * @param outlineId 手册id
     * @param operation add/upt
     * @param request HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping("/forwardAddOrUpt")
    public ModelAndView queryTopicById(long manualId, String operation, HttpServletRequest request) {
        if(operation.equals("upt")){
            request.setAttribute("manual", manualService.queryManualById(manualId));
        }
        request.setAttribute("operation", operation);
        return new ModelAndView("WEB-INF/views/admin/column/add_upt_manual");
    }
    
    /**
     * 新增/修改手册
     * @param outline 手册
     * @param operation add/upt
     * @param request HttpServletRequest
     * @return JSONObject
     */
    @RequestMapping("/add_upt_manual")
    @ResponseBody
    public void update(@ModelAttribute("Manual") Manual manual, String operation,
    		HttpServletRequest request,HttpServletResponse response) {
    	PrintWriter out = null;
        JSONObject json = new JSONObject();
        response.setHeader("Content-type", "text/html;charset=UTF-8");  
        boolean b = false;
        try {
        	out = response.getWriter();
            if (manual.getIsShow() == null) {
            	manual.setIsShow(0);
            }
            if(operation.equals("add")){
            	b=manualService.addManual(manual,request);
            } else if(operation.equals("upt")){
            	b=manualService.updateManual(manual,request);
            }
            //重置application
            if (b) {
            	columnservice.resetApplaction(request);
                json=columnservice.setJson(json, "200", "更新成功", "main69", "closeCurrent");
            } else {
                json=columnservice.setJson(json, "200", "请上传JPG、PNG、GIF图片类型", "main69", "closeCurrent");
            }
            out.print(json);
        } catch (Throwable e) {
            json.element("message", "更新失败");
            json.element("statusCode", "300");
            json.element("callbackType", "closeCurrent");
            e.getMessage();
            out.print(json);
        }
    }
    
    /**
     * 删除手册
     * @param ids 被选中手册的id
     * @param request HttpServletRequest
     * @return JSONObject
     */
    @RequestMapping("/deleteManual")
    @ResponseBody
    public JSONObject deleteTopics(String ids, HttpServletRequest request) {
        JSONObject json = new JSONObject();
        try {
            columnservice.deleteMany(Manual.class, ids);
          //重置application
            columnservice.resetApplaction(request);
            return columnservice.setJson(json, "200", "更新成功", "main69", "");
        } catch (Exception e) {
            return columnservice.setJson(json, "300", "更新失败", "main69", "");
        }
    }
}
