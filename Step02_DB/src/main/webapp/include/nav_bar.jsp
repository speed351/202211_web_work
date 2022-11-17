<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thisPage");
%>

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
							<a class="nav-link <%=thisPage.equals("member") ? "active" : "" %>" href="${pageContext.request.contextPath }/member/list.jsp">회원 목록 보기</a>
						</li>
						<li class="nav-item">
							<a class="nav-link <%=thisPage.equals("todo") ? "active" : "" %>" href="${pageContext.request.contextPath }/todo/todo_list.jsp">할일 목록 보기</a>
						</li>
					</ul>
				</div>
		</div>
	</nav>