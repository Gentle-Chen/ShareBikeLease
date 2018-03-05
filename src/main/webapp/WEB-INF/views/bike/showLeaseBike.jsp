<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/quote/jquery-3.2.1.min.js	"></script>
<script type="text/javascript" src="../js/bike.js"></script>
<link rel="stylesheet" type="text/css" href="../css/v1.1/cnaacbs.css" />
<link rel="stylesheet" type="text/css" href="../css/v1.1/cnaacbs-theme.css" />
<link href="../css/v1.1/css.css" rel="stylesheet" type="text/css">
<link href="../css/v1.1/custom.css" rel="stylesheet" type="text/css">
</head>
<body>

	<table border="1">
		<thead>
			<tr>
					<td>租车时间</td>
					<td>还车时间</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
		</thead>
		<e:forEach items="${requestScope.leaseBike }" var="lease">
			<thead>
					
			</thead>
			<tbody>
				<tr>
					<td>${lease.l_leaseTime}</td>
					<td>${lease.l_returnTime}</td>
					<td>
						<c:if test="${lease.l_status == '0' }">未归还
						</c:if>
						<c:if test="${lease.l_status == '1' }">已归还
						</c:if>
					</td>
					<td>
						<c:if test="${lease.l_status == '0' }">
							<a href="${ctx}/bike/toPay/${lease.user.u_uuid}/${lease.bike.b_uuid}/2/${lease.l_uuid}" >
				            	<button type="button" class="btn btn-info btn-sm">
				            		<span class="glyphicon glyphicon-credit-card" aria-hidden="true" style="margin-right: 3px;"></span>
				            			还车
				            	</button>
				            </a>
						</c:if>
						<c:if test="${lease.l_status == '1' }">--</c:if>
					</td>
				</tr>
			</tbody>
		</e:forEach>
	</table>
</body>
</html>