<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune.jsp</title>
</head>
<body>


<%
	String[] todayFortune = {
		"몸조심",
		"좋은날", 
		"로또 사라", 
		"연금복권 사라",
		"뭐 하려고 하지마"
	};

	Random ran = new Random();
	int num = ran.nextInt(1, 100);
	int rnum = ran.nextInt(0, 5);
	int rnum2 = ran.nextInt(0, 5);
	

%>
	
	
	<p>today's fortune 2 : <%= todayFortune[rnum] %> </p>
	<p>today's fortune 3 : <% out.print(todayFortune[rnum2]); %> </p>
	
	
</body>
</html>