<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageContent" style="padding:5px;">
	<div class="tabs" layoutH="0">
		<div class="tabsContent" >
			<div>
				<div layoutH="50" style="float:left; display:block;overflow:auto; width:222px; border:solid 1px #CCC; line-height:21px; background:#fff">
				    <ul class="tree treeFolder">
						<li><a href="javascript:void(0);">资金统计</a>
							<ul>
								<li><a href="/fund/queryaccountinfo"  target="ajax" rel="jbsxBox">资金明细</a></li>
								<li><a href="/fund/fundbasis" target="ajax" rel="jbsxBox">资金统计</a></li>
							</ul>
						</li>
						
				     </ul>
				</div>
				
				<div id="jbsxBox" class="unitBox" style="margin-left:246px;">
					
				</div>
				
			</div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>