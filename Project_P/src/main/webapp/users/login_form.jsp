<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽기
	String id = request.getParameter("id");
	String url = request.getParameter("url");
	String loginFail = request.getParameter("loginFail");
	//값이 없다면
	if(url==null){
		//로그인 후에 인덱스로 이동
		String cPath=request.getContextPath();
		url = cPath+"/index.jsp";
	}
	if(id==null){
		id = "";
	}
	System.out.println(loginFail);
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
.container{
	display : grid;
	grid-template-rows : minmax(300px, auto) minmax(389px, auto) minmax(300px, auto);
	grid-template-columns : minmax(500px, auto);
	height : auto;
	align-items: center;
	gap : 10px;
	box-shadow: 0px 5px 20px 0px grey;
	border-right: thin;
	z-index:2;
}
.footer{
	height :100px;
}


</style>

<body>
	<div class="container" >
		<h3 style="text-align:center">로그인</h3>
		<div class="login_box">
			<form action="login.jsp" method="post">
				<!-- 로그인 성공 후 어디로 갈지에 대한 정보를 url이라는 파라미터 명으로 같이 전송되도록 한다. -->
				<input type="hidden" name="url" value="<%=url%>" />
				<div>
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" name="id" id="id" value="<%=id%>">
				</div>
				<br>
				<div>
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd">
					<div class="invalid-feedback">계정 정보를 확인하세요</div>
				</div>
				<br>
				<button class="btn btn-primary" type="submit">로그인</button>
				<button class="btn btn-success" type="" >
					<a href="signup_form.jsp" style="color:white; text-decoration:none;">회원가입</a>
				</button>
				<button class="btn btn-info" type="" >
					<a href="" style="color:white; text-decoration:none;">ID 찾기</a>
				</button>
				<button class="btn btn-info" type="" >
					<a href="" style="color:white; text-decoration:none;">비밀번호 찾기</a>
				</button>
				
			</form>
		</div>
		<div class="footer">
		
		</div>
		

	</div>


</body>
<script>
	if(<%=loginFail%>==0){
		document.querySelector("#id").classList.add("is-invalid");
		document.querySelector("#pwd").classList.add("is-invalid");
	}
</script>

</html>