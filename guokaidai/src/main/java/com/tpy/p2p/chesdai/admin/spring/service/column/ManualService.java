package com.tpy.p2p.chesdai.admin.spring.service.column;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Banner;
import com.tpy.p2p.chesdai.entity.Manual;
import com.tpy.p2p.chesdai.entity.Outline;
import com.tpy.p2p.chesdai.entity.Topic;
import com.tpy.p2p.chesdai.spring.util.FileUtil;

/**
 * 新手手册
 * @author My_Ascii
 *
 */
@Service
public class ManualService {
    
    /*** 注入HibernateSupport*/
    @Resource
    HibernateSupport commondao;

    /**
     * 分页查询新手手册管理
     * 
     * @return List
     */
    public List queryAllManual(PageModel page) {
        List list = new ArrayList();
        String hql = "select id, isShow, title, imgExplain from manual";
        list=commondao.pageListBySql(page, hql, Manual.class);
        return list;
    }

    /**
     * 根据id查询一级栏目详情
     * 
     * @param topicId
     *            (一级栏目编号)
     * @return 返回一级栏目
     */
    public Manual queryManualById(long manualId) {
        return commondao.get(Manual.class, manualId);
    }

    /**
     * 修改手册
     * 
     * @param manual
     *            新手手册
     */
    public boolean updateManual(Manual manual,HttpServletRequest request) {
    	// 文件夹名称
        String folder = "banner";
       
     // 上传图片
        String imgExplain = FileUtil.upload(request, "imgExplain1", folder);
        // 如果有图片上传
        if (imgExplain != null && !"1".equals(imgExplain.trim())) {
            // 删除图片
            FileUtil.deleteFile(manual.getImgExplain(), folder, request);
            manual.setImgExplain(imgExplain);
        }
        // 如果上传的不是图类型
        if (imgExplain != null && imgExplain.equals("2")) {
            return false;
        } 
        commondao.update(manual);
        return true;
    }
    
    /**
     * 新增手册
     * 
     * @param manual
     *            手册
     */
    public boolean addManual(Manual manual,HttpServletRequest request) {
    	// 文件夹名称
        String folder = "banner";
       
     // 上传图片
        String imgExplain = FileUtil.upload(request, "imgExplain1", folder);
        // 如果有图片上传
        if (imgExplain != null && !"1".equals(imgExplain.trim())) {
            // 删除图片
            FileUtil.deleteFile(manual.getImgExplain(), folder, request);
            manual.setImgExplain(imgExplain);
        }
        // 如果上传的不是图类型
        if (imgExplain != null && imgExplain.equals("2")) {
            return false;
        } 
        commondao.save(manual);
          return true;
    }
}
