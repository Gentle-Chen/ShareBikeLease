<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<script type="text/javascript" src="/ShareBikeLease/js/user.js"></script>
		<title>用户中心</title>
	</head>
	
	<body>
		
	<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true">
	 <jsp:param value="userInfo" name="action"/>
	</jsp:include>
	<div class="row cnaac-bg">
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content">
			  <div  class="tab-pane active" id="tab-one">
			  	
			  	<div class="row">
			  		<div class="col-md-2">
			  		   <div class="panel-group not-radius cnaac-fold" id="accordion2">
			                <div class="panel panel-default">
			                    <div id="collapseOne" class="panel-collapse in">
			                        <div class="panel-body">
			                            <ul class="nav nav-pills nav-stacked">
			                                <li class="active"><a href="${ctx}/user/info/${User.u_uuid}">我的资料</a></li>
			                                <li><a href="${ctx}/user/toUpdatePassword">修改密码</a></li> 
			                            </ul>
			                        </div>
			                    </div>
			                </div>
					    </div>
			  		</div>
			  		
			  		<div class="col-md-10 l-b">
			  			<div class="row space-p-tb">
			  				<div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
			  					<form class="form-horizontal" id="updateInfoForm" action="${ctx}/user/update" method="post">
			  					
								  <div class="form-group">								    
								     <label class="col-sm-2 control-label"><spring:message code="register_page_email_account" text="邮箱账号"/>:</label>
						             <div class="col-sm-10">
						            	<input type="text" class="form-control" readonly="readonly" disabled="disabled" value="${User.u_email}"/>
						            </div>			    
								  </div>
								  <div class="form-group">								    
								     <label class="col-sm-2 control-label"><spring:message code="register_page_email_account" text="姓名"/>:</label>
						             <div class="col-sm-10">
						            	<input type="text" class="form-control" readonly="readonly" disabled="disabled" value="${User.u_name}"/>
						            </div>			    
								  </div>
								  <div class="form-group">
								        <label class="col-sm-2 control-label"><spring:message code="register_page_name" text="性别"/>:</label>
							            <div class="col-sm-10">
							            	<input type="text" class="form-control" name="sex" id="userName" value="${User.u_sex}" readonly="readonly" disabled="disabled" />
							            </div>
								  </div>
								  <div class="form-group">
								        <label class="col-sm-2 control-label"><spring:message code="register_page_location" text="身份证号" /></label>
							            <div class="col-sm-10">
								            <c:set value="${User.u_identityCard}" var="u_identityCard"></c:set>
								            <c:set value="${fn:substring(u_identityCard,6,14)}" var ="replace_identityCard"></c:set>
								            <c:set value="${fn:replace(u_identityCard,replace_identityCard,'********') }" var="identityCard" />
							            	<input type="text" class="form-control" name="identityCard" value="${identityCard}" readonly="readonly" disabled="disabled" />
							            </div>
								  </div>
								  <div class="form-group">
								        <label class="col-sm-2 control-label"><spring:message code="register_page_location" text="电话号码" /></label>
							            <div class="col-sm-10">
							            	<input type="text" class="form-control" id="phone" name="phone" value="${User.u_phone }" readonly="readonly" disabled="disabled" />
	            							<p class="mark" style="display: none;" id="mobilePhoneErrorTips"><spring:message code="mobilePhone_validation_tips" text="请输入有效的电话"/></p>
							            </div>
								  </div>
								  <div class="form-group">
								        <label class="col-sm-2 control-label"><spring:message code="register_page_location" text="地址" /></label>
							            <div class="col-sm-10">
							            	<input type="text" class="form-control" id="address" name="address" value="${User.u_address }" readonly="readonly" disabled="disabled" />
							            	<p class="mark" style="display: none;" id="addressErrorTips"><spring:message code="address_blank_tips" text="地址不能为空"/></p>
							            </div>
								  </div>
								  <div class="form-group">
								        <label class="col-sm-2 control-label"><spring:message code="register_page_location" text="余额" /></label>
							            <div class="col-sm-10">
							            	<input type="text" class="form-control" name="balance" value="${User.u_balance } 元" readonly="readonly" disabled="disabled" />
							            </div>
								  </div>
								  <input type="hidden" id="u_uuid" name="u_uuid" value="${User.u_uuid }" />
								  <button id="updateSubmitBtn" onclick="onsubmit()"  data-method="notice_fix" class="btn btn-sm btn-success" style="float:right;display:none" >
                                               	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                	提交
                                </button>
								</form>
								<button id="updateBtn" onclick="updateUser()" value="" data-method="notice_fix" class="btn btn-sm btn-success" style="float:right" >
                                               	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                	修改
                                </button>
			  				</div>
			  			</div>
			  		</div>			  		
			  	</div>			  	
			  </div>
		</div>
	</div>
	
	</div>
	
<%--     <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true" /> --%>
<div class="bottom" style="width:100%;background-color:#053391;min-width:1260px;float:left;margin-top: -100px">
  <div class="footer" style="color:#fff;margin:0px;height:95px;width:1260px;text-align:center;line-height:95px" >
    <p>Copyright © 2018 HaFu. All Rights Reserved 津ICP备666666号-6</p>	
</div>
</div>
</body>
</html>