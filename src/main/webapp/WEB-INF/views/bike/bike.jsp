<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/quote/jquery-3.2.1.min.js	"></script>
<script type="text/javascript" src="../js/bike.js"></script>
<link rel="stylesheet" type="text/css" href="../css/v1.1/cnaacbs.css" />
<link rel="stylesheet" type="text/css" href="../css/v1.1/cnaacbs-theme.css" />
<link href="../css/v1.1/css.css" rel="stylesheet" type="text/css">
<link href="../css/v1.1/custom.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>

</head>
<body>
<%-- 	<%= request.getAttribute("User")%> --%>
	
<%-- 	<%= request.getAttribute("Bike")%> --%>

	
	<table border="1">
		<thead>
			<tr>	
				<td>单车编号</td>
				<td>单车状态</td>
				<td>单车停放站点</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<e:forEach items="${requestScope.Bike }" var="bike">
				<tr>
					<td>${bike.b_id}</td>
					<td>
						<c:if test="${bike.b_status == '0' }">可使用
						</c:if>
						<c:if test="${bike.b_status == '1' }">使用中
						</c:if>
						<c:if test="${bike.b_status == '2' }">损坏
						</c:if>
						<c:if test="${bike.b_status == '3' }">修理中
						</c:if>
						<c:if test="${bike.b_status == '4' }">报废
						</c:if>
					</td>
					<td>
						<c:choose>
							<c:when test="${bike.site.getS_uuid() == '1' }">--
							</c:when>
							<c:otherwise>
								${bike.site.getS_name()}
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:if test="${bike.b_status == '0' }">
							<a href="javascript:void(0)" onclick="leaseBike('1','${bike.b_uuid}')">租赁</a>
						</c:if>
<%-- 						<c:if test="${bike.b_status == '1' }"> --%>
<%-- 							<a href="${ctx}/bike/toPay/1/${bike.b_uuid}/2/1" > --%>
<!-- 				            	<button type="button" class="btn btn-info btn-sm"> -->
<!-- 				            		<span class="glyphicon glyphicon-credit-card" aria-hidden="true" style="margin-right: 3px;"></span> -->
<!-- 				            		还车 -->
<!-- 				            	</button> -->
<!-- 				            </a> -->
<%-- 			            </c:if> --%>
					</td>
				</tr>
			</e:forEach>
		</tbody>
	</table>
	
	<div id="leaseBike" style="display:none">
		<form action="lease" method="post">
			<input type="text" id="userId" name="userId" />
			<input type="text" id="bikeId" name="bikeId" />
			<input type="submit" value="submi" />
		</form>
	</div>
	
</body>
</html>