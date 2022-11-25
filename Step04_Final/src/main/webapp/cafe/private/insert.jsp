<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 내용을 추출해서
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//CafeDto에 담고
	CafeDto dto = new CafeDto();
	dto.setTitle(title);
	dto.setContent(content);
	//글 작성자는 로그인된 아이디
	String writer = (String)session.getAttribute("id");
	dto.setWriter(writer);
	//DB에 저장
	boolean isSuccess = CafeDao.getInstance().insert(dto);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="containter">
		<%if(isSuccess){ %>
			<p>
				새글을 저장했습니다.
				<a href="${pageContext.request.contextPath}/cafe/list.jsp">확인</a>
			</p>
		<%} else { %>
			<p>
				저장 실패
				<a href="${pageContext.request.contextPath}/cafe/list.jsp">확인</a>
			</p>
		<%} %>
	
	</div>
</body>
</html>