<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>缴纳押金</title>
<!-- 		<script type="text/javascript" src="/ShareBikeLease/js/quote/jquery-3.2.1.min.js"></script> -->
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/zzsc.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/webuploader.css">		
		<link rel="stylesheet" href="/ShareBikeLease/css/pikaday.css">	
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/moment.js"></script>   
	    <script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/pikaday.js"></script>
	    <script src="/ShareBikeLease/js/quote/common.js"></script>
	    <link rel="stylesheet" href="/ShareBikeLease/js/quote/layui/css/layui.css"  media="all">
	    <script src="/ShareBikeLease/js/quote/layui/layui.js" charset="utf-8"></script>
 		<script src="/ShareBikeLease/js/bike.js" charset="utf-8"></script>
 		<script src="/ShareBikeLease/js/money.js" charset="utf-8"></script>
 		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/pay/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/pay/main.css" />
<!--  		<script type="text/javascript" src="/ShareBikeLease/js/pay/jquery.min.js"></script> -->
		<script type="text/javascript" src="/ShareBikeLease/js/pay/amazeui.min.js"></script>
		<script type="text/javascript" src="/ShareBikeLease/js/pay/ui-choose.js"></script>
		<script type="text/javascript">
			
		</script>
		<style type="text/css">
			th {text-align: center;}
			.read-protocol-modal p{
			    line-height: 20px;
			    text-align:left;
			}
		
		</style>
	</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true" >
		<jsp:param value="operation" name="action" />
	</jsp:include>

	 <div class="row cnaac-bg">
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="tab-one">
			  	<div class="row">
			  		<div class="col-md-2">
			  		   <jsp:include page="/WEB-INF/views/user/userLeftMenu.jsp" flush="true" >	
			  		   		<jsp:param value="deposit" name="action" />
			  		   	</jsp:include>
			  		</div>
  					  <div class="col-md-10 l-b">
				  		 <div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
		<div class="tr_rechtext">
<!-- 			<p class="te_retit">充值中心</p> -->
<!-- 			<p>1.本次操作所有权仅归本系统所有.</p> -->
<!-- 			<p>2.一旦充值，恕不退款。</p> -->
			<p>当前余额：<span>${User.u_balance} 元</span></p><br />
			<p>是否缴纳押金：<span>
				<c:if test="${deposit.d_status == '1' }">
					是
				</c:if>
				<c:if test="${deposit.d_status == '0' || deposit == null}">
					否
					<p>需缴纳押金：<span>200  元</span></p>
				</c:if>
			</span></p><br />
			
		</div>
		<c:if test="${deposit.d_status == '0' || deposit == null}">
			<div class="tr_paybox"> 
				
					<input id="payDepositBtn" type="button" value="缴纳" class="tr_pay am-btn" onclick="payDeposit('${User.u_uuid}')"/>
					
			</div>
		</c:if>
		<c:if test="${deposit.d_status == '1' }">
			<div class="tr_paybox"> 
				
					<input id="returnDepositBtn" type="button" value="退还押金" class="tr_pay am-btn" onclick="returnDeposit('${User.u_uuid}')"/>
					
			</div>
		</c:if>
<!-- 		<form action="" class="am-form" id="doc-vld-msg"> -->
<!-- 			<div class="tr_rechbox"> -->
<!-- 				<div class="tr_rechhead"> -->
<!-- <!-- 					<img src="images/ys_head2.jpg" /> --> 
<!-- 					<p>充值帐号： -->
<%-- 						<a>${User.u_name}</a> --%>
<!-- 					</p> -->
<!-- 					<div class="tr_rechheadcion"> -->
<!-- <!-- 						<img src="images/coin.png" alt="" /> --> 
<%-- 						<span>当前余额：<span>${User.u_balance}</span></span> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="tr_rechli am-form-group"> -->
<!-- 					<ul class="ui-choose am-form-group" id="uc_01"> -->
<!-- <!-- 						<li style="z-index: 3;background: transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom;"> --> 
<!-- 							<li> -->
<!-- 							<label class="am-radio-inline" > -->
<!-- 									<input type="radio"  value="10" name="docVlGender"  data-validation-message="请选择一项充值额度"> 10￥ -->
<!-- 								</label> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<label class="am-radio-inline"> -->
<!-- 									<input type="radio" value="20" name="docVlGender" data-validation-message="请选择一项充值额度"> 20￥ -->
<!-- 								</label> -->
<!-- 						</li> -->

<!-- 						<li> -->
<!-- 							<label class="am-radio-inline"> -->
<!-- 									<input type="radio" value="50" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥ -->
<!-- 								</label> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<label class="am-radio-inline"> -->
<!-- 									<input type="radio" value="0" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他金额 -->
<!-- 								</label> -->
<!-- 						</li> -->
<!-- 						<div id="notEmptyMoney" class="am-alert am-alert-danger" style="display:none">请选择一项充值额度</div> -->
<!-- 					</ul> -->
					
<!-- 				</div> -->
<!-- 				<div class="tr_rechoth am-form-group"> -->
<!-- 					<span>其他金额：</span> -->
<!-- 					<input id="money1" type="text" class="othbox" style="width: 100px;background: #fff;border: 2px solid #CCCCCC;font-size: 16px; -->
<!-- 						height: 48px;border-radius: 4px;float: left;margin-right: 30px;" /> -->
<!-- 					<div id="illegalMoney" class="am-alert am-alert-danger" style="display:none">充值金额范围：10-10000元</div> -->
<!-- 					<p>充值金额范围：10-10000元</p> -->
<!-- 				</div> -->
<!-- 				<div class="tr_rechcho am-form-group"> -->
<!-- 					<span>充值方式：</span> -->
<!-- 					<label class="am-radio"> -->
<!-- 							<input type="radio" name="radio1" value="1" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="/ShareBikeLease/image/wechatpay.png"> -->
<!-- 						</label> -->
<!-- 					<label class="am-radio" style="margin-right:30px;"> -->
<!-- 							<input type="radio" name="radio1" value="2" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="/ShareBikeLease/image/zfbpay.png"> -->
<!-- 						</label> -->
<!-- 						<div id="notEmptyWay" class="am-alert am-alert-danger" style="display:none">请选择一种充值方式</div> -->
<!-- 				</div> -->
<!-- 				<div class="tr_rechnum"> -->
<!-- 					<span>应付金额：</span> -->
<!-- 					<p class="rechnum" id="money">0.00元</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="tr_paybox"> -->
<!-- 				<input id="rechargeBtn" type="button" value="确认支付" class="tr_pay am-btn" onclick="recharge()"/> -->
<!-- 				<span>温馨提示：请理性消费。</span> -->
<!-- 			</div> -->
<!-- 		</form> -->
	</div>
</div>
	                    <div class="row">
	                        <nav class="right-block">
							  	<ul class="pagination" id="foot_page_div"></ul>
							</nav>
						</div>
			  		</div>
  				</div>
			  </div>
		     </div>
	       </div>
       </div>
		
</body>

</html>
