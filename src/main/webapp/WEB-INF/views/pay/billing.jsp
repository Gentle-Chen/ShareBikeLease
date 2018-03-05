<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/common/taglibs.jsp"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		
<%-- 		<%@ include file="/WEB-INF/common/v1.1/meta.jsp" %> --%>
		<title>支付中心</title>
		
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/v1.1/cnaacbs.css" />
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/v1.1/cnaacbs-theme.css" />
		<link href="/ShareBikeLease/css/v1.1/css.css" rel="stylesheet" type="text/css">
		<link href="/ShareBikeLease/css/v1.1/custom.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ShareBikeLease/js/quote/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="/ShareBikeLease/js/bike.js"></script>
	</head>
	<body>
<%-- 		<jsp:include page="/WEB-INF/pages/user/common/header.jsp" flush="true"> --%>
<%-- 		 <jsp:param value="userCenter" name="action"/> --%>
<%-- 		</jsp:include> --%>
	
	 <div class="row cnaac-bg"><!--this-->
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="tab-one">
			  	
			  	<div class="row">
			  		<div class="col-md-2">
<%-- 			  		    <jsp:include page="/WEB-INF/pages/user/leftMenu.jsp" flush="true"> --%>
<%-- 							<jsp:param value="pay" name="action"/> --%>
<%-- 						</jsp:include> --%>
			  		</div>
			  		<div class="col-md-10 l-b"><!--this-->
						<div class="row">
							<div class="col-sm-12">
								<form class="form-horizontal form-billing" role="form" method="post" action="${ctx}/pay/weixin" id="myform">
									<div class="form-group middle-aligned">
										<label class="col-md-4 control-label not-t-p text-right">服务名称</label>
										<label class="col-md-8 control-label not-t-p ">单车</label>
									</div>
									<div class="form-group middle-aligned">
										<label class="col-md-4 control-label not-t-p text-right">服务费用</label>
										<label class="col-md-8 control-label not-t-p ">
										<span class="text-danger">${requestScope.leaseMap.get("money")}</span> 元
										<%-- <c:if test="${not empty content}">
											<span class="text-danger"><fmt:formatNumber value="${price}" minFractionDigits="2"/></span> (原价：<del>${product.productprice}</del>)元&nbsp;&nbsp;<span class="text-danger glyphicon glyphicon-gift" id="content">${content}</span>
										</c:if>
										<c:if test="${empty content}">
											<span class="text-danger">${product.productprice}元</span>
										</c:if> --%>
										</label>
									</div>
									<div class="form-group middle-aligned pay-mode">
										<label class="col-md-4 control-label not-t-p text-right">支付方式</label>
										<div class="col-md-8">
										<input class="t-m" type="hidden" name="u_uuid" value="${requestScope.leaseMap.get('u_uuid')}">
										<input class="t-m" type="hidden" name="b_uuid" value="${requestScope.leaseMap.get('b_uuid')}">
										<input class="t-m" type="hidden" name="s_uuid" value="${requestScope.leaseMap.get('s_uuid')}">
										<input class="t-m" type="hidden" name="l_uuid" value="${requestScope.leaseMap.get('l_uuid')}">
										<input class="t-m" type="hidden" name="l_returnTime" value="${requestScope.leaseMap.get('l_returnTime')}">
											<label class="radio-inline not-t-p">
											  <input class="t-m" type="radio" name="payType" value="2" checked="">
											  <img class="pay-mode-img" src="/ShareBikeLease/image/WeChat_pay.gif">
											</label>
											<label class="radio-inline not-t-p">
											  <input class="t-m" type="radio" name="payType" value="1">
											  <img class="pay-mode-img" src="/ShareBikeLease/image/Unionpay.gif">
											</label>
											<label class="radio-inline not-t-p">
											  <input class="t-m" type="radio" name="payType" value="1">
											  <img class="pay-mode-img" src="/ShareBikeLease/image/alipay.gif">
											</label>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-8 col-md-offset-4">
											<button type="button" id="subBtn" class="btn btn-primary default">确认支付</button>
											<!--<a href="recharge_qrcode.html" class="">使用二维码付款</a>-->
										</div>
									</div>
<%-- 									<input type="hidden" id="productId" value="${product.productid }"> --%>
<%-- 									<input type="hidden" id="appverUuid" value="${appverUuid }"> --%>
								</form>
								<!-- 微信支付（Modal） -->
<!-- 								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false"> -->
<!-- 									<div class="modal-dialog"> -->
<!-- 										<div class="modal-content"> -->
<!-- 											<div class="modal-header"> -->
<!-- 												<button type="button" class="close" data-dismiss="modal"  -->
<!-- 														aria-hidden="true">× -->
<!-- 												</button> -->
<!-- 												<h4 class="modal-title" id="myModalLabel"> -->
<!-- 													微信扫码支付 -->
<!-- 												</h4> -->
<!-- 											</div> -->
<!-- 											<div class="modal-body"> -->
<!-- 												<div class="row"> -->
<!-- 													<div class="col-sm-12"> -->
<!-- 														<div class="row"> -->
<!-- 															<div class="col-md-10 col-md-offset-1"> -->
<!-- 																<div class="saoyisao-box"> -->
<!-- 																	<div class="left"> -->
<%-- 																		<img id="qcodeImg" src="${ctx}/static/images/pay/qrcode.png" alt="image" class="img-thumbnail center-block"> --%>
<!-- 																	</div> -->
<!-- 																	<div class="right"> -->
<%-- 																		<img src="${ctx}/static/images/pay/saoyisao.png" alt="image" class="img-responsive img"> --%>
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="modal-footer"> -->
<!-- 												<button type="button" class="btn btn-default" data-dismiss="modal">关闭 -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div>/.modal-content -->
<!-- 									</div>/.modal-dialog -->
<!-- 								</div>/.modal -->
							</div>
						</div>
			  		</div>
			  	</div>
			  </div>
			</div>
		</div>
	</div>
<%-- 	<jsp:include page="/WEB-INF/pages/user/common/footer.jsp" flush="true" /> --%>
	</body>
</html>
