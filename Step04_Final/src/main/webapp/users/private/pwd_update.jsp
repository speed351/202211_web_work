<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Session scope에서 수정할 회원의 아이디를 읽어온다
	String id = (String)session.getAttribute("id");
	//폼 전송되는 구 비밀번호, 새 비밀번호 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	
	//UsersDto에 객체에 위의 정보를 담고
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	
	/*
		위의 정보를 이용해서 DB를 업데이트하는 UsersDao에 메소드를 만들어보세요. 메소드명은 updatePwd()
		작업 성공여부를 리턴받아서 성공이면 로그아웃 처리를 하고 다시 로그인하는 링크를 출력하고
		실패하면 비밀번호가 일치하지 않는다는 메세지를 띄우고 다시 비밀번호 수정 폼으로 이동시킨다.
	*/
	boolean isSuccess = UsersDao.getInstance().updatePwd(dto);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){
		session.invalidate();
	%>
		<h3>비밀번호가 변경되었습니다.</h3>
		<a href="${pageContext.request.contextPath}/index.jsp">다시 로그인하기</a>

	<%}else{%>
		<h3>비밀번호 변경에 실패했습니다.</h3>
		<a href="${pageContext.request.contextPath}/index.jsp">비밀번호 다시 변경하기</a>
	<%}%>
	 
</body>
</html>