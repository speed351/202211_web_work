<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//list 라는 키값으로 request scope에 담겨있는 List<String>에 type의 참조값 가져오기
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>친구 목록</h3>
	<ul>
		<%for(String tmp:list){%>
			<li><%=tmp %></li>
		<%} %>
	</ul>
</body>
</html>