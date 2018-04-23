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
 		<script src="/ShareBikeLease/js/location.js" charset="utf-8"></script>
		<script type="text/javascript">	
		$(document).ready(function(){
			pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page2");
			$('#foot_page_div').html(pageStr);
			
		});
		layui.use('layer', function(){ //独立版的layer无需执行这一句
			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		});
			  
// 				  $('#leaseBtn').on('click', function(){
// 					    var othis = $(this), method = othis.data('method');
// 					    active[method] ? active[method].call(this, othis) : '';
// 					  });
				  
			
		 
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
			  		   		<jsp:param value="location" name="action" />
			  		   	</jsp:include>
			  		</div>
<!-- 			  		位置选择：<select id="b_status" name="b_status" class="col-sm-2" style="height:35px;width:100px"> -->
<%-- 	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option> --%>
<%-- 	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option> --%>
<%-- 	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option> --%>
<!--                      	 </select> -->
  					  <div class="col-md-10 l-b">
  					  <div style="width: 100%;height:50%;padding: 10px;background: #27b0d6;color: #fff;">
  					  当前位置为:${province}/${city}/香洲区/北京理工大学珠海学院/${location}
  					  <button class="btn btn-sm btn-success "><a href="${ctx}/map/showMap/${nsite}">地图详情</a></button><br><br>
  					  周围有${numberSite}个单车站点
  					  </div><br>
			  			<form class="form-horizontal" method="post" action="${ctx}/user/location" id="locationForm">
			  			<input type="hidden" value="${nsite}" id="site1" name="site1">
	  						<div class="form-group">
	                          <label class="col-sm-2 control-label" style="width:100px;">站点选择：</label>
	                          	 <select id="b_status" name="b_status" class="col-sm-2" style="height:35px;width:100px">
	                          	 <option value="" <c:if test="${site==''}">selected</c:if>>请选择</option>
	                          	 <c:forEach items="${valueObject}" var="valueObject">
		                          	 <c:set value="${fn:split(valueObject, '/')[0] }" var="value"></c:set>
		                          	 <c:set value="${fn:split(valueObject, '/')[1] }" var="name"></c:set>
	                          	 
	                          	 <option value="${value }" <c:if test="${site==value}">selected</c:if>>${name }</option>
	                          	 
	                          	 </c:forEach>
<%-- 	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option> --%>
<%-- 	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option> --%>
<%-- 	                          	 	<option value="3" <c:if test="${site=='3'}">selected</c:if>>求是楼</option> --%>
<%-- 	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option> --%>
	                          	 </select>
							<label class="col-sm-2 control-label" style="width:100px;"></label>
							  <div class="col-sm-2 text-center">
	                       		<button type="button" class="btn btn-success" onclick="submit()">提交</button>
							   </div>
	                       </div>
						</form>
				  		<table class="table table-striped table-bordered table-hover">
				  			<thead>
								<tr>
									<th>单车编号</th>
									<th>单车状态</th>
									<th>停靠站点</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody style="text-align:center">
							<c:forEach items="${item.listObject}" var="bike" >
				  				<tr>
				  					<td>${bike.b_id}</td>
				  					<td>
										<c:if test="${bike.b_status == '0' }">空闲
										</c:if>
										<c:if test="${bike.b_status == '1' }">使用中
										</c:if>
										<c:if test="${bike.b_status == '2' }">损坏
										</c:if>
										<c:if test="${bike.b_status == '3' }">修理中
										</c:if>
										<c:if test="${bike.b_status == '4' }">闲置
										</c:if>
										<c:if test="${bike.b_status == '5' }">报废
										</c:if>
									</td>
									<td>
										<c:choose>
											<c:when test="${bike.site.getS_uuid() == '1' }">--
											</c:when>
											<c:otherwise>
												${bike.site.getS_name()}
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${bike.b_status == '0' }">
												<button id="leaseBtn" value="${bike.b_uuid }" data-method="notice" 
												class="btn btn-sm btn-success "  style="background: blue;border-color:blue "
												onclick="locat()">
													<span class="glyphicon glyphicon-edit"></span>
														租赁
												</button>
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

  
</body>

</html>