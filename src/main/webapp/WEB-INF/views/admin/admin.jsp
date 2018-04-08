<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>用户中心</title>
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
		<script type="text/javascript">	
		$(document).ready(function(){
			pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page");
			$('#foot_page_div').html(pageStr);
			var div = document.getElementById('bikeImage');
			var img = document.createElement("img");
			img.src = getContextPath() + "/bike/countBike";
			div.appendChild(img);
			
		});
		
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  var laydate1 = layui.laydate;
			  //常规用法
			  laydate.render({
			    elem: '#startTime',
	  		});
			  laydate1.render({
				    elem: '#endTime'
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
	<body style="overflow-x: auto">
		
	<jsp:include page="/WEB-INF/views/common/adminHead.jsp" flush="true" >
		<jsp:param value="userCenter" name="action"/>
	</jsp:include>

	 <div class="row cnaac-bg" >
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content" >
			  <div role="tabpanel" class="tab-pane active" id="tab-one" >
			  	<div class="row" ">
			  		<div class="col-md-2" style="">
			  		   <jsp:include page="/WEB-INF/views/admin/leftMenu.jsp" flush="true" >
			  		   	<jsp:param value="bikeTotal" name="action"/>
			  		   	</jsp:include>
			  		</div>
			  		<div class="col-md-10 l-b" >
			  			<form class="form-horizontal" method="post" action="${ctx}/bike/get" id="myform">
	  						<div class="form-group">
	                          <label class="col-sm-2 control-label" style="width:100px;">单车状态：</label>
<!--  	                          <div class="col-sm-4"> -->
	                          	 <select id="b_status" name="b_status" class="col-sm-2" style="height:35px;width:100px">
	                          	 	<option value="" <c:if test="${b_status==''}">selected</c:if>>请选择</option>
	                          	 	<option value="1" <c:if test="${b_status=='1'}">selected</c:if>>使用中</option>
	                          	 	<option value="0" <c:if test="${b_status=='0'}">selected</c:if>>空闲</option>
	                          	 </select>
<!-- 	                          </div> -->
							<label class="col-sm-2 control-label" style="width:100px;"></label>
							<div class="col-sm-4"> 
	                          <div id="timeDiv"  style="display:none;">
	                          	 	 <label class="col-sm-2 control-label" style="width:90px;">时间：</label>
		                             <input type="text" class="layui-input" style="height:35px;width:93px;display: inline;" value="${start}" id="startTime" name="startTime" placeholder="yyyy-MM-dd">--
		                             <input type="text" class="layui-input" style="height:35px;width:93px;display: inline;" value="${end}" id="endTime"  name="endTime" placeholder="yyyy-MM-dd">
							 </div> 
								 <div id="siteDiv" style="display:none">
	                          	 	 <label class="col-sm-2 control-label" style="width:100px;">站点：</label>
	                          	 	 <select id="site" name="site" class="col-sm-2" style="height:35px;width:100px">
	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option>
	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option>
	                          	 	<option value="3" <c:if test="${site=='3'}">selected</c:if>>求是楼</option>
	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option>
	                          	 </select>
							</div>      
							</div>   
							  <div class="col-sm-2 text-center">
	                       		<button type="button" class="btn btn-success" onclick="submit()">搜索</button>
							   </div>
	                       </div>
						</form>
				  		<table class="table table-striped table-bordered table-hover">
				  			<thead>
								<tr>
									<th>单车编号</th>
									<th>单车状态</th>
									<th>停靠站点</th>
								</tr>
							</thead>
							<tbody>
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
										<c:if test="${bike.b_status == '4' }">报废
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
				  				</tr>
				  			</c:forEach>
				  			</tbody>
				  		 </table>
				  		 
	                    <div class="row">
	                        <nav class="right-block">
							  	<ul class="pagination" id="foot_page_div"></ul>
							</nav>
						</div>
						<div id="bikeImage" class="col-md-10 l-b">
			  		</div>
			  		</div>
  				</div>
			  </div>
		     </div>
	       </div>
       </div>
	</body>
</html>
