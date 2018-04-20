<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<link href="${ctx}/css/style2.css" rel="stylesheet" type="text/css" />


<div class="panel-group not-radius cnaac-fold" id="accordion2" >
	<div class="panel panel-default" >
		<div id="collapseOne" class="panel-collapse in" >
			<div class="panel-body" >
				<ul class="nav nav-pills nav-stacked" >
					<li ${param.action == 'bikeTotal'?'class="active"':''}><a href="${ctx}/bike/get">数据统计</a></li><br>
					<li id="bikeManage" ${param.action == 'bikeManage'?'class="active"':''}><a href="${ctx}/bike/bikeManage">单车管理</a></li>
					<li  ${param.action == 'addBike'?'class="active"':''}><a href="${ctx}/bike/toAddBike">新增单车</a></li>
					<li ${param.action == 'siteManage'?'class="active"':''}><a href="${ctx}/site/get">站点管理</a></li>
					<li ${param.action == 'addSite'?'class="active"':''}><a href="${ctx}/site/add">新增站点</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

