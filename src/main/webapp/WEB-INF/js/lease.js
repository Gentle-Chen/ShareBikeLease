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
        			  $("#detailTable").append(tbBody); 
        			 }
        			}
        },
        error:function(data){
        	alert("fail");
		}
    });
}


function returnBike(){
	var l_uuid = $("#l_uuid").val();
 	var u_uuid = $("#u_uuid").val();
	var b_uuid = $("#b_uuid").val();
	var siteSelect = $("#siteSelect").val();
	var s_uuid = siteSelect.split(",")[0];
	var returnMap = {
			 "s_uuid":s_uuid,
			 "b_uuid":b_uuid,
			 "l_uuid":l_uuid,
			 "u_uuid":u_uuid
	 };
	 layer.open({
		    time: 0 //不自动关闭
		    ,title: '提示'
		    ,area: '300px;'
		    ,shade: [0.8, '#393D49']
		    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">确定归还？</div>'
		    ,btn: ['确定', '取消']
		    ,yes: function(index){
		        $.ajax({
		        	 timeout: 3000,
		 	        async: false,
		 	        type: "POST",
		 	        url: getContextPath()+'/return',
		 	        dataType: "json",
		 	        contentType: "application/json; charset=utf-8",
		 	        data:JSON.stringify(returnMap),
		            success:function(data){
		            	var a = data["result"];
		            	if(data["result"] == "50001" ){
		            		layer.open({
		            			title: '提示'
		            			,area: '300px;'
		            			,id: 'LAY_layuipro'
		    					,btn: ['确定', '取消']
		            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">金额不足，支付失败，请前往充值</div>'
		            			,success: function(layero){
		            				 var btn = layero.find('.layui-layer-btn');
		            				 btn.find('.layui-layer-btn0').attr({
		 					        	href : getContextPath()+'/user/order'
		            				 });
		            				}
		            			});
		            	}else{
			            		layer.open({
			            			title: '提示'
			            			,area: '300px;'
			            			,id: 'LAY_layuipro'
			    					,btn: ['确定', '取消']
			            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">归还成功</div>'
			            			,success: function(layero){
			            				 var btn = layero.find('.layui-layer-btn');
			            				 btn.find('.layui-layer-btn0').attr({
			 					        	href : getContextPath()+'/user/order'
			            				 });
			            				}
			            			});
		            	}
		            	
		           			 }
		       			  });
		   				 }
					});
//	 $.ajax({
//	        timeout: 3000,
//	        async: false,
//	        type: "POST",
//	        url: getContextPath()+'/lease/return',
//	        dataType: "json",
//	        contentType: "application/json; charset=utf-8",
//	        data:JSON.stringify(returnMap),
//	        success: function (data) {
//	        	if(data["result"] == "00000"){
//	        		window.location.href='user/order';
//	        	}
//	        }
//	    });
}
