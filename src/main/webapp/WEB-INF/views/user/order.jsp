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
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/zzsc.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/webuploader.css">		
		<link rel="stylesheet" href="/ShareBikeLease/css/pikaday.css">	
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/moment.js"></script>   
	    <script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/pikaday.js"></script>
	    <script src="/ShareBikeLease/js/quote/common.js"></script>
	    <link rel="stylesheet" href="/ShareBikeLease/js/quote/layui/css/layui.css"  media="all">
	    <script src="/ShareBikeLease/js/quote/layui/layui.js" charset="utf-8"></script>
 		<script src="/ShareBikeLease/js/bike.js" charset="utf-8"></script>
		<script type="text/javascript">	
		$(document).ready(function(){
			pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page2");
			$('#foot_page_div').html(pageStr);
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
				  						<c:if test="${lease.l_status} == 1}">
				  							已归还
				  						</c:if>
				  					</td>
				  					<td>
										<c:choose>
											<c:when test="${lease.l_status == '0' }">
											<a href="#return"  class="btn btn-sm btn-success "  style="background: blue;border-color:blue "
												onclick="returnBike_getSite('${lease.l_uuid}','${lease.bike.b_uuid}')"
												title="归还" data-toggle="modal">
													<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
														归还
											</a>
<%-- 												<button id="returnBtn" value="${lease.bike.b_uuid }" data-method="notice" class="btn btn-sm btn-success "  style="background: blue;border-color:blue "> --%>
<!-- 													<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> -->
<!-- 														归还 -->
<!-- 												</button> -->
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
										
										<input type="text" id="l_uuid" value="" />
										<input type="text" id="b_uuid" value="" />
                                            
											<label class="label_one">站点:</label>
												<SELECT id="siteSelect" name="siteSelect" style="display:inline;width:30%" class="form-control">
													<option value="0">请选择</option>
												</SELECT>
												<p id="siteError" class="mark" style="display: none;"><spring:message code="invalid_email_tips" text="该站点已无空余位子可供停车"/></p>
												<p id="siteNotEmpty" class="mark" style="display: none;"><spring:message code="invalid_email_tips" text="请选择站点"/></p>

										</div>
									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">close</button>
										<input type="button"  class="form-control" value="确定归还" id="returnBtn" >
									</div>
								</div>
							</form>
						</div>
					</div>
  
</body>

</html>
