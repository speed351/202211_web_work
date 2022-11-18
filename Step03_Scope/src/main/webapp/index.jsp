<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head> 
<body>
	<div class="container">
	<h1>오늘의 운세 인덱스 페이지</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/fortune">운세 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/member">멤버 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/friend/list">친구 목록 보기</a></li>
			<li><a href="test/play.jsp">놀러가기</a></li>
		</ul>
	</div>
	<form action="${pageContext.request.contextPath }/test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..."/>
		<button type="submit">저장</button>
	</form>
	<form action="${pageContext.request.contextPath }/test/save" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..."/>
		<button type="submit">저장(Servlet)</button>
	</form>
</body>
</html>