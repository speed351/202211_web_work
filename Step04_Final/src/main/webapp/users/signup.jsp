<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 id, pwd, email을 읽어온다.
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	//2. UserDto에 담는다
	UsersDto dto = new UsersDto();
	UsersDao dao = UsersDao.getInstance();
	
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//3. UserDao를 이용해서 DB에 저장하고
	boolean isSuccess = dao.insert(dto);
	//4. 결과를 응답한다.

	boolean isValid = dao.isValid(dto);
	if(isValid){
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		session.setMaxInactiveInterval(600);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<body>
	<div class="container">
	<%if(isSuccess){%>
		<h3>회원 가입 성공</h3>
		<a href="${pageContext.request.contextPath}/users/signup_form.jsp">회원 가입 페이지</a>
		<a href="${pageContext.request.contextPath}/index.jsp">메인 페이지</a>	
	
	<%}else{ %>
		<h3>회원 가입 실패</h3>
		<a href="${pageContext.request.contextPath}/users/signup_form.jsp">회원 가입 페이지</a>
		<a href="${pageContext.request.contextPath}/index.jsp">메인 페이지</a>	
	<%}%>
	</div>
	
</body>
</html>