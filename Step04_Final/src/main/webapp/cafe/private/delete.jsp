<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호
	int num = Integer.parseInt(request.getParameter("num"));
	//DB에서 삭제하기
	boolean isSuccess = CafeDao.getInstance().delete(num);
	
	//글의 작성자가 로그인한 아이디와 같은지 확인해보기
	String id = (String)session.getAttribute("id");
	String writer=CafeDao.getInstance().getData(num).getWriter();
	//작성자가 로그인한 아이디와 다르면
	
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 글 삭제하기 없기!");
		return;
	}


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(isSuccess){
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/cafe/list.jsp");
	}else{
	%>
		<script>alert("삭제 실패");</script>
	<%
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/cafe/list.jsp");	
	}
	
	%>
</body>
</html>