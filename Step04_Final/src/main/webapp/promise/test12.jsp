<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>ajax 예제</h3>
	<form action="insert.jsp" methos="post" id="myForm">
		<input type="text" name ="name" placeholder="이름 입력..." />
		<input type="text" name ="addr" placeholder="주소 입력..." />
		
		<button id="submit">추가</button>
	</form>
	
	<script src="${pageContext.request.contextPath}/js/gura_util.js">
		document.querySelector("#myForm").addEventListener("submit",function(){
			//폼 제출 막기
			event.preventDefault();
			
			//gura_util.js에 있는 함수를 이용해서 폼에 입력한 내용을 ajax 요청을 통해 전송하기
			//this는 폼에 대한 참조값(= document.querySelector("#myForm"))
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);				
			});
		});
	
	</script>
</body>
</html>