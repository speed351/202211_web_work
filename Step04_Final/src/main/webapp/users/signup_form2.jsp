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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
					<small class="form-text text-muted">영문자 소문자로 시작하고 5~10글자 이내로 입력하세요.</small>
					<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
					<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
					
				</div>
				<div>
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd" />
					<small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
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
		
		//1. 입력한 id를 읽어와서
		const inputId = self.value;
		//아이디를 검증할 정규표현식
		const reg = /^[a-z][a-zA-Z0-9]{4,9}$/;
		//입력한 id가 정규표현식과 매칭되는지 확인
		const isMatch = reg.test(inputId);
		
		
		if(!isMatch){
			self.classList.add("is-invalid");
			isIdValid=false;
			return;
		};
		
		
		//아래의 코드를 jQuery로 변경해보세요
		
		//id가 email인 요소에 input 이벤트가 발생했을때 실행할 함수 등록
		$("#email").on("input", function(){   
		    $(this).removeClass("is-valid");
		    $(this).removeClass("is-invalid");
		   	//$(this)removeClass("is-valid is-invalid"); 로도 작성할 수 있다.
		    
		    //입력한 이메일
		    const inputEmail= $(this).val();
		    //이메일을 검증할 정규 표현식  
		    const reg=/@/;
			//만일 입력한 이메일이 정규표현식을 만족하지 않는다면
		    if(!reg.test(inputEmail)){
		       $(this).add("is-invalid");
		       isEmailValid=false;
		    }else{
		       $(this).add("is-valid");
		       isEmailValid = true;
		    }
		 });
	
		function checkPwd(){
			//먼저 2개의 클래스를 제거하고
			$("#pwd").removeClass("is-valid is-invalid");
			
			//입력한 두개의 비밀번호를 읽어와서
			const pwd = $("#pwd").val();
			const pwd2 = $("#pwd2").val();
			
			
			
			//만약 비밀번호 입력란과 확인란이 다르다면
			if(pwd !=pwd2){
				$("#pwd").addClass("is-valid");
				isPwdValid=false;
			}else{
				$("#pwd").addClass("is-valid")
				$("#pwd2").addClass("is-valid")
				isPwdValid=true;
			}
		}
		
		
		$("#pwd, #pwd2").on("input", function(){ //콤마를 사용해서 다중선택 가능   
			checkPwd();
		});
		/* $("#pwd2").on("input", function(){   
			checkPwd();
		}); */
	
		//id를 입력할 때 마다 호출되는 합수 등록
		$("#id").on("input", function(){
			//input 요소의 참조값을 self에 미리 담아놓기
			const self=this;
			
			//2개의 클래스를 모두 제거한다음
			$(self).removeClass("is-valid is-invalid");
			
			//1. 입력한 id를 읽어와서
			const inputId = $(self).val();
			
			//2. 서버에 페이지 전환 없이 전송을하고 응답을 받는다.
			$.ajax({
				url:"checkid.jsp?inputId="+inputId,
				success:function(data){
					console.log(data);
					//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거 한다.
					if(!data.isExist){
						$(self).addClass("is-invalid");
						isIdValid=false;
					}else{
						$(self).addClass("is-valid");
						isIdValid=true;
					}
                }
			});
		});
		
		//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
		$("#signupForm").on("submit", function(){
			const isFormValid = isIdValid && isPwdValid && isEmailValid;
			if(!isFormValid){
				//아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행하도록 해야한다.
				return false;	//폼 전송 막기(jQuery에서 submit 막는 방법)	
			}
			
		});
	</script>

</body>
</html>