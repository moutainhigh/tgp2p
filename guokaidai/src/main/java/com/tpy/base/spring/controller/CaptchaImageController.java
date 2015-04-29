package com.tpy.base.spring.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tpy.base.util.LOG;
import com.jubaopen.commons.RandomUtils;
import com.jubaopen.commons.SecurityImageTool;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 验证码生成控制器
 * 
 * @author ldd
 * 
 */
@RequestMapping("cic")
@Controller
public class CaptchaImageController {

    /**
     * 不缓存
     */
    private static final String NO_CACHE = "No-cache";
    
    /**
     * 得到一个校验码
     * @param name      校验码保存键值
     * @param request   请求
     * @param response  响应
     */
    @RequestMapping("/code")
    public void getCode(String name, HttpServletRequest request,
            HttpServletResponse response) {

        if (null==name){
            return;
        }
            

        String code = RandomUtils.getDefaultString(4);
        System.out.println(name);
        LOG.info("产生一个验证码[" + code + "],保存于[" + name + "]");

        response.setHeader("Pragma",NO_CACHE);// 禁止缓存
        response.setHeader("Cache-Control",NO_CACHE);
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");// 指定生成的响应是图片
        request.getSession().setAttribute(name, code);
        System.out.printf("\n%s\t%s",name,request.getSession().getAttribute("adminrand"));
        try {
            ImageIO.write(SecurityImageTool.createImage(code), "JPEG",
                    response.getOutputStream());
        } catch (IOException e) {
            LOG.error("生成验证图片失败！", e);
        }
        
        

    }

    /**
     * 得到一个校验码
     * @param name      校验码保存键值
     * @param request   请求
     * @param response  响应
     */
    @RequestMapping("/appcode")
    @ResponseBody
    public HashMap getAppCode(String name, HttpServletRequest request,
            HttpServletResponse response) {
        HashMap map = new HashMap();

        if (null==name){
            map.put("success",false);
            map.put("message","姓名不能为空");
            return map;
        }
        String code = RandomUtils.getDefaultString(4);
        request.getSession().setAttribute(name, code);
        map.put("randcode",code);
        map.put("success",true);
        return map;
    }

}
