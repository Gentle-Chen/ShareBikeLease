<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
var mPoint = new BMap.Point(113.543494,22.370807);
map.centerAndZoom(mPoint, 16);
map.enableScrollWheelZoom();        //启用滚轮缩放

var mOption = {
    poiRadius : 500,           //半径为1000米内的POI,默认100米
    numPois : 12                //列举出50个POI,默认10个
}

var myGeo = new BMap.Geocoder();        //创建地址解析实例
function displayPOI(){
    map.addOverlay(new BMap.Circle(mPoint,500));        //添加一个圆形覆盖物
    myGeo.getLocation(mPoint,
        function mCallback(rs){
            var allPois = rs.surroundingPois;       //获取全部POI（该点半径为100米内有6个POI点）
            for(i=0;i<allPois.length;++i){
                document.getElementById("panel").innerHTML += "<p style='font-size:12px;'>" + (i+1) + "、" + allPois[i].title + ",地址:" + allPois[i].address + "</p>";
                map.addOverlay(new BMap.Marker(allPois[i].point));                
            }
        },mOption
    );
}


</script>