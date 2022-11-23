<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		/*
			HttpSession 객체에 "nick"이라는 키값으로 저장된 값이 있는지 읽어와본다, 없으면 null 리턴
			(session scope에 "nick"이라는 키값으로 저장된 문자열이 있는지 읽어와 본다.)
			
		*/
		String nick=(String)session.getAttribute("nick");
	
		//60초간 다시 요청해오지 않으면 삭제하도록 설정
		session.setMaxInactiveInterval(60);
	
		
	%>
	<h3>노는 페이지 입니다</h3>
	<%if(nick==null){ %>
		<p>session 영약(scope)에 "nick"이라는 키값으로 저장된 값이 없습니다.</p>
	<%}else{ %>
		<p>
			<strong><%=nick %></strong> 님 놀러오셨군요. 놀다가세요.
			<a href="logout.jsp">세션에 저장된 nick 삭제(로그아웃)</a>		
		</p>
	<%} %>
</body>
</html>