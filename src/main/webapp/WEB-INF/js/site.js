/**
 * 
 */

function getContextPath() {
	    var pathName = document.location.pathname;
	    var index = pathName.substr(1).indexOf("/");
	    var result = pathName.substr(0,index+1);
	    return result;
}

$(document).ready(function(){
});




function page(pageNum){
	var b_status = $.trim($("#b_status").val());
	var startTime = $.trim($("#startTime").val());
	var endTime = $.trim($("endTime").val());
	var site = $.trim($("#site").val());
	var url = getContextPath() + "/site/get/?pageNum=" + pageNum;
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

function toShowSiteMap(s_uuid){
	var showSiteMap = {
			"s_uuid":s_uuid
	};
	$.ajax({
        timeout: 3000,
        async: false,
        type: "POST",
        url: getContextPath()+'/map/showSiteMap',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(showSiteMap),
        success: function (data) {
        	if(data["result"] == 'success'){
        		$.ajax({
        			 	timeout: 3000,
        		        async: false,
        		        type: "POST",
        		        url: getContextPath()+'/map/showSiteMap',
        		        dataType: "json",
        		        contentType: "application/json; charset=utf-8",
        		        data:JSON.stringify(showSiteMap),
        		});
        	}
        },
 		error:function (data) {
 			alert("fail");
        }
    });
}
 
function detail(s_uuid,s_name){
//	$("#detail").modal();
	$("#mySmallModalLabel").text("");
	$("#mySmallModalLabel").text(s_name+"站点详情");
	$("#detailTable tbody").html("");
	$.ajax({
        timeout: 3000,
        async: false,
        type: "GET",
        url: getContextPath()+'/site/detail/'+s_uuid,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
        	if(data["result"] == 'success'){
        			var bikeList=data["bikeList"];
        			 for(i in bikeList){
        			  var tbBody = "";
        			  tbBody += "<tr>" +
	        			  			"<td id=\"detail_b_id\">"+bikeList[i].b_id+"</td>" +
	        			  			"<td id=\"detail_b_status\">";
        			  if(bikeList[i].b_status == '0'){
        				  tbBody+= "空闲";
        			  }
        			  if(bikeList[i].b_status == '2'){
        				  tbBody+= "损坏";
        			  }
        			  if(bikeList[i].b_status == '5'){
        				  tbBody+= "报废";
        			  }
        			  tbBody +="</td></tr>";
        			  ;
        			  $("#detailTable").append(tbBody);
        			 }
        			}
        },
        error:function(data){
        	alert("fail");
		}
    });
}

function update(s_uuid,s_name,s_longitude,s_latitude,s_capacity){
//	 $("#update").modal();
	$("#update_s_uuid").val(s_uuid);
	$("#update_s_name").val(s_name);
	$("#update_s_tude").val(s_longitude+','+s_latitude);
	$("#update_s_cap").val(s_capacity);
}
function updateSite(){
	var s_uuid = $("#update_s_uuid").val();
	var s_name = $("#update_s_name").val();
	var s_capacity = $("#update_s_cap").val();
	var map ={
		"s_uuid":s_uuid,
		"s_name":s_name,
		"s_capacity":s_capacity
	};
	$.ajax({
		timeout: 3000,
        async: false,
        type: "POST",
        url: getContextPath()+'/site/update',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(map),
        success: function (data) {
        	if(data["result"] == '00000'){
        		layer.open({
        			title: '提示'
        			,area: '300px;'
        			,id: 'LAY_layuipro'
					,btn: ['确定', '取消']
        			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">修改成功</div>'
        			,success: function(layero){
        				 var btn = layero.find('.layui-layer-btn');
        				 btn.find('.layui-layer-btn0').attr({
					        	href : getContextPath()+'/site/get'
        				 });
        				}
        			});
        	}
        }
    });
}

function addSite(){
	var name_flag = true;
	var lon_flag = true;
	var lan_flag = true;
	var s_name = $("#s_name").val();
	var longitude = $("#s_longitude").val();
	var latitude = $("#s_latitude").val();
	var s_capacity = $("#s_capacity").val();
	//站点名字匹配
	var name = /^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
	//经度，整数部分为0-180小数部分为0到6位
	var longreg = /^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/;
	 //纬度,整数部分为0-90小数部分为0到6位
    var latreg = /^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/;
    
    if(!name.test(s_name)){
    	$("#illegalName").show();
    	name_flag = false;
    }else{
    	$("#illegalName").hide();
    	name_flag = true;
    }
	 if(!longreg.test(longitude)){
		 $("#illegalLon").show();
		 lon_flag = false;
	 }else{
		 $("#illegalLon").hide();
		 lon_flag = true;
	 }
	
	 if(!latreg.test(latitude)){
		 $("#illegalLan").show();
		 lan_flag = false;
	 }else{
		 $("#illegalLan").hide();
		 lan_flag = true;
	 }
	 if(name_flag && lon_flag && lan_flag){
		 document.getElementById("addSiteForm").submit();
	 }
}
	
function deleteSite(s_uuid){
	 layui.use('layer', function(){ //独立版的layer无需执行这一句
		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		  layer.open({
			    time: 0 //不自动关闭
			    ,title: '提示'
			    ,area: '300px;'
			    ,shade: [0.8, '#393D49']
			    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">确定删除？</div>'
			    ,btn: ['确定', '取消']
			    ,yes: function(index){
					$.ajax({
				        timeout: 3000,
				        async: false,
				        type: "GET",
				        url: getContextPath()+'/site/delete/'+s_uuid,
				        dataType: "json",
				        contentType: "application/json; charset=utf-8",
				        success: function (data) {
				             	if(data["result"] == '00000'){
				             		layer.open({
				             			title: '提示'
				             			,area: '300px;'
				             			,id: 'LAY_layuipro1'
				     					,btn: ['确定', '取消']
				             			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">删除成功</div>'
				             			,yes: function(layero){
				             				 var btn = layero.find('.layui-layer-btn');
				             				 btn.find('.layui-layer-btn0').attr({
				     					        	href : getContextPath()+'/site/get'
				             				 });
				             				}
				             			});
				             	}
				        }
				    });
			    }
		  });
	 });
}


function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}
