<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	
	MemberDto dto = (MemberDto)request.getAttribute("dto");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>ȸ�� ����</h3>
	<p> ��ȣ : <strong><%=dto.getNum() %></strong></p>
	<p> �̸� : <strong><%=dto.getName() %></strong></p>
	<p> �ּ� : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>