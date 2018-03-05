<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>用户中心</title>
<!-- 		<script type="text/javascript" src="/ShareBikeLease/js/quote/jquery-3.2.1.min.js"></script> -->
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/zzsc.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/webuploader.css">		
		<link rel="stylesheet" href="/ShareBikeLease/css/pikaday.css">	
		<link rel="stylesheet" href="/ShareBikeLease/js/quote/layui/css/layui.css"  media="all">
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/moment.js"></script>   
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/jw.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/pikaday.js"></script>
	    <script src="/ShareBikeLease/js/quote/common.js"></script>
	    <script src="/ShareBikeLease/js/quote/layui/layui.js" charset="utf-8"></script>
	    <script src="/ShareBikeLease/js/site.js" charset="utf-8"></script>
		<script type="text/javascript">	
		$(document).ready(function(){
			pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page");
			$('#foot_page_div').html(pageStr);
		});
		
		 layui.use('layer', function(){ //独立版的layer无需执行这一句
		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		  //触发事件
		  var active = {
				  notice_delete: function(){
				  var s_uuid = $('#deleteSiteBtn').val();
					layer.open({
					    time: 0 //不自动关闭
					    ,title: '提示'
					    ,area: '300px;'
					    ,shade: [0.8, '#393D49']
					    ,content	: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">确定删除？</div>'
					    ,btn: ['确定', '取消']
					    ,yes: function(index){
// 					        $.ajax({
// 					            url:getContextPath()+'/bike/delete/'+b_uuid,
// 					            data:b_uuid,
// 					            type:"Post",
// 					            dataType:"json",
// 					            success:function(data){
// 					            	if ( data["result"] == "success" ){
					            		layer.open({
					            			title: '提示'
					            			,area: '300px;'
					            			,id: 'LAY_layuipro'
					    					,btn: ['确定', '取消']
					            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">删除成功</div>'
					            			,success: function(layero){
					            				 var btn = layero.find('.layui-layer-btn');
					            				 btn.find('.layui-layer-btn0').attr({
					 					        	href : getContextPath()+'/site/get'
					            				 });
					            				}
					            			});
// 					           			 }
// 					           			}
// 					       			  });
					   				 }
								});
			    			},
		 	   		}
			  $('#deleteSiteBtn').on('click', function(){
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
		
	<jsp:include page="/WEB-INF/views/common/adminHead.jsp" flush="true" >
		<jsp:param value="userCenter" name="action"/>
	</jsp:include>

	 <div class="row cnaac-bg">
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="tab-one">
			  	<div class="row">
			  		<div class="col-md-2">
			  		   <jsp:include page="/WEB-INF/views/admin/leftMenu.jsp" flush="true" >
			  		   	<jsp:param value="siteManage" name="action"/>
			  		   	</jsp:include>
			  		</div>
			  		<div class="col-md-10 l-b">
				  		<table class="table table-striped table-bordered table-hover">
				  			<thead>
								<tr>
									<th>站点名字</th>
									<th>经纬度(纬度，经度)</th>
									<th>容量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody style="text-align:center">
							<c:forEach items="${item.listObject}" var="site" >
				  				<tr>
				  					<td>${site.s_name}</td>
				  					<td>
										(${site.s_longitude} , ${site.s_latitude })<br>
										<form id="deleteBtn" action="${ctx}/map/showSiteMap" method="post">
											<input type="hidden" value="${site.s_uuid}" name="s_uuid" id="s_uuid">
											<button  onclick="onsubmit()">地图显示</button>
										</form>
									</td>
									<td>${site.s_capacity }</td>
									<td>
										<c:choose>
											<c:when test="${site.s_capacity == '10' }">
												<button  id="deleteSiteBtn" value="${site.s_uuid }" data-method="notice_delete" class="btn btn-sm btn-success "  style="background: #ef460f;border-color:#ef460f ">
													<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
													删除
												</button>
											</c:when>	
											<c:otherwise>	
												<button type="button" class="collapsed btn btn-success btn-sm"  data-toggle="modal" 
												  onclick="detail('${site.s_uuid}','${site.s_name }')" id="${site.s_uuid}" data-target=".edit-app-modal" aria-expanded="false">
	                                               	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
	                                                	详情
	                                             </button>
											</c:otherwise>
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
       
       <div class="modal fade edit-app-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                    <h4 class="modal-title" id="mySmallModalLabel"></h4>
	                </div>
	                <div class="modal-body">
	                <table id="detailTable" class="table table-striped table-bordered table-hover">
				  			<thead>
								<tr>
									<th>单车编号</th>
									<th>状态</th>
								</tr>
							</thead>
						  </table>
	                </div>
	                <div class="modal-footer" align="center">
	                    <button type="button" style="margin:0 auto;" class="btn btn-default waves-effect waves-light btn-sm" data-dismiss="modal">关闭</button>
	                </div>
	            </div><!-- /.modal-content -->
	        </div><!-- /.modal-dialog -->
	    </div><!-- /.modal -->
       
	</body>
</html>
