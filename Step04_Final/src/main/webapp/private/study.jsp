<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 중인 아이디ㅏ 있는지 확인
	String id=(String)session.getAttribute("id");

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

<body>
	<div class="container">
		
		<jsp:include page="/include/nav_bar.jsp">
			<jsp:param value="study" name="thisPage"/>
		</jsp:include>
		<div>
			<img class="title_image" src="https://www.wallpaperup.com/uploads/wallpapers/2014/10/02/467044/6327d828d1a186d5253927c2a5145c94-1000.jpg" alt="study" style="width:70%;"/>
		</div>
		<br>
		<p><%=id %> 님 열심히 공부해요!</p>
	</div>
</body>
</html>