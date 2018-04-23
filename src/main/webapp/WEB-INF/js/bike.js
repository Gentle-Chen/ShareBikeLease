/**
 * 
 */

$(document).ready(function(){
		$('#b_status').mouseleave(function(){
			var b_status = $('#b_status').val();
			if(b_status == '' || b_status == '3' ||b_status == '4' || b_status == '5'){
				$('#timeDiv').hide();
				$('#siteDiv').hide();
			}
			if(b_status == '1'){
				$('#timeDiv').show();
				$('#siteDiv').hide();
			}
			if(b_status == '0' || b_status == '2'){
				$('#timeDiv').hide();
				$('#siteDiv').show();
			}
		});
		
	$('#addBikeId').mouseleave(checkBike);
	
	$('#addBikeSite').mouseleave(checkSiteForAddBike);
	
	
	$('#launchDialog').focus(function(){
		var obj = $('#launch_site');
		$('#launch_site').mouseleave(checkSite(obj));
	});
	
		
		
	$('#subBtn').click(pay);
	
	$('#launchBtn').click(launch);
	
	$('#addBtn').click(addBike);
	
	
	$('#siteSelect').mouseleave(checkSiteForReturnBike);
});


function getContextPath() {
	    var pathName = document.location.pathname;
	    var index = pathName.substr(1).indexOf("/");
	    var result = pathName.substr(0,index+1);
	    return result;
}



function leaseBike(u_uuid,b_uuid){
	var leaseMap = {
			"u_uuid":u_uuid,
			"b_uuid":b_uuid,
			};
	 $.ajax({
	        timeout: 3000,
	        async: false,
	        type: "POST",
	        url: getContextPath()+'/lease',
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data:JSON.stringify(leaseMap),
	        success: function (data) {
	        	alert("success");
	        	window.location.href='toShowLeaseBike/'+data["l_uuid"];
	        },
	 		error:function (data) {
	 			alert("fail");
	        }
	    });
}

function returnBike_getSite(l_uuid,b_uuid,u_uuid){
	$("#l_uuid").val(l_uuid);
	$("#b_uuid").val(b_uuid);
	$("#u_uuid").val(u_uuid);
	 $.ajax({
	        timeout: 3000,
	        async: false,
	        type: "GET",
	        dataType:"json",
	        url: getContextPath()+'/site/all',
	        success: function (data) {
	        	console.log(data.site);
	        	var list = new Array();
	        	list = data.site;
	        	for(i=0;i<list.length;i++){
	        		$("#siteSelect").append('<option value='+list[i].s_uuid+','+list[i].s_capacity+'>'+list[i].s_name+'</option>');
	        	}
	        },
	 		error:function (data) {
	 			alert("fail");
	        }
	    });
}
function checkSiteForReturnBike(){
	 var value = $("#siteSelect").val();
	 if(value == "0"){
		 $("#siteNotEmpty").show();
		 $("#siteError").hide();
		 $("#returnBtn").attr({"disabled":"disabled"});
	 }else{
		 var capacity = value.split(",")[1];
		 if(capacity == "0"){
			 $("#siteError").show();
			 $("#siteNotEmpty").hide();
			 $("#returnBtn").attr({"disabled":"disabled"});
		 }else{
			 $("#siteError").hide();
			 $("#siteNotEmpty").hide();
			 $('#returnBtn').removeAttr("disabled"); 
//			 var s_uuid = value.split(",")[0];
//			 var b_uuid = $("#b_uuid").val();
//			 var l_uuid = $("#l_uuid").val();
//			 var returnMap = {
//					 "s_uuid":s_uuid,
//					 "b_uuid":b_uuid,
//					 "l_uuid":l_uuid
//			 };
//			 $.ajax({
//			        timeout: 3000,
//			        async: false,
//			        type: "POST",
//			        url: getContextPath()+'/lease/return',
//			        dataType: "json",
//			        contentType: "application/json; charset=utf-8",
//			        data:JSON.stringify(returnMap),
//			        success: function (data) {
//			        	if(data["result"] == "00000"){
//			        		window.location.href='user/order';
//			        	}
//			        }
//			    });
		 }
	 }
}



function pay() {
	var u_uuid = $('input[name="u_uuid"]').val();
	var b_uuid = $('input[name="b_uuid"]').val();
	var s_uuid = $('input[name="s_uuid"]').val();
	var l_uuid = $('input[name="l_uuid"]').val();
	var l_returnTime = $('input[name="l_returnTime"]').val();
	var money = $('span[class="text-danger"]').text();
	var map = {
			"u_uuid":u_uuid,
			"b_uuid":b_uuid,
			"s_uuid":s_uuid,
			"l_uuid":l_uuid,
			"l_returnTime":l_returnTime,
			"l_money":money
	};
	
	 $.ajax({
	        timeout: 3000,
	        async: false,
	        type: "POST",
	        url: getContextPath()+'/return',
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data:JSON.stringify(map),
	        success: function (data) {
	        	alert("success");
	        	window.location.href='toShowLeaseBike/'+l_uuid;
	        },
	 		error:function (data) {
	 			alert("fail");
	        }
	    });
}

