<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str = request.getParameter("msg");
	
	%>
	<h1>index page로 부터 전달받은 말은 <%=str%> 입니다.</h1>
</body>
</html>