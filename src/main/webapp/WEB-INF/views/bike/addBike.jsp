<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="post" method="post">
		单车编号:<input type="text" name="b_id" id="b_id" /><br />
		状态:<input type="text" name="b_status" id="b_status" value="可使用" readonly="readonly" /><br />
		站点名字:<select name="s_name" id="s_name">
				<option value="弘毅楼">弘毅楼</option>
				<option value="求是楼">求是楼</option>
				<option value="明德楼">明德楼</option>
			 </select><br>
		<input type="submit" value="submit" />
	</form>
</body>
</html>