<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>订单</title>
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
 		<script src="/ShareBikeLease/js/lease.js" charset="utf-8"></script>
		<script type="text/javascript">	
		$(document).ready(function(){
			pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page3");
			$('#foot_page_div').html(pageStr);
		});
		
		layui.use('layer', function(){ //独立版的layer无需执行这一句
			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
			  //触发事件
			  var active = {
					  
				  notice: function(){
					  	var l_uuid = $("#l_uuid").val();
					 	var u_uuid = $("#u_uuid").val();
						var b_uuid = $("#b_uuid").val();
						var siteSelect = $("siteSelect").val();
						var s_uuid = siteSelect.split(",")[0];
						var returnMap = {
								 "s_uuid":s_uuid,
								 "b_uuid":b_uuid,
								 "l_uuid":l_uuid,
								 "u_uuid":u_uuid
						 };
						layer.open({
						    time: 0 //不自动关闭
						    ,title: '提示'
						    ,area: '300px;'
						    ,shade: [0.8, '#393D49']
						    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">确定归还？</div>'
						    ,btn: ['确定', '取消']
						    ,yes: function(index){
						        $.ajax({
						        	 timeout: 3000,
						 	        async: false,
						 	        type: "POST",
						 	        url: getContextPath()+'/lease/return',
						 	        dataType: "json",
						 	        contentType: "application/json; charset=utf-8",
						 	        data:JSON.stringify(returnMap),
						            success:function(data){
						            	if(data["result"] == "50001" ){
						            		layer.open({
						            			title: '提示'
						            			,area: '300px;'
						            			,id: 'LAY_layuipro'
						    					,btn: ['确定', '取消']
						            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">金额不足，支付失败，请前往充值</div>'
						            			,success: function(layero){
						            				 var btn = layero.find('.layui-layer-btn');
						            				 btn.find('.layui-layer-btn0').attr({
						 					        	href : getContextPath()+'/user/order'
						            				 });
						            				}
						            			});
						            	}else{
							            		layer.open({
							            			title: '提示'
							            			,area: '300px;'
							            			,id: 'LAY_layuipro'
							    					,btn: ['确定', '取消']
							            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">归还成功</div>'
							            			,success: function(layero){
							            				 var btn = layero.find('.layui-layer-btn');
							            				 btn.find('.layui-layer-btn0').attr({
							 					        	href : getContextPath()+'/user/order'
							            				 });
							            				}
							            			});
						            	}
						            	
						           			 }
						       			  });
						   				 }
									});
				    			},
			  
			 	   		}
			  $('#returnBtn').on('click', function(){
				    var othis = $(this), method = othis.data('method');
				    active[method] ? active[method].call(this, othis) : '';
				  });
				  
			});
		 
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
  <!--百度地图容器-->
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
			  		   		<jsp:param value="order" name="action" />
			  		   	</jsp:include>
			  		</div>
  					  <div class="col-md-10 l-b">
				  		<table class="table table-striped table-bordered table-hover">
				  			<thead>
								<tr>
									<th>单车编号</th>
									<th>租赁时间</th>
									<th>归还时间</th>
									<th>租赁站点</th>
									<th>归还站点</th>
									<th>金额</th>
									<th>是否归还</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody style="text-align:center">
							<c:forEach items="${item.listObject}" var="lease" >
				  				<tr>
				  					<td>${lease.bike.b_id}</td>
				  					<td>${lease.l_leaseTime}</td>
				  					<td>
				  						<c:if test="${lease.l_returnTime != null}">
				  							${ lease.l_returnTime}
				  						</c:if>
				  						<c:if test="${lease.l_returnTime == null}">
				  							--
				  						</c:if>
			  						</td>
			  						<td>${lease.l_leaseSite.s_name}</td>
				  					<td>
				  						<c:if test="${lease.l_returnSite.s_uuid == 1}">
				  							--
				  						</c:if>
				  						<c:if test="${lease.l_returnSite.s_uuid != 1}">
				  							${lease.l_returnSite.s_name}
				  						</c:if>
			  						</td>
				  					<td>
				  						<c:if test="${lease.l_status == 0}">
				  							--
				  						</c:if>
				  						<c:if test="${lease.l_status == 1}">
				  							${lease.l_money}
				  						</c:if>
				  					</td>
				  					<td>
				  						<c:if test="${lease.l_status == 0}">
				  							未归还
				  						</c:if>
				  						<c:if test="${lease.l_status == 1}">
				  							已归还
				  						</c:if>
				  					</td>
				  					<td>
										<c:choose>
											<c:when test="${lease.l_status == '0' }">
											<a href="#return"  class="btn btn-sm btn-success "  style="background: blue;border-color:blue "
												onclick="returnBike_getSite('${lease.l_uuid}','${lease.bike.b_uuid}','${User.u_uuid}')"
												title="归还" data-toggle="modal">
													<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
														归还
											</a>
											</c:when>
											<c:otherwise>--</c:otherwise>
										</c:choose>
									</td>
				  				</tr>
				  			</c:forEach>
				  			</tbody>
				  		 </table>
				  		 
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
		
		
		<!-- 还车 -->
					<div id="return" class="modal fade" data-backdrop="static">
						<div class="modal-dialog">
							<!-- Modal content-->
							<form class="form-inline" action="" name="returnForm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">还车</h4>
									</div>
									
									<div style="text-align: center;">
										<div class="modal-body">
										
										<input type="hidden" id="l_uuid" value="" />
										<input type="hidden" id="b_uuid" value="" />
										<input type="hidden" id="u_uuid" value="" />
                                            
											<label class="label_one">站点:</label>
												<SELECT id="siteSelect" name="siteSelect" style="display:inline;width:30%" class="form-control">
													<option value="0">请选择</option>
												</SELECT>
												<label id="siteError" class="label_one" style="display: none;color:red;"><spring:message code="invalid_email_tips" text="该站点已无空余位子可供停车"/></label>
												<label id="siteNotEmpty" class="label_one" style="display: none;color:red;"><spring:message code="invalid_email_tips" text="请选择站点"/></label>

										</div>
									</div>
									<div class="modal-footer ">
<!-- 										<button type="button" class="btn btn-default" -->
<!-- 											data-dismiss="modal">close</button> -->
<%-- 											<button id="returnBtn" value="${bike.b_uuid }" data-method="notice" class="btn btn-sm btn-success "   --%>
<!-- 													style="background: blue;border-color:blue "> -->
<!-- 													<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> -->
<!-- 														确定归还 -->
<!-- 												</button> -->
<%-- 										<button id="returnBtn" value="${bike.b_uuid }" data-method="notice"  --%>
<!-- 										class="btn btn-sm btn-success "  style="background: blue;border-color:blue "></button> -->
										<input type="button" onclick="returnBike()"   class="form-control" value="确定归还" id="returnBtn" >
									</div>
								</div>
							</form>
						</div>
					</div>
  
</body>

</html>
