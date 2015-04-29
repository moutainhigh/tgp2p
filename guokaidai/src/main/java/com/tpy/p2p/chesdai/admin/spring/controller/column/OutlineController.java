package com.tpy.p2p.chesdai.admin.spring.controller.column;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.p2p.chesdai.admin.spring.service.column.OutlineService;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tpy.base.model.PageModel;
import com.tpy.p2p.chesdai.admin.spring.service.ColumnManageService;
import com.tpy.p2p.chesdai.entity.Outline;
import com.tpy.p2p.chesdai.admin.spring.service.column.OutlineService;

/**
 * 提纲管理
 * @author My_Ascii
 *
 */
@Controller
@RequestMapping(value = { "outline" })
public class OutlineController {

    /*** 注入OutlineService*/
    @Resource
    OutlineService outlineService;
    
    /*** 引用ColumnManageService*/
    @Resource
    ColumnManageService columnservice;
    
    /*** topicsList 用来存放outline的集合的名称*/
    private String outlineList = "outlineList";
    
    /*** page 分页*/
    private String page = "page";
    
    /**
     * 查询所有一级栏目
     * 
     * @param pageModel 分页
     * @param request 请求
     * @return 返回页面
     */
    @RequestMapping(value = { "queryAllOutline", "" })
    public ModelAndView queryAllTopics(PageModel pageModel,
            HttpServletRequest request) {
        request.setAttribute(outlineList, outlineService.queryAllOutline(pageModel));
        request.setAttribute(page, pageModel);
        return new ModelAndView("WEB-INF/views/admin/column/outlinelist");
    }

    /**
     * 跳转到添加/修改提纲的页面
     * @param outlineId 提纲id
     * @param operation add/upt
     * @param request HttpServletRequest
     * @return ModelAndView
     */
    @RequestMapping("/forwardAddOrUpt")
    public ModelAndView queryTopicById(long outlineId, String operation, HttpServletRequest request) {
        if(operation.equals("upt")){
            request.setAttribute("outline", outlineService.queryOutlineById(outlineId));
        }
        request.setAttribute("operation", operation);
        return new ModelAndView("WEB-INF/views/admin/column/add_upt_outline");
    }
    
    /**
     * 新增/修改提纲
     * @param outline 提纲
     * @param operation add/upt
     * @param request HttpServletRequest
     * @return JSONObject
     */
    @RequestMapping("/add_upt_outline")
    @ResponseBody
    public void update(@ModelAttribute("Ontline") Outline outline, String operation,
    		HttpServletRequest request,HttpServletResponse response) {
    	PrintWriter out = null;
        JSONObject json = new JSONObject();
        response.setHeader("Content-type", "text/html;charset=UTF-8");  
        boolean b = false;
        try {
        	out = response.getWriter();
            if (outline.getIsShow() == null) {
            	outline.setIsShow(0);
            }
            if(operation.equals("add")){
            	b=outlineService.addOutline(outline,request);
            } else if(operation.equals("upt")){
            	b=outlineService.updateOutline(outline,request);
            }
            //重置application
            if (b) {
            	columnservice.resetApplaction(request);
                json=columnservice.setJson(json, "200", "更新成功", "main68", "closeCurrent");
            } else {
                json=columnservice.setJson(json, "200", "请上传JPG、PNG、GIF图片类型", "main68", "closeCurrent");
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
     * 删除提纲
     * @param ids 被选中提纲的id
     * @param request HttpServletRequest
     * @return JSONObject
     */
    @RequestMapping("/deleteOutline")
    @ResponseBody
    public JSONObject deleteTopics(String ids, HttpServletRequest request) {
        JSONObject json = new JSONObject();
        try {
            columnservice.deleteMany(Outline.class, ids);
          //重置application
            columnservice.resetApplaction(request);
            return columnservice.setJson(json, "200", "更新成功", "main68", "");
        } catch (Exception e) {
            return columnservice.setJson(json, "300", "更新失败", "main68", "");
        }
    }
}
