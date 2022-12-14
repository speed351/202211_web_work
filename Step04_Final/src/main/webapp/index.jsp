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
form {
	display: inline;
}


h5, p, a {
	display: inline;
}
</style>

<body>

	<div class="container">
			<div>
				<img class="title_image" src="https://post-phinf.pstatic.net/MjAyMjEwMjRfMTYy/MDAxNjY2NTUwMjk1ODg3.hRnyDmU_zUjFG_7TRwJ3qJ0_JlXFM5CMrrjngBbYkaEg.frIeOOorSFB0geSrJoh2MzTvSADa8uc4fWIpNCud3XIg.PNG/image.png" alt="index" style="width:110%"/>
			</div>
		<div class="content">
			<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage" />
			</jsp:include>

		</div>
	</div>
		<jsp:include page="/include/footer.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>

		<jsp:include page="/include/ad.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>	


</body>
</html>