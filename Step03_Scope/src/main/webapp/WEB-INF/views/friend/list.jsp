<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//list ��� Ű������ request scope�� ����ִ� List<String>�� type�� ������ ��������
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>ģ�� ���</h3>
	<ul>
		<%for(String tmp:list){%>
			<li><%=tmp %></li>
		<%} %>
	</ul>
</body>
</html>