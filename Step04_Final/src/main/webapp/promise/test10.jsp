<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메세지 입력..." />
	<button id="sendBtn">전송</button>
	
	<script>
		/*
			input 요소에 문자열을 입력하고 전송버튼을 누르면 입력한 무자열이 send.jsp 페이지로 전송이 되도록 한다
			단, 페이지 전환없이 
		*/
		
		let result1;
		let result2;
		let result3;
		
		
		document.querySelector("#sendBtn").addEventListener("click", function(){
			let msg = document.querySelector("#msg").value;
			
			fetch("send.jsp?msg="+msg)
			.then(function(response){
				console.log(response);
				return response.text();
			})
			.then(function(data){
				console.log(data);
				result1=data;
				result2=JSON.parse(data);
				result3 = JSON.stringify(result2);
			});
		});
	</script>
</body>
</html>