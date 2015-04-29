package com.tpy.p2p.chesdai.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpy.p2p.pay.constant.PayURL;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ips.security.utility.IpsCrypto;

/**
 * Servlet implementation class RegisterSubjectServlet
 */
public class RegisterCreditorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final Log log=LogFactory.getLog(getClass());
       
    public RegisterCreditorServlet() {
        super();
    }

	/**
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String desede=request.getAttribute("desede").toString();
		try{	
			// 将充值信息转换成xml文件
	        //String bidxml = ParseXML.bidXml(bid);aaa
	    	//生成xml文件字符串
	  		//String  = ParseXML.registration(entity);
	  		//将生成的xml文件进行3des加密
	  		//String desede = IpsCrypto.triDesEncrypt(bidxml,ParameterIps.getDes_algorithm(),ParameterIpsaa.getDesedevector());
	  		//将加密后的字符串不换行
	  		desede = desede.replaceAll("\r\n","");
	  		log.info("desede = " + desede);
	  		//将“ 平台 ”账号 、用户注册信息、证书拼接成一个字符串
	  		StringBuffer argSign = new StringBuffer(com.tpy.p2p.pay.util.ParameterIps.getCert()).append(desede).append(com.tpy.p2p.pay.util.ParameterIps.getMd5ccertificate());
	  		//将argSign进行MD5加密
	  		String md5 = IpsCrypto.md5Sign(argSign.toString());
	  		log.info("md5 = " + md5);
			response.setContentType("text/html;charset=UTF-8");
			
			try {
				/* TODO output your page here. You may use following sample code. */
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Servlet AccountServlet</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<form action="+ PayURL.BIDTESTURL+" id=\"frm1\" method=\"post\">");
				out.println("<input type=\"hidden\" name=\"pMerCode\" value=" + com.tpy.p2p.pay.util.ParameterIps.getCert() + ">");
				out.println("<input type=\"hidden\" name=\"p3DesXmlPara\" value=" + desede + ">");
				out.println("<input type=\"hidden\" name=\"pSign\" value=" + md5 + ">");
				out.println("</form>");
				out.println("<script language=\"javascript\">");
				out.println("document.getElementById(\"frm1\").submit();");
				out.println("</script>");
				out.println("</body>");
				out.println("</html>");
			 } finally {
				out.close();
			 }
	    }catch(Exception e)
	    {
	    	log.error("注册宝付出现异常",e);
	    }
		}

}
