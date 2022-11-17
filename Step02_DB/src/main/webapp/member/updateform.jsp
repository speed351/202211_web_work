<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. GET 방식 파라미터로 전달되는 수정할 회원의 번호(primary key) 를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 회원 한명의 정보를 얻어온다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	//3. 수정할 회원의 정보를 수정폼에 출력해서 응답한다.


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
</style>
<body>
<jsp:include page="/include/nav_bar.jsp"></jsp:include>
	<nav class="navbar navbar-expand-md bg-success navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
				<img src="https:/getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="Bootstrap" width="30" height="24">
				Acorn
			</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
    		    <div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">회원 목록 보기</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/todo/todo_list.jsp">할일 목록 보기</a>
						</li>
					</ul>
				</div>
		</div>
	</nav>


	<div class="container">
		<nav class="mt-2">
	        <ol class="breadcrumb">
	        	<li class="breadcrumb-item">
	        		<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
	        	</li>
	        	<li class="breadcrumb-item">
	        		<a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
	        	</li>
	        	<li class="breadcrumb-item active">회원 수정 페이지</li>
        	</ol>
	    </nav>
	
		<h1>회원 정보 수정 폼</h1>
		<form action="update.jsp" method="post" >
		<!-- 
			disable된 input 요소는 폼을 제출했을때 전송이 안되기 때문에
			input hidden 요소를 이용해 폼을 제출할때 제출되도록 한다.
		 -->
			<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
			<div>
				<label class="form-label" for="num">번호</label>
				<input class="form-control" type="text" name="num" id="num" value="<%=dto.getNum()%>" disabled/>
			</div>
			<div>
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName()%>"/>
			</div>
			<div>
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
			</div>
			<button class="btn btn-primary btn-sm" id="submit">수정 완료</button>
		</form>
		<form action="list.jsp">
			<button class="btn btn-danger btn-sm" id="reset" >취소</button>
		</form>
		

	</div>


</body>
</html>