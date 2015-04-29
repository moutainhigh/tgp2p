package com.tpy.p2p.chesdai.spring.service;

import java.util.List;

import javax.annotation.Resource;

import com.tpy.base.model.PageModel;
import com.tpy.base.spring.orm.hibernate.impl.HibernateSupport;
import com.tpy.p2p.chesdai.entity.Generalizemoney;
import org.springframework.stereotype.Service;

/**   
 * Filename:    GeneralizeService.java   
 * Company:     太平洋金融  
 * @version:    1.0   
 * @since:  JDK 1.7.0_25  
 * Create at:   2014年2月20日 上午8:38:17   
 * Description:  前台会员推广信息查询
 *   
 * Modification History:   
 * 时间    			作者   	   	版本     		描述 
 * ----------------------------------------------------------------- 
 * 2014年2月20日 	LiNing      1.0     	1.0Version   
 */

/**
* <p>Title:GeneralizeService</p>
* <p>Description: 会员推广服务层</p>
* <p>Company: 太平洋金融</p>
* @author LiNing
* <p>date 2014年2月20日</p>
*/
@Service
public class GeneralizeService {
    
    
    /** 数据库操作层*/
    @Resource
    private HibernateSupport dao;
    
    
    /**
    * <p>Title: queryGenlizePage</p>
    * <p>Description: 查询会员的推广信息</p>
    * @param uid 会员编号
    * @param page 分页信息
    * @return 查询到的结果集
    */
    public List queryGenlizePage(String uid,PageModel page){
        
        
        String dataSql="FROM Generalize where genuid="+uid;
        
        return dao.pageListByHql(page, dataSql, true);
        
    }
    
    /**
    * <p>Title: querygenMoenyPage</p>
    * <p>Description: 查询会员奖金获得记录</p>
    * @param uid 会员编号
    * @param page 分页信息
    * @return
    */
    public List<Generalizemoney> querygenMoenyPage(String uid,PageModel page){
        
        String dataSql="FROM Manualintegral where user_id="+uid;
        
        return (List<Generalizemoney>) dao.pageListByHql(page, dataSql, true);
    }
    
}
