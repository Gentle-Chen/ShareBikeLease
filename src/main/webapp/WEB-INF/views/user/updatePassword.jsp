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
			                                <li ><a href="${ctx}/user/info/${User.u_uuid}">我的资料</a></li>
			                                <li class="active"><a href="${ctx}/user/toUpdatePassword">修改密码</a></li> 
			                            </ul>
			                        </div>
			                    </div>
			                </div>
					    </div>
			  		</div>
			  		
			  		<div class="col-md-10 l-b">
			  			<div class="row space-p-tb">
			  				<div class="col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
			  					<form class="form-horizontal" id="updatePwdForm" action="${ctx}/user/updatePassword" method="post">
			  					
								  <div class="form-group">								    
								     <label class="col-sm-2 control-label"><spring:message code="register_page_email_account" text="原始密码"/>:</label>
						             <div class="col-sm-10">
						            	<input id="u_password" name="u_password" type="password" class="form-control"  value=""/>
						            	<p class="mark" id="oldPasswordErrorTips" style="color: #b4b4b4"><spring:message code="password_validation_tips" text="旧密码错误"/></p>
						            </div>			    
								  </div>
								  <div class="form-group">								    
								     <label class="col-sm-2 control-label"><spring:message code="register_page_email_account" text="新密码"/>:</label>
						             <div class="col-sm-10">
						            	<input id="newPassword" name="newPassword" type="password" class="form-control"  value=""/>
						            	<p class="mark" id="passwordErrorTips" style="color: #b4b4b4"><spring:message code="password_validation_tips" text="密码长度6-20位的数字或字母,至少包含1位数字"/></p>
						            </div>			    
								  </div>
								  <div class="form-group">
								        <label class="col-sm-2 control-label"><spring:message code="register_page_name" text="确认密码"/>:</label>
							            <div class="col-sm-10">
							            	<input id="confirmPassword" name="confirmPassword" type="password" class="form-control"  value=""  />
							            	<p class="mark" style="display: none;" id="confirmPasswordErrorTips"><spring:message code="confirm_password_blank_tips" text="确认密码不能为空"/></p>
	            							<p class="mark" style="display: none;" id="confirmPasswordDifferenceTips"><spring:message code="confirm_password_not_same_tips" text="两次输入的密码不一致"/></p>
							            </div>
								  </div>
								  <input type="hidden" id="u_uuid" name="u_uuid" value="${User.u_uuid }" />
								  <button type="button" id="passwordBtn" onclick="checkUpdatePassword()"  data-method="notice_fix" class="btn btn-sm btn-success" style="float:right;" >
                                               	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                	提交
                                </button>
								</form>
			  				</div>
			  			</div>
			  		</div>			  		
			  	</div>	
			  </div>
		</div>
		
	</div>
  </div>
	<div class="bottom" style="width:100%;background-color:#053391;min-width:1260px;float:left;margin-top: -100px">
  <div class="footer" style="color:#fff;margin:0px;height:95px;width:1260px;text-align:center;line-height:95px" >
    <p>Copyright © 2018 HaFu. All Rights Reserved 津ICP备666666号-6</p>	
</div>
</div>
</body>
</html>