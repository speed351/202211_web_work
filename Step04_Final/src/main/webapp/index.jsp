<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");


	//로그인 후 가야할 목적지 정보
	String url = request.getParameter("url");
	
	if(url==null){
		//로그인 후에 인덱스로 이동
		String cPath=request.getContextPath();
		url = cPath+"/index.jsp";
	}else{

		//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비
		String encodedUrl = URLEncoder.encode(url);
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
<style>
	form{
		display:inline;
	}
	div{
		margin-bottom: 5px;
	}
	h5, p, a{
		display:inline;
		
	}
	
</style>

<body>

	<div class="container">
		<h3>인덱스 페이지</h3>
		<div class="content">
			<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage"/>
			</jsp:include>
			<%
			if(id==null){
			%>
			
				<form action="${pageContext.request.contextPath}/users/login.jsp" method="post">
					<input type="hidden" name="url" value="<%=url%>" />
					<div>
						<label class="control-label" for="id">아이디</label>
						<input class="form-control" type="text" name="id" id="id" />
					</div>
					<div>
						<label class="control-label" for="pwd">비밀번호</label>
						<input class="form-control" type="password" name="pwd" id="pwd" />
					</div>
					<button type="submit">로그인</button>
				</form>
				<form action="${pageContext.request.contextPath}/users/signup_form.jsp">
					<button>회원가입</button>
				</form>
			
			<%} else { %>
				<p>안녕하세요</p>
				<div class="user_menu" style="float:right; display:inline">
					<div class="card" style="width: 20rem;">
						<img src="https://images.indianexpress.com/2022/10/Lionel-Messi.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><a href="${pageContext.request.contextPath}/private/info.jsp"><%=id %></a></h5>
								
								<p>님 안녕하세요.</p><br>
								<p class="card-text">여러 컨텐츠를 즐겨보세요.</p>
								<br>
								<a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-primary" style="position:relative; bottom:40px; left:210px;"> Logout </a>
							</div>
					</div>
					
					
					
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
	                	<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
	                	<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
	                </svg>
					<a href="${pageContext.request.contextPath}/private/info.jsp"><%=id%></a>님 안녕하세요.
					
					<form class="btn" action="${pageContext.request.contextPath}/users/logout.jsp">
						<button>로그아웃</button>
					</form>
				</div>
			
			<%}%>
				<br>
				<br>


		</div>
	</div>
	
</body>
</html>