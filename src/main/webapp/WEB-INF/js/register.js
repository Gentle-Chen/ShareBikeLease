var emailLock = false;

$(document).ready(function() {
	
	validateForm();
});

function checkUser() {
	var valid = submitValidate();
	if (valid==true && emailLock==true ) {
		document.getElementById("registerForm").submit();
	}else{
		return false;
	}
}

function isEmail(email){
	var eReg = /^[a-zA-Z0-9][a-zA-Z0-9._-]*@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+$/;
	var emRes = eReg.test(email);
	return emRes;
}

function checkEmail() {
	var email = $("#u_email").val();
	var emRes = isEmail(email);
	var emailMap = {
			"u_email":email,
	};
	if (emRes) {
		$("#invalidEmailTips").hide();
		$.ajax({
			timeout: 3000,
	        async: true,
	        type: "POST",
	        url : getContextPath()+"/user/checkEmail",
	        dataType: "json",
	        data:JSON.stringify(emailMap),
	        contentType: "application/json; charset=utf-8",
	        success: function (data) {
	        	if (data["result"] == '0') {
					emailLock = true;
					$("#emailExistTips").hide();
				} else {
					emailLock = false;
					$("#emailExistTips").show();
				}
	        }
	    });
	} else {
		$("#emailExistTips").hide();
		$("#invalidEmailTips").show();
	}
}

function checkPassword(){
	var eReg = /^(?=.*\d)[a-zA-Z\d]{6,20}$/;
	var p = $("#u_password").val();
	var epRes = eReg.test(p);
	if(epRes){
		$("#passwordErrorTips").css("color","#b4b4b4");
		$(this).removeClass("cnaacValidationFails");
		var cp = $("#confirmPassword").val();
		if(cp != ''){
			if(cp==p){
				$("#confirmPasswordDifferenceTips").hide();
				$("#confirmPassword").removeClass("cnaacValidationFails");
			}else{
				$("#confirmPasswordDifferenceTips").show();
				$("#confirmPassword").addClass("cnaacValidationFails");
			}
		}
	}else{
		$("#passwordErrorTips").css("color","#ff5714");
		$(this).addClass("cnaacValidationFails");
	}
}

function checkConfirmPassword(){
	var cp = $("#confirmPassword").val();
	var p = $("#u_password").val();
	if(cp==''){
		$("#confirmPasswordDifferenceTips").hide();
		$("#confirmPasswordErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}else{
		$("#confirmPasswordErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
		if(cp==p){
			$("#confirmPasswordDifferenceTips").hide();
			$(this).removeClass("cnaacValidationFails");
		}else{
			$("#confirmPasswordDifferenceTips").show();
			$(this).addClass("cnaacValidationFails");
		}
	}
}

function checkName(){
	var name = $.trim($("#u_name").val());
	if(name=='' || name.length > 30){
		$("#userNameErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}else{
		$("#userNameErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}
}

function checkSex(){
	var sex = $("#u_sex").val();
	if(sex==''){
		$("#sexErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}else{
		$("#sexErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}
}

function checkIdentityCard(){
	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	var regRes = reg.test($("#u_identityCard").val());
	if(regRes){
		$("#identityCardErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}else{
		$("#identityCardErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}
}

function checkPhone(){
	var eReg = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
	var _eReg = /^1\d{10}$/;
	var epRes = eReg.test($("#u_phone").val());
	var _epRes = _eReg.test($("#u_phone").val());
	if(epRes || _epRes){
		$("#mobilePhoneErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
		$("#userPhoneFormatTips").show();
	}else{
		$("#userPhoneFormatTips").hide();
		$("#mobilePhoneErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}
}

function checkAddress(){
	var addr = $.trim($("#u_address").val());
	if(addr=='' || addr.length > 100){
		$("#addressErrorTips").show();
		$(this).addClass("cnaacValidationFails");
	}else{
		$("#addressErrorTips").hide();
		$(this).removeClass("cnaacValidationFails");
	}
}

function validateForm(){
	$("#u_email").blur(checkEmail);
	$("#u_password").blur(checkPassword);
	$("#confirmPassword").blur(checkConfirmPassword);
	$("#u_name").blur(checkName);
	$("#u_sex").blur(checkSex);
	$("#u_identityCard").blur(checkIdentityCard);
	$("#u_phone").blur(checkPhone);
	$("#address").blur(checkAddress);
}

function submitValidate(){
	var result = false;
	$("#registerForm input[type!=file]").blur();
	var eles = $("#registerForm").find(".cnaacValidationFails");
	if(eles.length==0){
		result = true;
	}
	return result ;
}

function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}
