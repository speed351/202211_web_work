
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//request scope에 "fortuneToday"라는 키값으로 지정된 값을 읽어와서 원래 type으로 casting해서 변수에 넣기
	String fortuneToday = (String)request.getAttribute("fortuneToday");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>오늘의 운세 : <strong><%=fortuneToday %></strong></p>
</body>
</html>