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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>

.container{
	display : grid;
	grid-template-areas:
				"header1 header2 header3"
				"screen screen screen"
				"board1 board1 rank"
				"board2 board2 rank"
				"footer footer footer";
	grid-template-columns : minmax(100px, auto) minmax(275px, auto) minmax(100px, auto);
	grid-template-rows : 50px;
	align-items: center;
	gap : 10px;
	box-shadow: 0px 5px 20px 0px grey;
	border-right: thin;
	z-index:2;
}
.header_bg{
	background-color : #802045;
	position : fixed;
	width : 100%;
	height : 50px;
	left : 0px;
	top : 0px;
	
}
.header1{
	grid-area : header1;
	z-index : 1;
	position: sticky;
    top: 0px;
}
.header2{
	grid-area : header2;
	display:inline;
	position: sticky;
    top: 7px;
}
.header3{
	grid-area : header3;
	display:inline;
	z-index : 1;
	position: sticky;
    top: 12px;
}
@media screen and (max-width : 800px){
	.nav_user{
	display : none;
	}
}
@media screen and (max-width : 1200px){
	.login_nav_user{
	display : none;
	}
}
.logo{
	display : inline;
}
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
.nav_content{
	position:relative;
	display : inline;
}
.nav_content>a{
	margin : 5px;
	font-size: 25px;
	color: #FAECC5;
	text-decoration: none;
	font-family: 'Jua', sans-serif;
}
.nav_user{
	align-items : end ;
    top: 10px;
	display : inline;
	text-decoration: none;
	background-color : #802045;
}	
.nav_user>a{
	text-decoration: none;
}
.screen{
	grid-area : screen;
	box-shadow: 0px 0px 5px 2px grey;
	
}
.board1{
	grid-area : board1;
	box-shadow: 0px 0px 5px 2px grey;
}
.board2{
	grid-area : board2;
	box-shadow: 0px 0px 5px 2px grey;
}
.rank{
	grid-area : rank;
	box-shadow: 0px 0px 5px 2px grey;
	align-items:stretch;
	height : 100%;
}
.footer{
	grid-area : footer;
	height :150px;
}
.screen_img{
	width : 100%; 
}

button {
	width : 100px;
	background: #377a77;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 15px;
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
</head>
<body>
	<div class="header_bg"></div>
	<div class="container">
			<div class="header1">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.jsp"> 
						<img height="50px" src="https://digitalhub.fifa.com/transform/3a170b69-b0b5-4d0c-bca0-85880a60ea1a/World-Cup-logo-landscape-on-dark?io=transform:fill&quality=75" alt="" />
					</a>
				</div>
			</div>
			<div class="header2">
				<div class="nav_content">
						<a href=""><span>홈</span></a>
						<a href=""><span>일정</span></a>
						<a href=""><span>게시판</span></a>
						<a href=""><span>뉴스</span></a>
						<a href=""><span>순위</span></a>
				</div>
			</div>		
			<div class="header3">
				<div class="nav_user">
							<%
							if (id == null) {
							%>
							<button onclick="location.href='${pageContext.request.contextPath}/users/login_form.jsp'">LOG IN</button>
							<button onclick="location.href='${pageContext.request.contextPath}/users/signup_form.jsp'">SIGN-UP</button>
							
							
							
							<%-- <div class="sidebar_id_menu">
								<form class="login" action="${pageContext.request.contextPath}/users/login_form.jsp" method="post">
									<button class="btn btn-secondary btn-sm" type="submit">로그인</button>
								</form>
								<form class="signin" action="${pageContext.request.contextPath}/users/signup_form.jsp">
									<button class="btn btn-secondary btn-sm">회원가입</button>
								</form>
							</div> --%>
							<%
							} else {
							%>
							<div class="login_nav_user">
								<a href=""><span>&nbsp;&nbsp;<%=id %> </span></a>님 안녕하세요.&nbsp;
	
								<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃&nbsp;&nbsp;</a>
								
							</div>
							
							<%-- <div class="user_info">
								<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>님<br><p>안녕하세요</p>
							</div>
							<div class="logout">	
								<a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-secondary btn-sm logout"> Logout </a>
							</div> --%>
							<%
							}
							%>
	
				</div>
			</div>
			
					
		<div class="screen">
			<img class="screen_img" src="https://post-phinf.pstatic.net/MjAyMjEwMjRfMTYy/MDAxNjY2NTUwMjk1ODg3.hRnyDmU_zUjFG_7TRwJ3qJ0_JlXFM5CMrrjngBbYkaEg.frIeOOorSFB0geSrJoh2MzTvSADa8uc4fWIpNCud3XIg.PNG/image.png" alt="WorldCup_Korea" />
		</div>
		<div class="board1"><strong>&nbsp;Talking Board</strong>
			<ul>
				<li>1번 글</li>
				<li>2번 글</li>
				<li>3번 글</li>
				<li>4번 글</li>
			</ul>
		</div>
		<div class="board2">news board
			<ul>
				<li>1번 글</li>
				<li>2번 글</li>
				<li>3번 글</li>
				<li>4번 글</li>
			</ul>
		</div>
		<div class="rank">Rank page
			<ul>
				<li>1등</li>
				<li>2등</li>
				<li>3등</li>
			</ul>
		</div>
		<div class="footer">foot</div>
	</div>

</body>
</html>