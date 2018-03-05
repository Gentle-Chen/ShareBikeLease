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

	
	<table border="1">
		<thead>
			<tr>
				<td>单车编号</td>
				<td>单车状态</td>
				<td>单车停靠站点</td>
			</tr>
		</thead>
		<tbody>
			<e:forEach items="${requestScope.bike }" var="bike">
				<tr>
					<td>${bike.b_id}</td>
					<c:set var="b_status" scope="request" value="${bike.b_status}"/>
					<td>
						<c:if test="${b_status == 0}">
							空闲
						</c:if>
						<c:if test="${b_status == 2}">
							损坏
						</c:if>
						<c:if test="${b_status == 3}">
							修理中
						</c:if>
						<c:if test="${b_status == 4}">
							报废	
						</c:if>
					</td>
					<td>${bike.site.s_name}</td>
				</tr>
			</e:forEach>
		</tbody>
	</table>
	
</body>
</html>