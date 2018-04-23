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
 		<script type="text/javascript">
 		$(document).ready(function(){
 			$('#site').blur(function(){
 				var site = $('#site').val();
 				if(site == '' ){
 					$('#').show();
 					$("#locatedBtn").css("disabled","disabled");
 				}else{
 					$('#').hide();
 					$("#locatedBtn").css("disabled","false");
 				}
 			});
		});
 		
 		function checkNull(){
 			var site = $('#site').val();
				if(site == '' ){
					$('#errorDiv').show();
					$("#locatedBtn").css("disabled","disabled");
				}else{
					$('#errorDiv').hide();
					$("#locatedBtn").css("disabled","false");
					document.getElementById("locationForm").submit();
				}
 		}
 			
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
  					  <div class="col-md-10 l-b">
			  			<form class="form-horizontal" method="post" action="${ctx}/user/location" id="locationForm">
	  						<div class="form-group">
	                          <label class="col-sm-2 control-label" style="width:100px;">位置选择：</label>
	                          	 <select id="site" name="site" class="col-sm-2" style="height:35px;width:100px">
	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option>
	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option>
	                          	 	<option value="3" <c:if test="${site=='3'}">selected</c:if>>求是楼</option>
	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option>
	                          	 </select>
	                          	 <label id="errorDiv" class="col-sm-2 control-label" style="width:100px;display:none;color:red">eror</label>
							<label class="col-sm-2 control-label" style="width:100px;"></label>
							  <div class="col-sm-2 text-center">
	                       		<button id="locatedBtn" type="button" class="btn btn-success" onclick="checkNull()">提交</button>
							   </div>
	                       </div>
						</form>
				  		 
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