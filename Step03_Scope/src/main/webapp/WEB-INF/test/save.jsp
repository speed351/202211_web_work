<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String nick=request.getParameter("nick");
	
	//session scope�� nick�̶�� Ű �� �����ϱ�
	session.setAttribute("nick", nick);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p> <strong><%=nick %></strong>�̶�� �г����� �����մϴ�.</p>
	<p>30�е��� �ƹ��� ��û�� ���� �ʰų� �� �������� ������ �ڵ� �����˴ϴ�.</p>
	<a href="../index.jsp">�ε����� �̵��ϱ�</a>
</body>
</html>