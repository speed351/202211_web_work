<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.signup_box{
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
	width : 250px;
}
</style>
<body>
	<div class="main_container">
		<br>
		<h3 style="text-align:center">회원 가입</h3>
		<br>
		<jsp:include page="/include/nav_bar.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>
		<div class="signup_box">
			<form action="signup.jsp" method="post">
				<div>
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" name="id" id="id" />
				</div>
				<div>
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd" />
				</div>
				<div>
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" name="email" id="email" placeholder="aaa@bbb.com" />
				</div>
				<br>
				<button class="btn btn-primary" type="submit">가입</button>
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