function page(pageNum){
	var b_status = $.trim($("#b_status").val());
	var startTime = $.trim($("#startTime").val());
	var endTime = $.trim($("endTime").val());
	var site = $.trim($("#site").val());
	var url = getContextPath() + "/bike/get/?pageNum=" + pageNum;
	if (b_status != ""){
		url = url + "&b_status=" + b_status;
	}
	if (startTime != ""){
		url = url + "&startTime=" + startTime;
	}
	if (endTime != ""){
		url = url + "&endTime=" + endTime;
	}
	if (site != ""){
		url = url + "&site=" + site;
	}
	window.location = url;
}

function page1(pageNum){
	var b_status = $.trim($("#b_status").val());
	var startTime = $.trim($("#startTime").val());
	var endTime = $.trim($("endTime").val());
	var site = $.trim($("#site").val());
	var url = getContextPath() + "/bike/bikeManage/?pageNum=" + pageNum;
	if (b_status != ""){
		url = url + "&b_status=" + b_status;
	}
	if (startTime != ""){
		url = url + "&startTime=" + startTime;
	}
	if (endTime != ""){
		url = url + "&endTime=" + endTime;
	}
	if (site != ""){
		url = url + "&site=" + site;
	}
	window.location = url;
}

function page2(pageNum){
	var b_status = $.trim($("#b_status").val());
	var startTime = $.trim($("#startTime").val());
	var endTime = $.trim($("endTime").val());
	var site = $.trim($("#site").val());
	var site1 = $("#site1").val();
	var url = getContextPath() + "/user/location/?pageNum=" + pageNum + "&site1=" + site1;
	if (b_status != ""){
		url = url + "&b_status=" + b_status;
	}else{
		url = url + "&formsite=" + site1;
	}
	if (site != ""){
		url = url + "&site=" + site;
	}
	window.location = url;
}

function toLaunch(b_uuid,b_id){
	$('input[name="launch_b_uuid"]').val(b_uuid);
	$('input[name="launch_b_id"]').val(b_id);
	
}

function checkSite(obj){
	var site_flag = false;
	var site = obj.val();
	 $.ajax({
	        timeout: 3000,
	        async: false,
	        url: getContextPath()+'/bike/checkSite/'+site,
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        success: function (data) {
	        	if(data["result"] == '20001'){
	        		site_flag = true;
	        	}
	        }
	    });
	 return site_flag;
}

function launch() {
	var site = $('select[name="launch_site"]').val();
	if(site == ""){
		$('#notEmptyLoaction').hide();
		$('#notEmpty').show();
	}else{
    	if(checkSite($('select[name="launch_site"]'))){
    		$('#notEmpty').hide();
    		$('#notEmptyLoaction').show();
    	}else{
    		$('#notEmpty').hide();
    		$('#notEmptyLoaction').hide();
    		document.getElementById("launch").submit();
    	}
    }
}

function checkBike(){
	var bike_flag = true;
	var b_id = $('#addBikeId').val();
	if(b_id == ""){
		$('#bikeExits').hide();
		$('#notEmptyBikeId').show();
		bike_flag = false;
	}else{
		 $.ajax({
		        timeout: 3000,
		        async: false,
		        url: getContextPath()+'/bike/checkBike/'+b_id,
		        dataType: "json",
		        contentType: "application/json; charset=utf-8",
		        success: function (data) {
		        	if(data["result"] == '20002'){
		        		$('#notEmptyBikeId').hide();
		        		$('#bikeExits').show();
		        		bike_flag = false;
		        	}else{
		        		$('#notEmptyBikeId').hide();
		        		$('#bikeExits').hide();
		        		bike_flag = true;
		        	}
		        }
		    });
		}
	 return bike_flag;
}

function checkSiteForAddBike(){
	
	var site_flag = true;
	var site = $('#addBikeSite').val();
	if(site == ""){
		$('#notEmptyLoaction').hide();
		$('#notEmptySite').show();
		site_flag = false;
	}else{
		if(checkSite($('#addBikeSite'))){
			$('#notEmptySite').hide();
			$('#notEmptyLoaction').show();
			site_flag = false;
		}else{
			$('#notEmptySite').hide();
			$('#notEmptyLoaction').hide();
			site_flag = true;
		}
	}
	return site_flag;
}

function addBike() {
	
	if(checkBike() && checkSiteForAddBike()){
		document.getElementById("addBikeForm").submit();
	}
}
 

//if(site == ""){
//	$('#notEmptyLoaction').hide();
//	$('#notEmptySite').show();
//	site_flag = false;
//}else{
//	if(checkSite($('#addBikeSite'))){
//		$('#notEmptySite').hide();
//		$('#notEmptyLoaction').show();
//		site_flag = false;
//	}else{
//		$('#notEmptySite').hide();
//		$('#notEmptyLoaction').hide();
//		site_flag = true;
//	}
//}

//var bike_flag = true;
//var site_flag = true;
//var b_id = $('#addBikeId').val();
//var site = $('#addBikeSite').val();
//if(b_id == ""){
//	$('#bikeExits').hide();
//	$('#notEmptyBikeId').show();
//	bike_flag = false;
//}else{
//	if(checkBike($('#addBikeId'))){
//		$('#notEmptyBikeId').hide();
//		$('#bikeExits').show();
//		bike_flag = false;
//	}else{
//		$('#notEmptyBikeId').hide();
//		$('#bikeExits').hide();
//		bike_flag = true;
//	}
//}


