<%@page import="test.todo.dao.todoDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="test.todo.dto.todoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate"); // yyyy/MM/dd


	todoDto dto = new todoDto();
	dto.setContent(content);
	dto.setDate(regdate);
	
	todoDao dao = todoDao.getInstance();
	
	boolean isSuccess=dao.insert(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				<strong>할일 <%=content %>을 추가했습니다.</strong>
				<br />
				<a href="${pageContext.request.contextPath }/todo/todo_list.jsp">할일 목록으로 돌아가기</a>
				<br />
				<a href="${pageContext.request.contextPath }/todo/todo_insertform.jsp">다른 할일 추가하기</a>
			</p>
		<%}else{ %>
			<p>
				할일 추가에 실패했습니다. <%=regdate %>
				<br />
				<a href="${pageContext.request.contextPath }/todo/todo_list.jsp">할일 목록으로 돌아가기</a>
				<br />
				<a href="${pageContext.request.contextPath }/todo/todo_insertform.jsp">다른 할일 추가하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>