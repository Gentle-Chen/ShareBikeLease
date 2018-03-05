<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>所有POI的查询-地址解析</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
</head>
<body>
<input type="button" onclick="displayPOI();" value="确定" />
<div style="width:600px;height:340px;border:1px solid gray;float:left;" id="container"></div>
<div style="width:300px;height:340px;border:1px solid gray;border-left:0;float:left;" id="panel"></div>
</body>
</html>
<script type="text/javascript">
var map = new BMap.Map("container");
var mPoint = new BMap.Point(116.404, 39.915);
map.centerAndZoom(mPoint, 16);
map.enableScrollWheelZoom();        //启用滚轮缩放


function displayPOI(){
	var pointCenter = map.getCenter();
    //创建圆对象
    var circle = new BMap.Circle(pointCenter, 50, {
        strokeColor: "blue",
        strokeWeight: 1,
        fillColor: "#E2E8F1",
        fillOpacity: 0.6
    });
    map.addOverlay(circle);
}


</script>