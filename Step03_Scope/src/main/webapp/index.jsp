<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head> 
<body>
	<div class="container">
	<h1>������ � �ε��� ������</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/fortune">� ����</a></li>
			<li><a href="${pageContext.request.contextPath }/member">��� ����</a></li>
			<li><a href="${pageContext.request.contextPath }/friend/list">ģ�� ��� ����</a></li>
			<li><a href="test/play.jsp">�����</a></li>
		</ul>
	</div>
	<form action="${pageContext.request.contextPath }/test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="�г��� �Է�..."/>
		<button type="submit">����</button>
	</form>
	<form action="${pageContext.request.contextPath }/test/save" method="post">
		<input type="text" name="nick" placeholder="�г��� �Է�..."/>
		<button type="submit">����(Servlet)</button>
	</form>
</body>
</html>