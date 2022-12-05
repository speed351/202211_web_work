<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_CSS.css" type="text/css" />
</head>
	<body>
		<div class="container container_board"  style="min-height: 700px;">
			<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage" />
			</jsp:include>		
		</div>	
	</body>

	<jsp:include page="/include/footer.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
</html>