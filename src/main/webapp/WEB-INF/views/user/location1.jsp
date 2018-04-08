<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>当前位置</title>
<!-- 		<script type="text/javascript" src="/ShareBikeLease/js/quote/jquery-3.2.1.min.js"></script> -->
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/zzsc.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/webuploader.css">		
		<link rel="stylesheet" href="/ShareBikeLease/css/pikaday.css">	
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/moment.js"></script>   
	    <script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/pikaday.js"></script>
	    <script src="/ShareBikeLease/js/quote/common.js"></script>
	    <link rel="stylesheet" href="/ShareBikeLease/js/quote/layui/css/layui.css"  media="all">
	    <script src="/ShareBikeLease/js/quote/layui/layui.js" charset="utf-8"></script>
		<style type="text/css">
		    html,body{margin:0;padding:0;}
		    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
		    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
		</style>
		<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
		<script type="text/javascript">
			hQGHuMEAyLn('[id="bb9c190068b84055"]');
		</script>

</head>

<body>
  <!--百度地图容器-->
  <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true" >
		<jsp:param value="operation" name="action" />
	</jsp:include>

	 <div class="row cnaac-bg">
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="tab-one">
			  	<div class="row">
			  		<div class="col-md-2">
			  		   <jsp:include page="/WEB-INF/views/user/userLeftMenu.jsp" flush="true" >	
			  		   		<jsp:param value="#" name="action" />
			  		   	</jsp:include>
			  		</div>
			  		<div style="width:697px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
  				</div>
  				 
			  </div>
			 
		     </div>
		     
	       </div>
       </div>
  
</body>
<script type="text/javascript">

// 	$(document).ready(function(){
// 		pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page");
// 		$('#foot_page_div').html(pageStr);
// 	});

    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addRemark();//向地图中添加文字标注
        displayPOI();
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(113.543494,22.370807);//定义一个中心点坐标   
        map.centerAndZoom(point,16);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    var content = '<div id="content" style="display:none"><table border="1"><thead><tr>'+
    					'<td>单车编号 </td>'+
    					'<td>单车状态 </td></tr></thead>'+
    					'<tbody><e:forEach items="${requestScope.Bike }" var="bike"><tr>'+
    					'<td>${bike.b_uuid}</td>'+
    					'<td>${bike.b_status}</td>'+
    			'</tr></e:forEach></tbody></table>'+
    			' <div class="row">'+
	                        '<nav class="right-block">'+
							  	'<ul class="pagination" id="foot_page_div"></ul>'+
							'</nav>'+
						'</div></div>';
    
    
	//文字标注数组
    var lbPoints = [{title:"弘毅楼",point:"113.54593|22.374182",content:content,isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ,{title:"求是楼",point:"113.538258|22.374875",content:content,isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ,{title:"明德楼",point:"113.545687|22.369344",content:content,isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ];
    //向地图中添加文字标注函数
    function addRemark(){
        for(var i=0;i<lbPoints.length;i++){
            var json = lbPoints[i];
            var p1 = json.point.split("|")[0];
            var p2 = json.point.split("|")[1];
            var point = new BMap.Point(p1,p2);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
            var label = new BMap.Label("<div style='padding:2px;'><a href='javascript:void(0)' onclick='test()'>"+json.content+"</a></div>",{point:new BMap.Point(p1,p2),offset:new BMap.Size(3,-6)});
            marker.setLabel(label);
            map.addOverlay(marker);
//             map.addOverlay(label);
            label.setStyle({
                borderColor:"#808080",
                color:"#333",
                cursor:"pointer"
    		});
	
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
					$.ajax({
				        timeout: 3000,
				        async: false,
				        url: getContextPath()+'/bike/checkBike/'+b_id,
				        dataType: "json",
				        contentType: "application/json; charset=utf-8",
				        success: function (data) {
				        	if(data["result"] == '20002'){
				        	}
				        }
				    });
				    this.openInfoWindow(_iw);
				    $("#content").css("display","inline");
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
			    	$("#content").css("display","none");
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    
    //画圆
    function displayPOI(){
		var pointCenter = map.getCenter();
	    //创建圆对象
	    var circle = new BMap.Circle(pointCenter, 500, {
	        strokeColor: "blue",
	        strokeWeight: 6,
	        strokeOpacity:0.5,
	        fillColor: 0.6,
// 	        fillOpacity: 0.6
	    });
	    map.addOverlay(circle);
	}
    
  //创建InfoWindow
    function createInfoWindow(i){
        var json = lbPoints[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
//     	http://api0.map.bdimg.com/images/marker_red_sprite.png
// 		http://api.map.baidu.com/img/markers.png
        var icon = new BMap.Icon("http://api0.map.bdimg.com/images/marker_red_sprite.png",
        		new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
   //创建和初始化地图
   initMap(); 
    
</script>
</html>