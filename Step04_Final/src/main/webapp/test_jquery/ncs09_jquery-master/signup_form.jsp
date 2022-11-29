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
	position : relative;
	border-style : solid;
	border-color : #ced4da;
	border-radius : 5px;
	width : 500px;
	height : 500px;
	padding : 30px;
	background-color : white;
    margin: auto;
}
.form-control{
	width : 430px;
}
.submit_Btn{
	position:absolute;
	bottom : 20px;
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
			<form action="signup.jsp" method="post" id="signupForm">
				<div>
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" name="id" id="id" />
					<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
					<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
					
				</div>
				<div>
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd" />
					<div class="invalid-feedback">비밀번호를 확인하세요</div>
				</div>
				<div>
					<label class="control-label" for="pwd2">비밀번호 확인</label>
					<input class="form-control" type="password" name="pwd2" id="pwd2" />
					<div class="invalid-feedback">비밀번호를 확인하세요</div>
				</div>
				<div>
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" name="email" id="email" placeholder="aaa@bbb.com" />
					<div class="invalid-feedback">이메일 형식에 맞게 입력하세요</div>
				</div>
				<br>
				<button class="btn btn-primary submit_Btn" type="submit">가입</button>
			</form>
		</div>
	</div>
		<jsp:include page="/include/footer.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>

		<jsp:include page="/include/ad.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>	


	<script>
		//유효성 여부 저장할 변수를 만들고 초기값 대입
		let isIdValid = false;
		let isPwdValid = false;
		let isEmailValid = false;
		
		
		document.querySelector("#email").addEventListener("input", function(){
		    
		    this.classList.remove("is-valid");
		    this.classList.remove("is-invalid");
		    //입력한 이메일
		    const inputEmail=this.value;
		    //이메일을 검증할 정규 표현식  
		    const reg=/@/;
			//만일 입력한 이메일이 정규표현식을 만족하지 않는다면
		    if(!reg.test(inputEmail)){
		       this.classList.add("is-invalid");
		       isEmailValid=false;
		    }else{
		       this.classList.add("is-valid");
		       isEmailValid = true;
		    }
		 });
	
		function checkPwd(){
			//먼저 2개의 클래스를 제거하고
			document.querySelector("#pwd").classList.remove("is-valid");
			document.querySelector("#pwd").classList.remove("is-invalid");
			//입력한 두개의 비밀번호를 읽어와서
			const pwd = document.querySelector("#pwd").value;
			const pwd2 = document.querySelector("#pwd2").value;
			
			//만약 비밀번호 입력란과 확인란이 다르다면
			if(pwd !=pwd2){
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdValid=false;
			}else{
				document.querySelector("#pwd").classList.add("is-valid");
				document.querySelector("#pwd2").classList.add("is-valid");
				isPwdValid=true;
			}
		}
		document.querySelector("#pwd").addEventListener("input", function(){
			checkPwd();
		});
		document.querySelector("#pwd2").addEventListener("input", function(){
			checkPwd();
		});
	
		//id를 입력할 때 마다 호출되는 합수 등록
		document.querySelector("#id").addEventListener("input", function(){
			//input 요소의 참조값을 self에 미리 담아놓기
			const self=this;
			//2개의 클래스를 모두 제거한다음
			self.classList.remove("is-valid");
			self.classList.remove("is-invalid");
			
			
			//1. 입력한 id를 읽어와서
			const inputId = this.value;
			//2. 서버에 페이지 전환 없이 전송을하고 응답을 받는다.
			fetch("checkid.jsp?inputId="+inputId)
			.then(function(response){
				console.log(response)
				return response.json();
			})
			.then(function(data){
				console.log(data);
				if(!data.isExist){
					self.classList.add("is-invalid");
					isIdValid=false;
				}else{
					self.classList.add("is-valid");
					isIdValid=true;
				}
			})
			
			//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거 한다.
		});
		
		//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
		document.querySelector("#signupForm").addEventListener("submit", function(event){
			const isFormValid = isIdValid && isPwdValid && isEmailValid;
			if(!isFormValid){
				//아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행하도록 해야한다.
				event.preventDefault();	//폼 전송 막기	
			}
			
		});
	</script>

</body>
</html>