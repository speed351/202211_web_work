<%@page import="test.todo.dao.todoDao"%>
<%@page import="test.todo.dto.todoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전동되는 수정할 회원 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));

	//2. MemberDao 객체를 이용해서 DB에 저장한다.
	//3. 응답한다.
	
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	todoDto dto = new todoDto(num, content, regdate);
	
	boolean isSuccess=todoDao.getInstance().update(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("<%=num%> 번 할 일을 수정했습니다.");
			location.href="todo_list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패");
			location.href="todo_updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>