<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/quote/jquery-3.2.1.min.js	"></script>
<title>Insert title here</title>

</head>
<body>

	<form action="countOtherBike" method="post">
		单车状态<select name="b_status" id="b_status">
		 		<option value="--" selected="selected"></option>  
				<option value="0">空闲</option>
				<option value="2">损坏</option>
				<option value="3">修理中</option>
				<option value="4">明报废</option>
			 </select><br />
		站点名字<select name="s_name" id="s_name">
				<option value="--" selected="selected"></option>  
				<option value="弘毅楼">弘毅楼</option>
				<option value="求是楼">求是楼</option>
				<option value="明德楼">明德楼</option>
			 </select><br />
		<input type="submit" value="submit" />
	</form>
	
</body>
</html>