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
						<a href="${pageContext.request.contextPath}/index.jsp"><span>Ȩ</span></a>
						<a href="${pageContext.request.contextPath}/schedule/schedule.jsp"><span>����</span></a>
						<a href="${pageContext.request.contextPath}/TalkBoard/list.jsp"><span>�Խ���</span></a>
						<a href="${pageContext.request.contextPath}/NewsBoard/list.jsp"><span>����</span></a>
						<a href=""><span>����</span></a>
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
									<button class="btn btn-secondary btn-sm" type="submit">�α���</button>
								</form>
								<form class="signin" action="${pageContext.request.contextPath}/users/signup_form.jsp">
									<button class="btn btn-secondary btn-sm">ȸ������</button>
								</form>
							</div> --%>
							<%
							} else {
							%>
							<div class="login_nav_user">
								<a href=""><span>&nbsp;&nbsp;<%=id %> </span></a>�� �ȳ��ϼ���.&nbsp;
	
								<a href="${pageContext.request.contextPath}/users/logout.jsp">&nbsp;&nbsp;�α׾ƿ�</a>
								
							</div>
							
							<%-- <div class="user_info">
								<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>��<br><p>�ȳ��ϼ���</p>
							</div>
							<div class="logout">	
								<a href="${pageContext.request.contextPath}/users/logout.jsp" class="btn btn-secondary btn-sm logout"> Logout </a>
							</div> --%>
							<%
							}
							%>
				</div>
			</div>