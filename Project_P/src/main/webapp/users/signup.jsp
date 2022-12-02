<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//1. 폼 전송되는 id, pwd, email을 읽어온다.
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");
String pnum = request.getParameter("pnum");
//2. UserDto에 담는다
UsersDto dto = new UsersDto();
UsersDao dao = UsersDao.getInstance();

dto.setId(id);
dto.setPwd(pwd);
dto.setEmail(email);
dto.setPnum(pnum);
//3. UserDao를 이용해서 DB에 저장하고
boolean isSuccess = dao.insert(dto);
//4. 결과를 응답한다.

boolean isValid = dao.isValid(dto);
if (isValid) {
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
	session.setMaxInactiveInterval(600);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
.container {
	display: grid;
	grid-template-rows: minmax(200px, auto) minmax(589px, auto)
		minmax(200px, auto);
	grid-template-columns: minmax(500px, auto);
	text-align: center;
	align-items: center;
	gap: 10px;
	box-shadow: 0px 5px 20px 0px grey;
	border-right: thin;
	z-index: 2;
}

button {
	width : 200px;
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

</style>
<body>
	<div class="container">
		<%
		if (isSuccess) {
		%>
		<h3></h3>
		<div class="body">
			<img src="https://i.pinimg.com/originals/4b/39/a9/4b39a94252cddcc7d20326c140278c4e.png" alt="success" style="width:50%;"/>
			<br><br>
			<button onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
					Home
			</button>
		</div>
		<%
		} else {
		%>
		<h3></h3>
		<div class="body">
			<img src="https://media.istockphoto.com/vectors/fail-ink-stamp-vector-id951985126?k=20&m=951985126&s=612x612&w=0&h=vq_zrYB1EdKILKuO3wMW5e9M4VdGFLSJPGXe4dp84k4=" style="width:20%;"
				alt="signin_fail" /> 
				<br><br><br><br><br><br>
			<button onclick="location.href='${pageContext.request.contextPath}/users/signup_form.jsp'">
				Sign-Up
			</button>
			<button onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
				Home
			</button>

		</div>

		<%
		}
		%>
	</div>

</body>
</html>