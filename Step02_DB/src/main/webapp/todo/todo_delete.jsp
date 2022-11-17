<%@page import="test.todo.dao.todoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	todoDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<script>
			alert("<%=num%>번 할일 <%=content%>을 삭제했습니다");
			location.href="${pageContext.request.contextPath}/todo/todo_list.jsp";
		</script>
	</div>
</body>
</html>