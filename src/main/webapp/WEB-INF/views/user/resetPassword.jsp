<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>共享单车租赁系统</title>
<%-- <%@ include file="/WEB-INF/views/common/meta.jsp" %> --%>
<script type="text/javascript" src="../js/quote/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../js/quote/webuploader.nolog.min.js"></script>
<script type="text/javascript" src="../js/quote/fm.selectator.jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/user.js"></script>
<link rel="stylesheet" type="text/css" href="../css/webuploader.css" />
<link rel="stylesheet" type="text/css" href="../css/fm.selectator.jquery.css" />
<link rel="stylesheet" type="text/css"  href="../css/style.css"  />
<style type="text/css">
.webuploader-pick{
	width:100px;
	height:40px;
	padding: 0 !important;
	background-color: #009418 !important;
}
.webuploader-pick-hover{
	background-color:#63c76e !important;
}
</style>
</head>
<body class="mybody">
<div class="background" style=" height:800px;">
  <div class="head" style="height:120px"><a href="#"><img style="border: 0;height:120px;width:550px" src="${ctx}/image/logo2.png" 
  															align="left"/></a>
    <h3><spring:message code="register_page_baner_title" text="重置密码"/></h3>
  </div>
  <div class="logindiv" ><span class="tabname"><spring:message code="register_page_user_register" text="重置密码"/></span>
    <div class="container" style="top: 59px;margin-bottom: 80px;">
      <div class="left" style="width:835px;" >
      <form action="resetPassword" method="post" id="resetPassword">
	        <ul class="registerul">
	          <h4><spring:message code="account_info" text="信息验证"/></h4>
	          <input type="hidden" id="emailByte" name="emailByte" value="${param.email}"/>
	          <li>
	            <label><spring:message code="password" text="密码"/>:</label>
	            <span>
		            <input type="password" class="text-style1" name="newPassword" id="newPassword"/>
		            <font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
		            <p class="mark" id="passwordErrorTips" style="color: #b4b4b4"><spring:message code="password_validation_tips" text="密码长度6-20位的数字或字母,至少包含1位数字"/></p>
	            </span>
	          </li>
	          <li>
	            <label><spring:message code="confirm_password" text="确认密码"/>:</label>
	            <span>
	            	<input type="password" class="text-style1" name="confirmPassword" id="confirmPassword"/>
	            	<font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
	            	<p class="mark" style="display: none;" id="confirmPasswordErrorTips"><spring:message code="confirm_password_blank_tips" text="确认密码不能为空"/></p>
	            	<p class="mark" style="display: none;" id="confirmPasswordDifferenceTips"><spring:message code="confirm_password_not_same_tips" text="两次输入的密码不一致"/></p>
	            </span>
	          </li>
	        </ul>
	        <div style="float:left; padding-left:170px;" >
	        	<span>
	        	<br><br><br>
		          <input style="margin-left:0;" class="login-btn" type="button" id="subBtn" onclick="resetPassword();" value="<spring:message code="register_page_register_button" text="提交"/>"/>
		          <a class="forgot-pwd" href="${ctx}/toLogin"><spring:message code="cancel_button" text="取消"/></a>
	          	</span>
	        </div>
          </form>	
      </div>
      <div class="right" style="margin-top:70px; height:100px;width:400px; border-left:#ccc solid 1px;">
        <h2><spring:message code="register_page_have_acccount" text="已有帐号?"/><a class="signin" href="${ctx}/toLogin"><spring:message code="register_page_login_immediately" text="立即登录"/></a></h2>
      </div>
    </div>
  </div>
</div>
	<div class="bottom">
  <div class="footer" style="color:#fff;" >
    <p>Copyright © 2018 HaFu. All Rights Reserved 津ICP备666666号-6</p>
  </div>
</body>
</html>