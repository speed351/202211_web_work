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

<body>
	<div class="container">
		<h1>비밀번호 수정 폼</h1>
		<jsp:include page="/include/nav_bar.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div>
				<label for="pwd">기존 비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
			</div>
			<div>
				<label for="newPwd">새 비밀번호</label>
				<input type="password" name="newPwd" id="newPwd" />
				<p class="error_msg"></p>
			</div>
			<div>
				<label for="newPwd2">새 비밀번호 확인</label>
				<input type="password" id="newPwd2" />
				<p class="error_msg"></p>
			</div>
			<button type="submit">수정하기</button>
			<button type="reset">리셋</button>
		</form>
	</div>
	<script>
		//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록
		document.querySelector("#myForm").addEventListener("submit", function(event){
			let pwd1 = document.querySelector("#newPwd").value;
			let pwd2 = document.querySelector("#newPwd2").value;
			//새 비밀번호와 확인값이 일치하지 않으면 폼제출을 막는다.
			if(pwd1 != pwd2){
				//폼 제출 막기
				alert("비밀번호 변경 실패");
				event.preventDefault();
				document.querySelector("#newPwd").style.color = "red";
				document.querySelector("#newPwd2").style.color = "red";
			}
			
		});
		
	</script>
</body>
</html>