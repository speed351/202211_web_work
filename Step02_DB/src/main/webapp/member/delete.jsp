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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
			<p>
				<strong><%=name %></strong>의 회원정보를 추가했습니다.
				<br />
				<a href="${pageContext.request.contextPath }/member/list.jsp">회원정보로 돌아가기</a>
				<br />
				<a href="${pageContext.request.contextPath }/member/insertform.jsp">다른 회원정보 추가</a>
			</p>

	</div>
</html>