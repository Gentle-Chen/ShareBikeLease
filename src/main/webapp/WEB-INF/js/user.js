
$(document).ready(function() {
//	if(validateInfo()){
//		updateUser();
//	}
	
	validateInfo();
	
//	checkOldPassword();
//	checkPassword();
//	checkConfirmPassword();
//	
//	$("#u_password").blur(checkOldPassword);
//	$("#newPassword").blur(checkPassword);
//	$("#confirmPassword").blur(checkConfirmPassword);
	
	validatePwd();
	
//	if(validatePwd()){
//		$('#updatePwdForm').submit();
//	}
	
});

function updateUser(){
	$('#updateSubmitBtn').css("display","inline");
	$('#phone').removeAttr("readonly");
	$('#phone').removeAttr("disabled");
	$('#address').removeAttr("readonly");
	$('#address').removeAttr("disabled");
	$('#updateBtn').css("display","none");
}

//function submitUpdateUser(){
//	$('#updateSubmitBtn').css("display","none");
//	$('#phone').attr("readonly","readonly");
//	$('#phone').attr("disabled","disabled");
//	$('#address').attr("readonly","readonly");
//	$('#address').attr("disabled","disabled");
//	$('#updateBtn').css("display","inline");
//	$('#updateInfoForm').submit();
//}


