<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 중인 아이디ㅏ 있는지 확인
	String id=(String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>공부 페이지 입니다</h3>
	<p><%=id %> 님 열심히 공부해요!</p>
</body>
</html>