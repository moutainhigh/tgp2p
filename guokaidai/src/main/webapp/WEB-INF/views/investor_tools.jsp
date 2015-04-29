<%--    
创建时间：2014年3月25日下午2:23:27   
创 建 人：LiNing   
相关说明：   
JDK1.7.0_25 tomcat7.0.47  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财贷款平台</title>
<base href="<%=basePath %>" />
<link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/huitou.css" />
<link rel="stylesheet" href="/resources/css/validationEngine.jquery.css" type="text/css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<script src="/resources/js/jquery.validationEngine.js" type="text/javascript"></script>
<script src="/resources/js/jquery.validationEngine-zh_CN.js" type="text/javascript"></script>
<!--Content-->
<div class="Content">
  <div class="w960px mapString"><span>您当前位置：</span><a href="#">太平洋理财</a>&gt;<a href="#">太平洋理财首页</a>&gt;<a href="javascript:viod(0);">太平洋理财计算器</a></div>
  <div class="w960px">
  <jsp:include page="/WEB-INF/views/visitor/communal/left.jsp" />
      <div class="projectRightBox">
        <div class="pjRightCont">
          <div class="jsqBox">
           <h4>太平洋理财计算器</h4>
           <p>1、“等额本息”即借款者，每月以相等的金额偿还贷款本息。</p>
           <p>2、“按月付息”采用按月付息，到期还本的计算方式。</p>
           <p>3、“一次性偿还”采用到期一次性偿还本息的计算放方式。</p>
           <p>（注意：本工具计算结果与实际可能会有以分为单位的误差。）</p>
          </div>   
          <div class="testBox">
           <span class="prctItemTitle">利息计算器</span>
           <form action="arith/loan_Calculate" method="post" id="tool">
           <table cellpadding="0" cellspacing="0" class="jsqTable">
             <tbody>
              <tr>
              	<th>申购金额:</th>
              	<td>
              		<input type="text" name="issueLoan" value="${loansign.issueLoan }" class="jsqTx validate[required,custom[numberNullMinus],min[0]]" style="width:80px;"/> 元
              	</td>
              	<th>借款人发标奖励:</th>
              	<td>
              		<input type="text" value="${loansign.pmfeeratio*100 }" name="pmfeeratio" class="jsqTx validate[custom[numberNullMinus],min[0],max[100]]" style="width:40px;"/> %</td>
              	<th>借款期限:</th>
              	<td>
              		<input type="text" name="month" value="${loansign.month }" class="jsqTx validate[required,custom[integerNullZero],min[0]]" style="width:40px;"/> 个月
              	</td>
              </tr>
              <tr>
              	<th>每年利率:</th>
              	<td>
              		<input type="text" name="rate" value="${loansign.rate*100 }" class="jsqTx validate[required,custom[numberNullMinus],min[0.01],max[100]]" style="width:40px;"/> %
              	</td>
              	<th>太平洋理财投标奖励:</th>
              	<td>
              		<input type="text" name="mfeeratio" value="${loansign.mfeeratio*100 }" class="jsqTx validate[custom[numberNullMinus],min[0],max[100]]" style="width:40px;"/> %
              	</td>
              	<th>还款方式:</th>
              	<td>
              		<select style="width:80px;" name="refundWay">
              			<option <c:if test="${loansign.refundWay==1 }">selected="selected"</c:if> value="1">等额本息</option>
              			<option <c:if test="${loansign.refundWay==2 }">selected="selected"</c:if> value="2">按月付息</option>
              			<option <c:if test="${loansign.refundWay==3 }">selected="selected"</c:if> value="3">一次性偿还</option>
              		</select>
              	</td>
              </tr>
             </tbody>
           </table>
           <div class="jsqBntbox"><input type="submit" value="开始计算" class="jsqBnt" /></div>
           </form>
          </div> 
          <div class="testBox">
           <span class="prctItemTitle">回款概述</span>
           <table cellpadding="0" cellspacing="0" class="jsqTable">
             <tbody>
              <tr>
              	<th>每个月回购本息:</th>
              	<td>￥<fmt:formatNumber value="${monthMoney }" pattern="0.00" /> </td>
              	<th>月利率:</th>
              	<td><fmt:formatNumber value="${loansign.rate*100/12 }" pattern="0.00" />%</td>
              	<th>回购本息总额:</th>
              	<td>￥<fmt:formatNumber value="${sumMoney}" pattern="0.00" /> </td>
              </tr>
              <tr>
              	<th>发标奖励金额:</th>
              	<td>￥<fmt:formatNumber value="${jiangli2 }" pattern="0.00" /></td>
              	<th>投标奖励金额:</th>
              	<td>￥<fmt:formatNumber value="${jiangli}" pattern="0.00" /></td>
              	<th>奖励总金额:</th>
              	<td>￥<fmt:formatNumber value="${jiangli+jiangli2}" pattern="0.00" /> </td>
              </tr>
             </tbody>
           </table>
          </div> 
           <div class="testBox">
           <span class="prctItemTitle">回购计划表</span>
           <table cellpadding="0" cellspacing="0" class="jsqInfoTable">
           <thead>
             <tr>
             	<th>期数</th>
             	<th>每期回购本息</th>
             	<th>每期回购本金</th>
             	<th>利息</th>
             </tr>
           </thead>
             <tbody>
             	<c:forEach items="${datalist}" var="calculateLoan">
             		<tr>
             			<td>${calculateLoan.count }</td>
             			<td>${calculateLoan.lixi+calculateLoan.benjin }</td>
             			<td>${calculateLoan.benjin }</td>
             			<td>${calculateLoan.lixi }</td>
             			<td> </td>
             		</tr>	
             	</c:forEach>
              
             </tbody>
           </table>
          </div> 
        </div>
        </div>
  </div>
</div>
<!--End Content-->
<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
<script type="text/javascript">
	$(function($){
		$("#tool").validationEngine({
			promptPosition:"topRight",
			autoHidePrompt:true,
			autoHideDelay:1000
		});
	});
</script>
</body>
</html>
