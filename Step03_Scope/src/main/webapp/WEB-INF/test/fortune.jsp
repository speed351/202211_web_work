
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//request scope�� "fortuneToday"��� Ű������ ������ ���� �о�ͼ� ���� type���� casting�ؼ� ������ �ֱ�
	String fortuneToday = (String)request.getAttribute("fortuneToday");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>������ � : <strong><%=fortuneToday %></strong></p>
</body>
</html>