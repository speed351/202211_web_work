<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		/*
			HttpSession ��ü�� "nick"�̶�� Ű������ ����� ���� �ִ��� �о�ͺ���, ������ null ����
			(session scope�� "nick"�̶�� Ű������ ����� ���ڿ��� �ִ��� �о�� ����.)
			
		*/
		String nick=(String)session.getAttribute("nick");
	
		//60�ʰ� �ٽ� ��û�ؿ��� ������ �����ϵ��� ����
		session.setMaxInactiveInterval(60);
	
		
	%>
	<h3>��� ������ �Դϴ�</h3>
	<%if(nick==null){ %>
		<p>session ����(scope)�� "nick"�̶�� Ű������ ����� ���� �����ϴ�.</p>
	<%}else{ %>
		<p>
			<strong><%=nick %></strong> �� ����̱���. ��ٰ�����.
			<a href="logout.jsp">���ǿ� ����� nick ����(�α׾ƿ�)</a>		
		</p>
	<%} %>
</body>
</html>