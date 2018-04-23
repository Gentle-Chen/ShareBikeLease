<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>


<div class="panel-group not-radius cnaac-fold" id="accordion2">
	<div class="panel panel-default">
		<div id="collapseOne" class="panel-collapse in">
			<div class="panel-body">
				<ul class="nav nav-pills nav-stacked">
					<li ${param.action == 'location'?'class="active"':''}><a href="${ctx}/user/located">定位</a></li><br>
					<li ${param.action == 'order'?'class="active"':''}><a href="${ctx}/user/order">我的订单</a></li><br>
					<li ${param.action == 'recharge'?'class="active"':''}><a href="${ctx}/user/recharge">余额充值</a></li>
					<li ${param.action == 'deposit'?'class="active"':''}><a href="${ctx}/user/deposit">押金</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

