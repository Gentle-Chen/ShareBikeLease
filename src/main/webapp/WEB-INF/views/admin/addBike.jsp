<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>用户中心</title>
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/zzsc.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/webuploader.css">		
		<link rel="stylesheet" href="/ShareBikeLease/css/pikaday.css">	
		<link rel="stylesheet" href="/ShareBikeLease/js/quote/layui/css/layui.css"  media="all">
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/moment.js"></script>   
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/jw.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/pikaday.js"></script>
	    <script src="/ShareBikeLease/js/quote/common.js"></script>
	    <script src="/ShareBikeLease/js/quote/layui/layui.js" charset="utf-8"></script>
	    <script src="/ShareBikeLease/js/bike.js" charset="utf-8"></script>
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
			  		   	<jsp:param value="addBike" name="action"/>
			  		   	</jsp:include>
			  		</div>
			  		<div class="col-md-10 l-b">
			  			<form id="addBikeForm" method="post" action="${ctx}/bike/addBike">
						  <div class="form-group">
						    <label>单车编号
						    	<span id="bikeExits" class="mark" style="display: none;color:red"><spring:message code="bikeExits" text="(该编号已存在)"/></span>
							    <span id="notEmptyBikeId" class="mark" style="display: none;color:red"><spring:message code="notEmptyBikeId" text="(请输入单车编号)"/></span>
						    </label>
						    <input type="text" class="form-control" name="b_id" id="addBikeId" placeholder="单车编号" value="" maxlength="50" required="required">
						  </div>
						  <div class="form-group">
						    <label>状态</label>
						     <select id="b_status" name="b_status" class="form-control" required="required"  >
	                          	 	<option value="0" selected="selected" >空闲</option>
                          	 </select>
						  </div>
						  <div class="form-group">
						    <label>站点
							    <span id="notEmptyLoaction" class="mark" style="display: none;color:red"><spring:message code="notEmptyLoaction" text="(该站点没有位置可以停放单车)"/></span>
							    <span id="notEmptySite" class="mark" style="display: none;color:red"><spring:message code="notEmptySite" text="(请选择站点)"/></span>
						    </label>
						    <select id="addBikeSite" name="s_uuid" class="form-control" required="required">
	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option>
	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option>
	                          	 	<option value="3" <c:if test="${site=='3'}">selected</c:if>>求是楼</option>
	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option>
                          	 </select>
						  </div>
						  <div class="modal-footer">
		                    <button type="button" class="btn btn-success waves-effect btn-sm" id="addBtn" >保存</button>
		                </div>
						</form>
			  		</div>
  				</div>
			  </div>
		     </div>
	       </div>
       </div>
       
       
	</body>
</html>
