<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.todoDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.todo.dao.todoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	todoDto dto = new todoDto();
	todoDao dao = todoDao.getInstance();
	List<todoDto> list = dao.getList();

	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo_list</title>
</head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style>
	form{
		display: inline;
	}
</style>
<body>
<jsp:include page="/include/nav_bar.jsp">
	<jsp:param value="todo" name="thisPage"/>
</jsp:include>



	<div class="container">
		<h1>할일 목록</h1>

		<table class="table">
			<thead class="table-primary">
				<tr>
					<th>No</th>
					<th>할일</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
					
				</tr>
			</thead>
			<tbody class="table-light">
				<%for(todoDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getDate().substring(0, 16)%></td>
						<td><a href="todo_updateform.jsp?num=<%=tmp.getNum()%>&content=<%=tmp.getContent()%>&regdate=<%=tmp.getDate()%>">수정</a></td>
						<td><a href="todo_delete.jsp?num=<%=tmp.getNum()%>&content=<%=tmp.getContent()%>&regdate=<%=tmp.getDate()%>">삭제</a></td>					
					</tr>			
				<%} %>
			</tbody>
		</table>
		<form action="../">
			<button>이전 페이지로</button>
		</form>
		<form action="todo_insertform.jsp">
			<button>할일 추가</button>
		</form>
		
	</div>
</body>
</html>