package com.tpy.p2p.chesdai.admin.spring.service.column;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Banner;
import com.tpy.p2p.chesdai.entity.Outline;
import com.tpy.p2p.chesdai.entity.Topic;
import com.tpy.p2p.chesdai.spring.util.FileUtil;

/**
 * 提纲管理
 * @author My_Ascii
 *
 */
@Service
public class OutlineService {
    
    /*** 注入HibernateSupport*/
    @Resource
    HibernateSupport commondao;

    /**
     * 分页查询提纲管理
     * 
     * @return List
     */
    public List queryAllOutline(PageModel page) {
        List list = new ArrayList();
        String hql = "select id, imgUrl, isShow, url, content from outline";
        list=commondao.pageListBySql(page, hql, Outline.class);
        return list;
    }

    /**
     * 根据id查询提纲详情
     * 
     * @param outlineId
     *            (提纲编号)
     * @return 返回提纲
     */
    public Outline queryOutlineById(long outlineId) {
        return commondao.get(Outline.class, outlineId);
    }

    /**
     * 修改提纲
     * 
     * @param outline
     *            提纲
     */
    public boolean updateOutline(Outline outline,HttpServletRequest request) {
    	// 文件夹名称
        String folder = "banner";
        // 上传图片
        String imgurl = FileUtil.upload(request, "fileurl", folder);
        // 如果有图片上传
        if (imgurl != null && !"1".equals(imgurl.trim())) {
            // 删除图片
            FileUtil.deleteFile(outline.getImgUrl(), folder, request);
            outline.setImgUrl(imgurl);
        }
        // 如果上传的不是图类型
        if (imgurl != null && imgurl.equals("2")) {
            return false;
        } 
        commondao.update(outline);
        return true;
    }
    
    /**
     * 新增提纲
     * 
     * @param outline
     *            提纲
     */
    public boolean addOutline(Outline outline,HttpServletRequest request) {
    	// 文件夹名称
        String folder = "banner";
        // 上传图片
        String imgurl = FileUtil.upload(request, "fileurl", folder);
        // 如果有图片上传
        if (imgurl != null && !"1".equals(imgurl.trim())) {
            // 删除图片
            FileUtil.deleteFile(outline.getImgUrl(), folder, request);
            outline.setImgUrl(imgurl);
        }
        // 如果上传的不是图类型
        if (imgurl != null && imgurl.equals("2")) {
            return false;
        } 
        commondao.save(outline);
          return true;
    }
}
