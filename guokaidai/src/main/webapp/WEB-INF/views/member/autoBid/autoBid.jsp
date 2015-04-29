<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>太平洋理财会员中心-自动投标</title>
<link rel="stylesheet" type="text/css" href="resources/css/vipcenter.css" />
<jsp:include page="/WEB-INF/views/visitor/common.jsp"></jsp:include>
<style>
table.vipSeversTable td {font-size:14px;}
table.vipSeversTable font {font-size:14px;color:#555}
table.vipSeversTable a {font-size:14px;color:#666}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/visitor/communal/head.jsp" />
<input type="hidden" id="session_userName" value="${session_user.userName}"/>
<div class="Content">
  <div class="w960px">
    <div class="vipContentBox">
      <jsp:include page="/WEB-INF/views/member/communal/communal_left.jsp" />
      <div class="vipRightBox" style="position:relative">
        <div class="vipHeadMenuBox">
          <ul>
            <li><a href="javascript:void(0);" class="vipHeadLink">自动投标</a></li>
          </ul>
        </div>
        <div class="vipContBox">
          <div class="vipContTitleBox">
            <h1 class="vipContTitle"><span><img src="resources/images/vipseversicon.png" /></span>尊敬的太平洋理财会员，以下是您设置的自动投标规则列表，你可以<a class="addAuto">新增</a>自动投标规则。</h1>
          </div>
          <table cellpadding="0" cellspacing="0" border="0"
            class="vipSeversTable">
            <thead>
              <tr>
                <th>编号</th>
                <th>有效期</th>
                <th>标的借款周期</th>
                <th>标的借款额度限额</th>
                <th>标的利率限额</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${automaticList}" var="automatic" varStatus="autoStatus">
           	  <tr>
           	    <td>${autoStatus.index+1 }<input type="hidden" value="${automatic.id }" class="autoBidId" /></td>
                <td>
                  <font class="pValidDate">${automatic.pValidDate }</font><font class="pValidType">${automatic.pValidType eq "D"?"天":"月" }</font>
                </td>
                <td>
                  <font class="pSTrdCycleValue">${automatic.pSTrdCycleValue }</font>~<font class="pETrdCycleValue">${automatic.pETrdCycleValue }</font><font class="pTrdCycleType">${automatic.pTrdCycleType eq "D"?"天":"月" }</font>
                </td>
                <td>
                  <font class="pSAmtQuota">${automatic.pSAmtQuota }</font>~<font class="pEAmtQuota">${automatic.pEAmtQuota }</font>元
                </td>
                <td>
                  <font class="pSIRQuota">${automatic.pSIRQuota }</font>%~<font class="pEIRQuota">${automatic.pEIRQuota }</font>%
                </td>
                <td><font class="pStatus">${automatic.state eq "1"?"启用中":"未启用" }</font></td>
                <td>
                  <c:if test="${automatic.state eq '1'}">
                    <a onclick="disAuto(${automatic.id })" style="color:#51abff">停用</a>
                  </c:if>
                  <c:if test="${automatic.state eq '2'}">
                    <a onclick="enAuto(${automatic.id })" style="color:#51abff">启用</a>
                  </c:if>
                </td>
           	  </tr>
           	  </c:forEach>
              <!-- <tr>
                <td>1<input type="hidden" value="45" class="autoBidId" /></td>
                <td>
                  <font class="pValidDate">30</font><font class="pValidType">天</font>
                </td>
                <td>
                  <font class="pSTrdCycleValue">30</font>~<font class="pETrdCycleValue">60</font><font class="pTrdCycleType">天</font>
                </td>
                <td>
                  <font class="pSAmtQuota">10000.00</font>~<font class="pEAmtQuota">200000.00</font>元
                </td>
                <td>
                  <font class="pSIRQuota">20.00</font>%~<font class="pEIRQuota">30.00</font>%
                </td>
                <td><font class="pStatus">未启用</font></td>
                <td><a class="addAuto">新增</a><a onclick="editAuto(0)" style="margin-left:5px">编辑</a><a onclick="deleteAuto(0)" style="margin-left:5px">删除</a></td>
              </tr> -->
            </tbody>
            <%-- <tfoot>
              <tr>
                <td colspan="10">
                  <div class="tablePage">
                    <span>共${pager.totalCount}条${pager.totalPage}页</span><span>当前第${p.pageNum}页</span>
                    <a href="javascript:jumpPage(1);">首页</a>
                    <a href="javascript:jumpPage(${pager.pageNum-1 });">上一页</a><a
                      href="javascript:jumpPage(${pager.pageNum+1 });">下一页</a><a
                      href="javascript:jumpPage(${pager.totalPage});">尾页</a>跳转<inid="page_no" type="text" class="tabPageJumpTx" /><input
                      type="button" value="确定" class="tabPageJumpBnt" onclick="jumpPage;"/>
                  </div>
                </td>
              </tr>
            </tfoot> --%>
          </table>
          <style>
          .autoBg{position: absolute;top:0;left:0;width:800px;min-height: 400px;z-index: 99;  background: #000;opacity: 0.5;filter: alpha(opacity=50);display: none;}
          .autoBidDiv {width:100%;line-height: 30px;}
          .autoBid{position: absolute;width:auto;padding:5px 15px 15px 15px;z-index: 99;left:  160px;background-color: #fff;border: 1px solid #d0d0d0;display: none;}
          .autoBid input[type="text"] {height:20px;line-height:20px;border:1px solid #aaa;}
          </style>
          <div class="autoBg"></div>
          <div class="autoBid">
            <form action="" id="autoForm">
            <div class="autoBidDiv title" style="font-weight: bold;">新增自动投标规则</div>
            <div class="autoBidDiv">
              <span style="display:inline-block;width:90px;text-align:right">规则有效期：</span><input type="text" name="pValidDate" style="width:40px;padding-left:2px" />&nbsp;
              <select name="pValidType" class="pValidType" id="pValidType_0">
                <option value="D">天</option>
                <option value="M">月</option>
              </select>
            </div>
            <div class="autoBidDiv">
              <span style="display:inline-block;width:90px;text-align:right">标的借款周期：</span><input type="text" name="pSTrdCycleValue" style="width:40px;padding-left:2px" />~<input type="text" name="pETrdCycleValue" style="width:40px;padding-left:2px" />
              <select name="pTrdCycleType" class="pTrdCycleType" id="pTrdCycleType_0">
                <option value="D">天</option>
                <option value="M">月</option>
              </select>
            </div>
            <div class="autoBidDiv">
              <span style="display:inline-block;width:90px;text-align:right">标的借款额度：</span><input type="text" name="pSAmtQuota" style="width:80px;padding-left:2px" />~<input type="text" name="pEAmtQuota" style="width:80px;padding-left:2px" />元
            </div>
            <div class="autoBidDiv">
              <span style="display:inline-block;width:90px;text-align:right">标的利率限额：</span><input type="text" name="pSIRQuota" style="width:40px;padding-left:2px" />%~<input type="text" name="pEIRQuota" style="width:40px;padding-left:2px" />%
            </div>
          <!--    <div class="autoBidDiv">
              <span style="display:inline-block;width:90px;text-align:right">规则状态：</span><input type="radio" name="pStatus" value="1" checked="checked"/>不启用<input type="radio" name="pStatus" value="2" style="margin-left:10px"/>启用
            </div>  -->
            <div style="margin-top:10px"> 
              <a class="authenticateBnt" onclick="submitAdd()" style="height:25px;line-height:25px;margin-left:0px">确认</a><a class="authenticateBnt" onclick="submitUpdate(1)" style="height:25px;line-height:25px;margin-left:0px;display:none">确认</a><a class="authenticateBnt" onclick="removeAdd()" style="height:25px;line-height:25px;margin-left:30px">取消</a>
            </div>
            </form>
          </div>
          <script src="/resources/js/loanSign/autoBid.js"></script>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/visitor/footer.jsp" />
</body>
</html>
