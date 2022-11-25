<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	
	CafeDto dto = CafeDao.getInstance().getData(num);
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().update(dto);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>수정에 성공했습니다.</p>
		<a href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum()%>">작성 글 확인</a>
	<%}else{ %>
		<p>수정에 실패했습니다.</p>
		<a href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum()%>">작성 글로 돌아가기</a>
	<%} %>
</body>
</html>