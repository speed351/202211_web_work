<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽기
	String url = request.getParameter("url");
	//값이 없다면
	if(url==null){
		//로그인 후에 인덱스로 이동
		String cPath=request.getContextPath();
		url = cPath+"/index.jsp";
	}
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
.login_box{
	position : absoulte;
	border-style : solid;
	border-color : #ced4da;
	border-radius : 5px;
	width : 500px;
	height : 300px;
	padding : 30px;
	background-color : white;
    margin: auto;
}
.form-control{
	width : 430px;
}
</style>
<body>
	<jsp:include page="/include/nav_bar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	<div class="main_container" >
		<br>
		<h3 style="text-align:center">로그인</h3>
		<br>

		<div class="login_box">
			<form action="login.jsp" method="post">
				<!-- 로그인 성공 후 어디로 갈지에 대한 정보를 url이라는 파라미터 명으로 같이 전송되도록 한다. -->
				<input type="hidden" name="url" value="<%=url%>" />
				<div>
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" name="id" id="id">
				</div>
				<br>
				<div>
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd">
				</div>
				<br>
				<button class="btn btn-primary" type="submit">로그인</button>
			</form>
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