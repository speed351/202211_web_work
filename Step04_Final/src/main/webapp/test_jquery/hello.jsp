<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js">

</script>
</head>
<body>
	<h3>jquery 테스트</h3>
	<p id="one"></p>
	<p id="two"></p>
	<div>div1</div>
	<div>div2</div>
	<div>blackpink</div>
	<div>div4</div>
	<div>div5</div>
	<input type="text" id="inputMsg" placeholder="입력해주세요.."/>
	<button id="sendBrn">전송</button>
	
	
	<script>
		
		//위의 모든 div의 값의 innerText를 바꾸려면?
/* 		const divs = document.querySelectorAll("div");
		
		for(let i= 0; i<divs.length;i++){
			divs[i].innerText="kim"
		} */
		$("#sendBtn").on("click",function(){
		 
		});

		
		
		/*
			$("선택자").action1().action2()와 같은 형태로 jQuery를 사용한다.
			
			$() 함수는 jQuery의 기능이 추가된 배열을 리턴한다.
			
			$() 함수가 리턴하는 배열에는 "선택자"에 부합하는 문서객체(body, p, div, input 등 )의 참조값이 들어있다.
			
			$().action()처럼 특정 동작을 하면 $()함수가 리턴한 배열안에 들어있는 모든 문서객체에 동작이 적용된다.
			
			$().action1().action2()... 처럼 chain 형태의 동작은 가능할 때도 있고, 아닐때도 있다.
			만일 어떤 동작이 무언가를 읽어오는 동작이면 뒤에 chain형태의 동작은 불가능하다.
		*/
		
		//id가 one인 요소의 innerText를 "kim", 글자색을 blue로 조작하디
		$("#one").text("kim").css("color","blue");
		
		//id가 two인 요소의 innerText를 여러분의 이름, 글자의 크기를 20px, 배경색을 yellow로 지정하세요 
		$("#two").text("park").css("background-color","yellow").css("font-size","20px");
		
		//모든 div 요소를 pink로 바꾸기
		$("div").css("color","pink").css("background-color","black").css("text-align","center");
		
		//이벤트 리스너 함수 등록하는방법
		$("#sendBtn").on("click",function(){
			//아이디가 inputMsg인 곳에 입력한 값을 msg에 담는다
			const msg=$("#inputMsg").val();
			alert(msg+"를 전송합니다.");
		});

		
	</script>
</body>
</html>