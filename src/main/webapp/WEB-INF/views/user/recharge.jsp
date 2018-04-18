<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>当前位置</title>
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
			// 将所有.ui-choose实例化
			$('.ui-choose').ui_choose();
			// uc_01 ul 单选
// 			var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
			var uc_01 = $('#uc_01 input[name="docVlGender"]');
			uc_01.click = function(index, item) {
				console.log('click', index, item.text())
			}
			uc_01.change = function(index, item) {
				console.log('change', index, item.text())
			}
			$(function() {
				$('#uc_01 li:eq(3)').click(function() {
					$('.tr_rechoth').show();
					$('.tr_rechoth').find("input").attr('required', 'true')
					$('.rechnum').text('10.00元');
					$("ul[id=uc_01] >li").css("background","url()");
					$(this).css("background","transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom");
				})
				$('#uc_01 li:eq(0)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('10.00元');
					$('.othbox').val('');
					$("ul[id=uc_01] >li").css("background","url()");
					$(this).css("background","transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom");
				})
				$('#uc_01 li:eq(1)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('20.00元');
					$('.othbox').val('');
					$("ul[id=uc_01] >li").css("background","url()");
					$(this).css("background","transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom");
				})
				$('#uc_01 li:eq(2)').click(function() {
					$('.tr_rechoth').hide();
					$('.rechnum').text('50.00元');
					$('.othbox').val('');
					$("ul[id=uc_01] >li").css("background","url()");
					$(this).css("background","transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom");
				})
				$(document).ready(function() {
					$('.othbox').on('input propertychange', function() {
						var num = $(this).val();
						$('.rechnum').html(num + ".00元");
					});
				});
			})
		
// 			$(function() {
// 				$('#doc-vld-msg').validator({
// 					onValid: function(validity) {
// 						$(validity.field).closest('.am-form-group').find('.am-alert').hide();
// 					},
// 					onInValid: function(validity) {
// 						var $field = $(validity.field);
// 						var $group = $field.closest('.am-form-group');
// 						var $alert = $group.find('.am-alert');
// 						// 使用自定义的提示信息 或 插件内置的提示信息
// 						var msg = $field.data('validationMessage') || this.getValidationMessage(validity);
		
// 						if(!$alert.length) {
// 							$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
// 							appendTo($group);
// 						}
// 						$alert.html(msg).show();
// 					}
// 				});
// 			});
			
			
		</script>
		<style type="text/css">
			th {text-align: center;}
			.read-protocol-modal p{
			    line-height: 20px;
			    text-align:left;
			}
			.bgimage{
				background: transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom;
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
			  		   		<jsp:param value="recharge" name="action" />
			  		   	</jsp:include>
			  		</div>
  					  <div class="col-md-10 l-b">
				  		 <div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
		<div class="tr_rechtext">
			<p class="te_retit">充值中心</p>
			<p>1.本次操作所有权仅归本系统所有.</p>
			<p>2.一旦充值，恕不退款。</p>
			
		</div>
		<form action="" class="am-form" id="doc-vld-msg">
			<div class="tr_rechbox">
				<div class="tr_rechhead">
<!-- 					<img src="images/ys_head2.jpg" /> -->
					<p>充值帐号：
						<a>${User.u_name}</a>
					</p>
					<div class="tr_rechheadcion">
<!-- 						<img src="images/coin.png" alt="" /> -->
						<span>当前余额：<span>${User.u_balance}</span></span>
					</div>
				</div>
				<div class="tr_rechli am-form-group">
					<ul class="ui-choose am-form-group" id="uc_01">
<!-- 						<li style="z-index: 3;background: transparent url(/ShareBikeLease/image/success.png) no-repeat right bottom;"> -->
							<li>
							<label class="am-radio-inline" >
									<input type="radio"  value="10" name="docVlGender"  data-validation-message="请选择一项充值额度"> 10￥
								</label>
						</li>
						<li>
							<label class="am-radio-inline">
									<input type="radio" value="20" name="docVlGender" data-validation-message="请选择一项充值额度"> 20￥
								</label>
						</li>

						<li>
							<label class="am-radio-inline">
									<input type="radio" value="50" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥
								</label>
						</li>
						<li>
							<label class="am-radio-inline">
									<input type="radio" value="0" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他金额
								</label>
						</li>
						<div id="notEmptyMoney" class="am-alert am-alert-danger" style="display:none">请选择一项充值额度</div>
					</ul>
					
				</div>
				<div class="tr_rechoth am-form-group">
					<span>其他金额：</span>
					<input id="money1" type="text" class="othbox" style="width: 100px;background: #fff;border: 2px solid #CCCCCC;font-size: 16px;
						height: 48px;border-radius: 4px;float: left;margin-right: 30px;" />
					<div id="illegalMoney" class="am-alert am-alert-danger" style="display:none">充值金额范围：10-10000元</div>
					<!--<p>充值金额范围：10-10000元</p>-->
				</div>
				<div class="tr_rechcho am-form-group">
					<span>充值方式：</span>
					<label class="am-radio">
							<input type="radio" name="radio1" value="1" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="/ShareBikeLease/image/wechatpay.png">
						</label>
					<label class="am-radio" style="margin-right:30px;">
							<input type="radio" name="radio1" value="2" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="/ShareBikeLease/image/zfbpay.png">
						</label>
						<div id="notEmptyWay" class="am-alert am-alert-danger" style="display:none">请选择一种充值方式</div>
				</div>
				<div class="tr_rechnum">
					<span>应付金额：</span>
					<p class="rechnum" id="money">0.00元</p>
				</div>
			</div>
			<div class="tr_paybox">
				<input id="rechargeBtn" type="button" value="确认支付" class="tr_pay am-btn" onclick="recharge()"/>
				<span>温馨提示：请理性消费。</span>
			</div>
		</form>
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
