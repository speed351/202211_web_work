<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String nick=request.getParameter("nick");
		
	%>
	<p> <strong><%=nick %></strong>�̶�� �г����� �����մϴ�.</p>
	<p>30�е��� �ƹ��� ��û�� ���� �ʰų� �� �������� ������ �ڵ� �����˴ϴ�.</p>
	<a href="../index.jsp">�ε����� �̵��ϱ�</a>
</body>
</html>