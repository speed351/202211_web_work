<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	request.setCharacterEncoding("utf-8");	
	//로그인 후 가야할 목적지 정보
	String url = request.getParameter("url");
	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비
	String encodedUrl = URLEncoder.encode(url);

	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 아이디, 비밀번호 읽어오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//2. DB에 실제로 존재하는 맞는 정보인지 확인(맞는 정보라면 로그인 처리도 한다)
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	UsersDao dao = UsersDao.getInstance();
	boolean isValid = dao.isValid(dto);
	
	if(isValid){
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		session.setMaxInactiveInterval(600);
	}
	
	
	
	//3. 응답
	
	
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
	<%if(isValid){ %>

		<h3>로그인 성공</h3>
		<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id%></a>님 안녕하세요.
		<a href="<%=url%>">이용하려던 페이지로 이동</a>
	<%}else{ %>
		<p class="alert alert-danger">
			<a href="${pageContext.request.contextPath}/users/login_form.jsp?url=<%=encodedUrl%>">다시 시도</a>
		</p>
		
	<%} %>

</body>
</html>