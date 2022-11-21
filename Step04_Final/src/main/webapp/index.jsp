<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	form{
		display:inline;
	}
	div{
		margin-bottom: 5px;
	}
</style>

<body>

	<div class="container">
		<h3>인덱스 페이지</h3>
	<%
	if(id==null){
	%>
	
		<form action="${pageContext.request.contextPath}/users/login.jsp" method="post">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" />
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<button type="submit">로그인</button>
		</form>
		<form action="${pageContext.request.contextPath}/users/signup_form.jsp">
			<button>회원가입</button>
		</form>
	
	<%} else { %>
			<p>
				<strong><%=id%></strong>님 안녕하세요.
			</p>
			<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
		</form>
	
	<%}%>
		<br>
		<br>
		
		<ul>
			<li><a href="${pageContext.request.contextPath}/private/study.jsp">회원 전용 공간(공부)</a></li>
			<li><a href="${pageContext.request.contextPath}/private/game.jsp">회원 전용 공간(개인)</a></li>
		</ul>
	
	</div>
	
</body>
</html>