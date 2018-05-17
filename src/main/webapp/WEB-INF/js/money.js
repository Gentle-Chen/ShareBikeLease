/**
 * 
 */

$(document).ready(function() {
});



function recharge(){
	var flag = true;
	var reg=/^[1-9]\d*$|^0$/;
	var money = $('input:radio[name="docVlGender"]:checked').val();
	var type = $('input:radio[name="radio1"]:checked').val();
	if(money == 0){
		money = $('#money1').val();
	}
	if(typeof(money) == "undefined"){
		$('#notEmptyMoney').show();
		flag = false;
	}else{
		$('#notEmptyMoney').hide();
		flag = true;
	}
	if(!reg.test(money) || money < 0 || money > 1000 || money == ""){
		$('#illegalMoney').show();
		flag = false;
	}
	else{
		$('#illegalMoney').hide();
		flag = true;
	}
	if(typeof(type) == "undefined"){
		$('#notEmptyWay').show();
		flag = false;
	}
	else{
		$('#notEmptyWay').hide();
		flag = true;
	}
	if(flag){
		var money = $("#money").text();
		money = money.split('元')[0];
		var map = {
			"money":money
		};
		setTimeout(function(){
			$.ajax({
		        timeout: 3000,
		        async: false,
		        type: "POST",
		        url: getContextPath()+'/user/rechargeMoney',
		        dataType: "json",
		        contentType: "application/json; charset=utf-8",
		        data:JSON.stringify(map),
		        success: function (data) {
		        	$("#rechargeBtn").attr("disabled","disabled").css("cursor","wait").val("正在充值...");
		        	if(data["result"] == '00000'){
		        		layui.use('layer', function(){ //独立版的layer无需执行这一句
			      			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		        		layer.open({
		        		    time: 0 //不自动关闭
		        		    ,title: '提示'
		        		    ,area: '300px;'
		        		    ,shade: [0.8, '#393D49']
		        		    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">充值成功</div>'
		        		    ,btn: ['确定']
			        		,success: function(layero){
		           				 var btn = layero.find('.layui-layer-btn');
		           				 btn.find('.layui-layer-btn0').attr({
							        	href : getContextPath()+'/user/recharge'
		           				 });
		           				}
		        			});
		        		});
		        	}
		        }
		        	
		    });
			
		}, 1500);
	}
	
}

function payDeposit(u_uuid){
	var map = {
		"u_uuid":u_uuid	
	};
	$.ajax({
		timeout: 3000,
        async: false,
        type: "POST",
        url: getContextPath()+'/user/payDeposit',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(map),
        success: function (data) {
        	if(data["result"] == '00000'){
        		layui.use('layer', function(){ //独立版的layer无需执行这一句
	      			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        		layer.open({
        		    time: 0 //不自动关闭
        		    ,title: '提示'
        		    ,area: '300px;'
        		    ,shade: [0.8, '#393D49']
        		    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">成功缴纳</div>'
        		    ,btn: ['确定']
	        		,success: function(layero){
           				 var btn = layero.find('.layui-layer-btn');
           				 btn.find('.layui-layer-btn0').attr({
					        	href : getContextPath()+'/user/deposit'
           				 });
           				}
        			});
        		});
        	}else{
        		layui.use('layer', function(){ //独立版的layer无需执行这一句
	      			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
      		layer.open({
      		    time: 0 //不自动关闭
      		    ,title: '提示'
      		    ,area: '300px;'
      		    ,shade: [0.8, '#393D49']
      		    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">余额不足，请前往充值</div>'
      		    ,btn: ['确定']
	        		,success: function(layero){
         				 var btn = layero.find('.layui-layer-btn');
         				 btn.find('.layui-layer-btn0').attr({
					        	href : getContextPath()+'/user/recharge'
         				 });
         				}
      			});
      		});
        	}
        }
        	
    });
}

function returnDeposit(u_uuid){
	var map = {
		"u_uuid":u_uuid	
	};
	var url = getContextPath()+'/user/returnDeposit';
	$.ajax({
		timeout: 3000,
        async: false,
        type: "POST",
        url: getContextPath()+'/user/returnDeposit',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data:JSON.stringify(map),
        success: function (data) {
        	if(data["result"] == '00000'){
        		layui.use('layer', function(){ //独立版的layer无需执行这一句
	      			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        		layer.open({
        		    time: 0 //不自动关闭
        		    ,title: '提示'
        		    ,area: '300px;'
        		    ,shade: [0.8, '#393D49']
        		    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">成功退还</div>'
        		    ,btn: ['确定']
	        		,success: function(layero){
           				 var btn = layero.find('.layui-layer-btn');
           				 btn.find('.layui-layer-btn0').attr({
					        	href : getContextPath()+'/user/deposit'
           				 });
           				}
        			});
        		});
        	}else{
        		layui.use('layer', function(){ //独立版的layer无需执行这一句
	      			  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
      		layer.open({
      		    time: 0 //不自动关闭
      		    ,title: '提示'
      		    ,area: '300px;'
      		    ,shade: [0.8, '#393D49']
      		    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">您尚有未结算的订单</div>'
      		    ,btn: ['确定']
	        		,success: function(layero){
         				 var btn = layero.find('.layui-layer-btn');
         				 btn.find('.layui-layer-btn0').attr({
					        	href : getContextPath()+'/user/order'
         				 });
         				}
      			});
      		});
        	}
        }
        	
    });
}

function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}