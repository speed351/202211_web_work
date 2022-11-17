
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
<body>
<jsp:include page="/include/nav_bar.jsp"></jsp:include>
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