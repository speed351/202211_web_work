<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend List2</title>
</head>
<body>
	<%
	List<String> names = new ArrayList<>();
	names.add("kim");
	names.add("lee");
	names.add("park");
	names.add("choi");
	
	%>
	
	<ul>
		<%
		for(int i=0; i<names.size(); i++) {%>
		<li><%out.print(names.get(i)); %></li>
		<%}%> 
	</ul>
</body>
</html>