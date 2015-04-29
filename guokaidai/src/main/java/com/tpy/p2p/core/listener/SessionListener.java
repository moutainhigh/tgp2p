package com.tpy.p2p.core.listener;

import com.tpy.base.util.SysUtil;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**   
 * Filename:    SessionListener.java   
 * Company:     太平洋金融  
 * @version:    1.0   
 * @since:  JDK 1.7.0_25  
 * Create at:   2014年4月8日 上午10:33:57   
 * Description:  暂时无用
 *   
 * Modification History:   
 * 时间    			作者   	   	版本     		描述 
 * ----------------------------------------------------------------- 
 * 2014年4月8日 	LiNing      1.0     	1.0Version   
 */

public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // TODO Auto-generated method stub
        //se.getSession().setAttribute("sysmap", SysUtil.getInstance());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // TODO Auto-generated method stub

    }

}