function checkPhone(){
	var eReg = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var _eReg = /^1\d{10}$/;
	var epRes = eReg.test($("#phone").val());
	var _epRes = _eReg.test($("#phone").val());
	if(epRes || _epRes){
		$("#mobilePhoneErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}else{
		$("#mobilePhoneErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}
}


function checkAddress(){
	var addr = $.trim($("#address").val());
	if(addr=='' || addr.length > 100){
		$("#addressErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}else{
		$("#addressErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}
}


function validateInfo(){
	var result = false;
	$("#phone").mouseleave(checkPhone);
	$("#address").mouseleave(checkAddress);
	var eles = $("#updateInfoForm").find(".cnaacValidationFails");
	if(eles.length==0){
		result = true;
	}
	return result ;
}


function checkOldPassword(){
	var u_uuid = $('#u_uuid').val();
	var oldPwd = $('#u_password').val();
	 $.ajax({
	        timeout: 3000,
	        async: false,
	        type: "GET",
	        url: getContextPath()+'/user/checkOldPassword/'+u_uuid+'/'+oldPwd,
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        success: function (data) {
	        	if(data["result"] == '30001'){
	        		$("#oldPasswordErrorTips").css("color","#ff5714");
	        		$("#oldPasswordErrorTips").show();
		    		$(this).addClass("cnaacValidationFails");
	        	}else{
	        		$("#oldPasswordErrorTips").hide();
		    		$(this).removeClass("cnaacValidationFails");
	        	}
	        }
	    });
}



function checkPassword(){
	var eReg = /^(?=.*\d)[a-zA-Z\d]{6,20}$/;
	var p = $("#newPassword").val();
	var epRes = eReg.test(p);
	if(epRes){
//		$("#passwordErrorTips").css("color","#b4b4b4");
		$("#passwordErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
		var cp = $("#confirmPassword").val();
		if(cp != ''){
			if(cp==p){
				$("#confirmPasswordDifferenceTips").hide();
				$(this).removeClass("cnaacValidationFails");
			}else{
				$("#confirmPasswordDifferenceTips").css("color","#ff5714");
				$("#confirmPasswordDifferenceTips").show();
				$(this).addClass("cnaacValidationFails");
			}
		}else{
			$("#passwordErrorTips").hide();
			$(this).removeClass("cnaacValidationFails");
		}
	}else{
		$("#passwordErrorTips").css("color","#ff5714");
		$("#passwordErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}
}



function checkConfirmPassword(){
	var cp = $("#confirmPassword").val();
	var p = $("#newPassword").val();
	if(cp==''){
		$("#confirmPasswordDifferenceTips").hide();
		$("#confirmPasswordErrorTips").css("color","#ff5714");
		$("#confirmPasswordErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}else{
		$("#confirmPasswordErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
		if(cp==p){
			$("#confirmPasswordDifferenceTips").hide();
			$(this).removeClass("cnaacValidationFails");
		}else{
			$("#confirmPasswordDifferenceTips").css("color","#ff5714");
			$("#confirmPasswordDifferenceTips").show();
			$(this).addClass("cnaacValidationFails");
		}
	}
}



function validatePwd(){
	
	checkOldPassword();
	checkPassword();
	checkConfirmPassword();
	
	$("#u_password").blur(checkOldPassword);
	$("#newPassword").blur(checkPassword);
	$("#confirmPassword").blur(checkConfirmPassword);
	
	checkEmail();
	$("#email").blur(checkEmail);
	
	$("#newPassword").blur(checkNewPassword);
	$("#confirmPassword").blur(checkConfirmPassword);
	
}

function checkUpdatePassword(){
	var result = false;
	$("#updatePwdForm input[type!=button]").blur();
	var eles = $("#updatePwdForm").find(".cnaacValidationFails");
	if(eles.length==0){
		result = true;
	}
	if(result){
		$('#updatePwdForm').submit();
	}else{
		return;
	}
}

function checkEmail(){
	var email = $('#email').val();
	var eReg = /^[a-zA-Z0-9][a-zA-Z0-9._-]*@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$/;
	var emRes = eReg.test(email);
	if(emRes){
		$("#invalidEmailTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}else{
		$("#invalidEmailTips").css("color","#ff5714");
		$("#invalidEmailTips").show();
		$(this).addClass("cnaacValidationFails");
	}
}

function submitValidate(){
	var result = false;
	$("#showResetPassword input[type!=file]").blur();
	var eles = $("#showResetPassword").find(".cnaacValidationFails");
	if(eles.length==0){
		result = true;
	}
	return result ;
}

function submitValidateForResetPwd(){
	var result = false;
	$("#resetPassword input[type!=file]").blur();
	var eles = $("#resetPassword").find(".cnaacValidationFails");
	if(eles.length==0){
		result = true;
	}
	return result ;
}

function checkResetPassword(){
	if(submitValidate()){
		var email = $('#email').val();
		var identityCard = $('#identityCard').val();
		var map = {
				"email":email,
				"identityCard":identityCard
		};
		var url = getContextPath()+'/user/showResetPassword';
		$.ajax({
	        timeout: 3000,
	        async: false,
	        type: "POST",
	        url: getContextPath()+'/user/showResetPassword',
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data:JSON.stringify(map),
	        success: function (data) {
	        	if(data["result"] == '40001'){
	        		$("#identityCardErrorTips").css("color","#ff5714");
	        		$("#identityCardErrorTips").show();
		    		$(this).addClass("cnaacValidationFails");
	        	}else{
	        		$("#identityCardErrorTips").hide();
		    		$(this).removeClass("cnaacValidationFails");
		    		alert("�ѷ����ʼ�");
	        	}
	        }
	    });
	}
}

function checkNewPassword(){
	var eReg = /^(?=.*\d)[a-zA-Z\d]{6,20}$/;
	var p = $("#newPassword").val();
	var epRes = eReg.test(p);
	if(epRes){
		$("#newPassword").css("color","#b4b4b4");
		$("#newPassword").removeClass("cnaacValidationFails");
		var cp = $("#confirmPassword").val();
		if(cp != ''){
			if(cp==p){
				$("#confirmPasswordDifferenceTips").hide();
				$("#newPassword").removeClass("cnaacValidationFails");
				$("#confirmPassword").removeClass("cnaacValidationFails");
			}else{
				$("#confirmPasswordDifferenceTips").show();
				$("#confirmPassword").addClass("cnaacValidationFails");
			}
		}
	}else{
		$("#passwordErrorTips").css("color","#ff5714");
		$("#confirmPassword").addClass("cnaacValidationFails");
	}
}

function checkConfirmPassword(){
	var cp = $("#confirmPassword").val();
	var p = $("#newPassword").val();
	if(cp==''){
		$("#confirmPasswordDifferenceTips").hide();
		$("#confirmPasswordErrorTips").show();
		$("#confirmPassword").addClass("cnaacValidationFails");
	}else{
		$("#confirmPasswordErrorTips").hide();
		$("#confirmPassword").removeClass("cnaacValidationFails");
		if(cp==p){
			$("#confirmPasswordDifferenceTips").hide();
			$("#newPassword").removeClass("cnaacValidationFails");
			$("#confirmPassword").removeClass("cnaacValidationFails");
		}else{
			$("#confirmPasswordDifferenceTips").show();
			$("#confirmPassword").addClass("cnaacValidationFails");
		}
	}
}

function resetPassword(){
	if(submitValidateForResetPwd()){
		$('#resetPassword').submit();
	}else{
		return;
	}
}




function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}
