<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = (String) session.getAttribute("id");

//로그인 후 가야할 목적지 정보
String url = request.getParameter("url");

if (url == null) {
	//로그인 후에 인덱스로 이동
	String cPath = request.getContextPath();
	url = cPath + "/index.jsp";
} else {

	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비
	String encodedUrl = URLEncoder.encode(url);
}

String thisPage = request.getParameter("thisPage");
%>
<style>
body{
	background-color: #EAEAEA;
}
.side_bar {
	position: fixed;
	top: 0;
	left: 0;
	width: 200px;
	height: 100%;
}
.container{
	margin-left : 200px;
}
.main_container{

	flex-wrap: nowrap;
	flex-direction: row;
	justify-content: center;
	max-width: 1690px;
}


.sticky-box {
	position: fixed;
	top: 200px;
	right: 100px;
	height: 500px;
	background-color: yellow;
	color: black;
	width: 200px;
	text-align: center;
}
.logout{
	position: fixed;
	bottom : 50px;
	left : 65px;
}

.sidebar_id_menu{
	position : absolute;
	left : 30px;
	bottom : 50px;
	display: inherit;
}
.login{
	margin-right:5px;
}


</style>



<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark side_bar">
	<a href="${pageContext.request.contextPath}/index.jsp"
		class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
		<svg class="bi pe-none me-2" width="40" height="32">
				<use xlink:href="" /></svg> <span class="fs-4">Menu</span>
	</a>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">


		<li class="nav-item"><a
			class="nav-link <%=thisPage.equals("index") ? "active" : "" %>"
			href="${pageContext.request.contextPath}/index.jsp"
			aria-current="page"> <svg class="bi pe-none me-2" width="16"
					height="16">
						<use xlink:href="#home" /></svg> INDEX
		</a></li>
		<li><a
			href="${pageContext.request.contextPath}/private/study.jsp"
			class="nav-link text-white <%=thisPage.equals("study") ? "active" : "" %>"">
				<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#speedometer2" /></svg> Study
		</a></li>
		<li><a href="${pageContext.request.contextPath}/private/game.jsp"
			class="nav-link text-white <%=thisPage.equals("game") ? "active" : "" %>"">
				<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#table" /></svg> Game
		</a></li>
		<li><a href="${pageContext.request.contextPath}/file/list.jsp"
			class="nav-link text-white <%=thisPage.equals("file") ? "active" : "" %>">
				<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#grid" /></svg> File
		</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.jsp"
			class="nav-link text-white <%=thisPage.equals("cafe") ? "active" : "" %>">
				<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#people-circle" /></svg> Cafe
		</a></li>

		<%
		if (id == null) {
		%>
		<div class="sidebar_id_menu">
			<form class="login" action="${pageContext.request.contextPath}/users/login_form.jsp" method="post">
				<button class="btn btn-secondary btn-sm" type="submit">로그인</button>
			</form>
			<form class="signin" action="${pageContext.request.contextPath}/users/signup_form.jsp">
				<button class="btn btn-secondary btn-sm">회원가입</button>
			</form>
		</div>
		<%
		} else {
		%>
		<div class="logout">
			<a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-secondary btn-sm logout"> Logout </a>
		</div>
		<%
		}
		%>
	</ul>
	<hr>

</div>

