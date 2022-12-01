<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				"header header header"
				"screen screen screen"
				"board1 board1 rank"
				"board2 board2 rank"
				"footer footer footer";
	grid-template-rows : 50px;
	align-content: center;
	gap : 10px;
	box-shadow: 0px 5px 20px 0px grey;
	border-right: thin;
	z-index:2;
}
.header{
	grid-area : header;
	background-color : #802045;
	position : fixed;
	width : 1841px;
	left : 0px;
}
.logo{
    position: relative;
    left: 300px;
}
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
.nav_content{
	position:relative;
	display : inline;
	left : 20px;
	top : 5px;
}
.nav_content>a{
	font-size: 25px;
	color: #FAECC5;
	text-decoration: none;
	margin : 20px;
	font-family: 'Jua', sans-serif;
}
.nav_user{
    position: fixed;
    right: 330px;
    top: 10px;
	display : inline;
	text-decoration: none;
	border : solid white;
	border-radius : 5px;
	background-color : #FAECC5;
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
}
.footer{
	grid-area : footer;
	height :150px;
}
.screen_img{
	width : 1296px;
	
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="logo">
				<img height="50px" src="https://digitalhub.fifa.com/transform/3a170b69-b0b5-4d0c-bca0-85880a60ea1a/World-Cup-logo-landscape-on-dark?io=transform:fill&quality=75" alt="" />
					<div class="nav_content">
						<a href=""><span>홈</span></a>
						<a href=""><span>일정</span></a>
						<a href=""><span>게시판</span></a>
						<a href=""><span>뉴스</span></a>
						<a href=""><span>순위</span></a>
					</div>
					
					<div class="nav_user">
						
						<a href=""><span>&nbsp;&nbsp;A </span></a>님 안녕하세요.&nbsp;
						<a href="">로그아웃&nbsp;&nbsp;</a>
					</div>
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