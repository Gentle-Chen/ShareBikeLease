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
<script type="text/javascript" charset="utf-8" src="../js/register.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="js/quote/fm.selectator.jquery.js"></script>    -->
<link rel="stylesheet" type="text/css" href="../css/webuploader.css" />
<link rel="stylesheet" type="text/css" href="../css/fm.selectator.jquery.css" />
<link rel="stylesheet" type="text/css"  href="../css/style.css"  />
<!-- <link rel="stylesheet" type="text/css"  href="../css/v1.1/bootstrap.css"  /> -->
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
    <h3><spring:message code="register_page_baner_title" text="注册中心"/></h3>
  </div>
  <div class="logindiv"><span class="tabname"><spring:message code="register_page_user_register" text="用户注册"/></span>
    <div class="container" style="top: 59px;margin-bottom: 80px;">
      <div class="left" style="width:835px;" >
      <form id="registerForm" action="regist" method="post"  >
	        <ul class="registerul">
	          <h4><spring:message code="account_info" text="账号信息"/></h4>
	          <li>
	            <label><spring:message code="register_page_email_account" text="邮箱账号"/>:</label>
	            <span>
		            <input type="text" class="text-style1" name="u_email" id="u_email"/>
		            <font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
		            <p class="mark" id="invalidEmailTips" style="display: none;"><spring:message code="invalid_email_tips" text="请输入有效的电子邮箱"/></p>
		            <p class="mark" id="emailExistTips" style="display: none;"><spring:message code="already_register_email_tips" text="该邮箱已被注册"/></p>
	            </span>
	          </li>
	          <li>
	            <label><spring:message code="password" text="密码"/>:</label>
	            <span>
		            <input type="password" class="text-style1" name="u_password" id="u_password"/>
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
	          <li id="channelSelLi" >
	            <label>性别:</label>
	            <span>
		            <select class="text-style1" name="u_sex" id="u_sex" style="width: 348px;">
						<option value="">请选择</option>
						<option value="0">男</option>
						<option value="1">女</option>
					</select>
					<p class="mark" style="display: none;" id="sexErrorTips"><spring:message code="sex_blank_tips" text="性别不能为空"/></p>
				</span>
	          </li>
	          
	          <h4><spring:message code="register_page_basic_info" text="基本资料"/><span id="baseInfoTips"><spring:message code="register_page_basic_info_tips" text="请您填写个人基本资料，您将拥有更多的服务使用权限"/></span></h4>
	          <li>
	            <label><spring:message code="register_page_name" text="姓名"/>:</label>
	            <span>
	            	<input type="text" class="text-style1" name="u_name" id="u_name" maxlength="30"/>
	            	<font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
	            	<p class="mark" style="display: none;" id="userNameErrorTips"><spring:message code="user_name_blank_tips" text="姓名不能为空"/></p>
	            </span>
	          </li>
	          <li class="personalInfoLi">
	            <label><spring:message code="register_page_identity_card" text="身份证号"/>:</label>
	            <span>
	            	<input type="text" class="text-style1" name="u_identityCard" id="u_identityCard"/>
	            	<font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
	            	<p class="mark" style="display: none;" id="identityCardErrorTips"><spring:message code="identity_card_validation_tips" text="请输入合法的身份证号"/></p>
	            </span>
	          </li>
	          <div id="previewLicensePic" class="preview" style="display: none;"></div>
	          <%-- <li>
	            <label><spring:message code="register_page_producer" text="出品人信息"/>:</label>
	            <span>
		            <input type="text" class="text-style1" name="producer" id="producer" maxlength="30"/>
		            <font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
		            <p class="mark" style="display: none;" id="producerErrorTips"><spring:message code="producer_blank_tips" text="出品人不能为空"/></p>
	            </span>
	          </li> --%>
	          <h4><spring:message code="register_page_contact" text="联系方式"/><span><spring:message code="register_page_contact_tips" text="请您填写个人联系方式，确保我们能及时与您联系"/></span></h4>
	          <li>
	            <label><spring:message code="register_page_mobilePhone" text="电话"/>:</label>
	            <span>
	            	<input type="text" class="text-style1" name="u_phone" id="u_phone"/>
	            	<font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
	            	<p class="mark" style="color: #aaaaaa;" id="userPhoneFormatTips"><spring:message code="user_phone_format_tips" text="格式如 010-22222222-123 或 13000000000"/></p>
	            	<p class="mark" style="display: none;" id="mobilePhoneErrorTips"><spring:message code="mobilePhone_validation_tips" text="请输入有效的电话"/></p>
	            </span>
	          </li>
	          <li>
	            <label><spring:message code="register_page_address" text="地址"/>:</label>
	            <span>
	            	<input type="text" class="text-style1" name="u_address" id="u_address" maxlength="100"/>
	            	<font style="color:#ff0000;float:left; padding-right: 5px;height: inherit;">*</font>
	            	<p class="mark" style="display: none;" id="addressErrorTips"><spring:message code="address_blank_tips" text="地址不能为空"/></p>
	            </span>
	          </li>
	        </ul>
	        <div style="float:left; padding-left:170px;" >
	        	<span>
	        	<br><br><br>
		          <input style="margin-left:0;" class="login-btn" type="button" id="registerButton" onclick="checkUser();" value="<spring:message code="register_page_register_button" text="注册"/>"/>
		          <a class="forgot-pwd" href="${ctx}/login"><spring:message code="cancel_button" text="取消"/></a>
	          	</span>
	        </div>
          </form>	
      </div>
      <div class="right" style="margin-top:70px; height:950px;width:400px; border-left:#ccc solid 1px;">
        <h2><spring:message code="register_page_have_acccount" text="已有帐号?"/><a class="signin" href="${ctx}/login"><spring:message code="register_page_login_immediately" text="立即登录"/></a></h2>
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