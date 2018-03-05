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
				<td>租赁时间</td>
				<td>还车时间</td>
				<td>费用</td>
				<td>状态</td>
				<td>租车人</td>
				<td>还车站点</td>
			</tr>
		</thead>
		<tbody>
			<e:forEach items="${requestScope.lease }" var="lease">
				<tr>
					<td>${lease.l_leaseTime}</td>
					<td>${lease.l_returnTime}</td>
					<td>${lease.l_money}</td>
					<c:set var="l_status" scope="request" value="${lease.l_status}"/>
					<td>
						<c:if test="${l_status == 1}">
							使用中
						</c:if>
					</td>
					<td>${lease.user.u_name}</td>
					<td>${lease.bike.site.s_name}</td>
				</tr>
			</e:forEach>
		</tbody>
	</table>
	
</body>
</html>