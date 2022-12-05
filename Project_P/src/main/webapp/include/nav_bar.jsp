<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String) session.getAttribute("id");

%>
    
    <div class="header_bg"></div>
			<div class="header1">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.jsp"> 
						<img height="50px" src="https://digitalhub.fifa.com/transform/3a170b69-b0b5-4d0c-bca0-85880a60ea1a/World-Cup-logo-landscape-on-dark?io=transform:fill&quality=75" alt="" />
					</a>
				</div>
			</div>
			<div class="header2">
				<div class="nav_content">
						<a href="${pageContext.request.contextPath}/index.jsp"><span>홈</span></a>
						<a href="${pageContext.request.contextPath}/schedule/schedule.jsp"><span>일정</span></a>
						<a href="${pageContext.request.contextPath}/TalkBoard/list.jsp"><span>게시판</span></a>
						<a href="${pageContext.request.contextPath}/NewsBoard/list.jsp"><span>뉴스</span></a>
						<a href=""><span>영상</span></a>
				</div>
			</div>		
			<div class="header3">
				<div class="nav_user">
							<%
							if (id == null) {
							%>
							<button onclick="location.href='${pageContext.request.contextPath}/users/login_form.jsp'">LOG IN</button>
							<button onclick="location.href='${pageContext.request.contextPath}/users/signup_form.jsp'">SIGN-UP</button>
							
							
							
							<%-- <div class="sidebar_id_menu">
								<form class="login" action="${pageContext.request.contextPath}/users/login_form.jsp" method="post">
									<button class="btn btn-secondary btn-sm" type="submit">로그인</button>
								</form>
								<form class="signin" action="${pageContext.request.contextPath}/users/signup_form.jsp">
									<button class="btn btn-secondary btn-sm">회원가입</button>
								</form>
							</div> --%>
							<%
							} else {
							%>
							<div class="login_nav_user">
								<a href=""><span>&nbsp;&nbsp;<%=id %> </span></a>님 안녕하세요.&nbsp;
	
								<a href="${pageContext.request.contextPath}/users/logout.jsp">&nbsp;&nbsp;로그아웃</a>
								
							</div>
							
							<%-- <div class="user_info">
								<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>님<br><p>안녕하세요</p>
							</div>
							<div class="logout">	
								<a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-secondary btn-sm logout"> Logout </a>
							</div> --%>
							<%
							}
							%>
				</div>
			</div>