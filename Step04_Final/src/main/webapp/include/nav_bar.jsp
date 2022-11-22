<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String thisPage=request.getParameter("thisPage");
%>  
	<ul class="nav nav-pills">
		<li class="nav-item">
		<a class="nav-link <%=thisPage.equals("index") ? "active" : "" %>" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Home</a>
		</li>
		<li class="nav-item">
		<a class="nav-link <%=thisPage.equals("study") ? "active" : "" %>" aria-current="page" href="${pageContext.request.contextPath}/private/study.jsp">Study</a>
		</li>
		<li class="nav-item">
		<a class="nav-link <%=thisPage.equals("game") ? "active" : "" %>" href="${pageContext.request.contextPath}/private/game.jsp">Game</a>
		</li>
	</ul>