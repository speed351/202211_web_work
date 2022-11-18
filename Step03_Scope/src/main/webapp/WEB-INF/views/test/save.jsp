<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String nick=request.getParameter("nick");
		
	%>
	<p> <strong><%=nick %></strong>이라는 닉네임을 저장합니다.</p>
	<p>30분동안 아무런 요청을 하지 않거나 웹 브라우저를 닫으면 자동 삭제됩니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>