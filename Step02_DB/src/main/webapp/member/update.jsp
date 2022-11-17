<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전동되는 수정할 회원 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));

	//2. MemberDao 객체를 이용해서 DB에 저장한다.
	//3. 응답한다.
	
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	MemberDto dto = new MemberDto(num, name,addr);
	
	boolean isSuccess=MemberDao.getInstance().update(dto);
	
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
			alert("<%=num%> 번 회원 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패");
			location.href="updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>