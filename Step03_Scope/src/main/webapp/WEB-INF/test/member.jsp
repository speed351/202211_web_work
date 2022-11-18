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
	<h3>회원 정보</h3>
	<p> 번호 : <strong><%=dto.getNum() %></strong></p>
	<p> 이름 : <strong><%=dto.getName() %></strong></p>
	<p> 주소 : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>