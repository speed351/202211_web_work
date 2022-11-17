<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 회원 한명의 정보 삭제하기(몇번 회원의 정보를 삭제할까)
	//GET 방식 파라미터로 전달되는 삭제할 회원정보를 읽어와서 숫자로 바꾸기
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	MemberDao.getInstance().delete(num);
	//MemberDao 객체를 이용해서 삭제하고, 성공 여부를 리턴한다
	//2. 응답하기(무슨응답을 할까)
	
	/*
		요청을 한 클라이언트의 웹브라우저에게 새로운 경로로 요청을 다시하라고 강요하는 응답을
		HttpServletResponse 객체를 통해서 할 수 있다.
		이것이 바로 리다이렉트 응답이고, 이 기능은 새로운 경로로 요청을 다시하라고 강요"하는 기능
	*/
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/list.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

	</div>
</body>
</html>