<%@page import="test.todo.dao.todoDao"%>
<%@page import="test.todo.dto.todoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 수정할 회원의 번호(primary key) 를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 회원 한명의 정보를 얻어온다.
	todoDto dto=todoDao.getInstance().getData(num);
	//3. 수정할 회원의 정보를 수정폼에 출력해서 응답한다.


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	form{
		display:inline;
	}
</style>
<body>
<jsp:include page="/include/nav_bar.jsp"></jsp:include>
	<div class="container">
		<h1>회원 정보 수정 폼</h1>
		<form action="todo_update.jsp" method="post" >
		<!-- 
			disable된 input 요소는 폼을 제출했을때 전송이 안되기 때문에
			input hidden 요소를 이용해 폼을 제출할때 제출되도록 한다.
		 -->
			<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum()%>" disabled/>
			</div>
			<div>
				<label for="name">할 일</label>
				<input type="text" name="content" id="content" value="<%=dto.getContent()%>"/>
			</div>
			<div>
				<label for="regdate">등록일</label>
				<input type="text" name="regdate" id="regdate" value="<%=dto.getDate().substring(0, 16)%>" disabled />
				<input type="hidden" name="regdate" id="regdate" value="<%=dto.getDate().substring(0, 16)%>" />
			</div>
			<button id="submit">수정 완료</button>
		</form>
		<form action="todo_list.jsp">
			<button id="reset" >취소</button>
		</form>
		

	</div>
</body>
</html>