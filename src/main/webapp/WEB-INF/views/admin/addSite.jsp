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
	    <script src="/ShareBikeLease/js/site.js" charset="utf-8"></script>
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
			  		   	<jsp:param value="addSite" name="action"/>
			  		   	</jsp:include>
			  		</div>
			  		<div class="col-md-10 l-b">
			  			<form id="addSiteForm" method="post" action="${ctx}/site/addSite">
						  <div class="form-group">
						    <label>站点名字
						    	<span id="illegalName" class="mark" style="display: none;color:red"><spring:message code="illegalName" text="不合法的名字"/></span>
						    </label>
						    <input type="text" class="form-control" name="s_name" id="s_name" placeholder="站点名字" value="" maxlength="50" required="required">
						  </div>
						  <div class="form-group">
						    <label>
						    	经度
						    	<span id="illegalLon" class="mark" style="display: none;color:red"><spring:message code="illegalLon" text="不合法"/></span>
						    </label>
						     <input type="text" class="form-control" name="s_longitude" id="s_longitude" placeholder="经度" value="" maxlength="50" required="required">
						  </div>
						  <div class="form-group">
						    <label>
						    	纬度
						    	<span id="illegalLan" class="mark" style="display: none;color:red"><spring:message code="illegalLan" text="不合法"/></span>
						    </label>
						     <input type="text" class="form-control" name="s_latitude" id="s_latitude" placeholder="纬度" value="" maxlength="50" required="required">
						  </div>
						  <div class="form-group">
						    <label>容量
						    </label>
						    <input type="text" class="form-control" name="s_capacity" id="s_capacity" placeholder="容量" value="10" maxlength="50" required="required" disabled="disabled">
						  </div>
						  <div class="modal-footer">
		                    <button type="button" class="btn btn-success waves-effect btn-sm" id="addBtn" onclick="addSite()">保存</button>
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
