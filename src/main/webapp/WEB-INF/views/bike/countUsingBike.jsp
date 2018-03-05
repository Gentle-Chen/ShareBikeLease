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

	<form action="countUsingBike" method="post">
		开始日期<input type="date" name="beginTime" id="beginTime" /><br />
		结束日期<input type="date" name="endTime" id="endTime" />
		<input type="submit" value="submit" />
	</form>
	
</body>
</html>