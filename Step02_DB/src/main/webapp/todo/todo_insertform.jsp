
<%@page import="java.time.LocalDateTime"%>
<%@page import="test.todo.dto.todoDto"%>
<%@page import="test.todo.dao.todoDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	LocalDateTime now = LocalDateTime.now();
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY/MM/dd HH:mm:ss");
	String localTime = now.format(formatter);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	label{
		display : inline-block;
		width : 120px;
	}
	form{
		display: inline;
	}
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<body>
<jsp:include page="/include/nav_bar.jsp">
	<jsp:param value="todo" name="thisPage"/>
</jsp:include>
	<div class="container">
		<h1>할일 추가</h1>
		<form action="${pageContext.request.contextPath}/todo/todo_insert.jsp">
			<div>
				<label for="num">NUM</label>
				<input type="text" name="num" id="num" value="" disabled/>
			</div>
			
			<div>
				<label for="content">CONTENT</label>
				<input type="text" name="content" id="content" value=""/>
			</div>
			<div>
				<label for="regdate">REGISTER DATE</label>
				<input type="text" name="regdate" id="regdate" value="<%=localTime.subSequence(0, 16)%>" disabled/>
				<input type="hidden" name="regdate" id="regdate" value="<%=localTime%>"/>
			</div>
			<button id="submit">등록</button>		
		</form>
		<form action="todo_list.jsp">
			<button id="reset" >취소</button>
		</form>
		
	</div>

</body>
</html>