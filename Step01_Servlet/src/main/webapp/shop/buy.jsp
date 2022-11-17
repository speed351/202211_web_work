<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		전송 파라미터를 추출하면 숫자 모양읠 띄고 있어도 문자열(String)으로 읽어진다.
		읽어와서 숫자(정수)로 바꾸고 싶으면 Integer 클래스의 static 메소드 .parseInt() 메소드를 활용
		
		?num=x?amount=y
	*/
	
	int num = Integer.parseInt(request.getParameter("num"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	//GET 방식 파라미터로 전달된 값을 가지고 무언가 구입하는 로직을 처리하고 응답한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		<!-- 클라이언트에게 출력으 되지만 웹브라우저가 무시하는 주석 -->
		<strong><%=num %></strong> 번 상품 <strong><%=amount %></strong>개를 주문 했습니다.
		<%--
			jsp page에서의 주석, jsp page가 무시하는 주석
			
			context path는 나중에 제거되거나 변경될 예정이기 때문에 java code 영역이나 jsp page에 실제로 코딩되어 있으면 안됨
			
			그래서 메소드 혹은 아래의 EL(아래의 ${~~})을 활용해서 context path를 출력해야한다.
		--%>
		<br>
		<a href="${pageContext.request.contextPath}/index.html">인덱스로 돌아가기</a>
		
		
	</p>
</body>
</html>