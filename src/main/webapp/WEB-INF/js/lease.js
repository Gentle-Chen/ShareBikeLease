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

