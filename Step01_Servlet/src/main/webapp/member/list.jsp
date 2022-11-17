<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>member list</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<style>
</style>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<%
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "kim", "seoul"));
		list.add(new MemberDto(2, "lee", "busan"));
		list.add(new MemberDto(3, "park", "jeju"));
		int row_index = list.size();
		
	%>
	<table class="table" style="text-align:center; width:500px; border :solid;">
		<thead class="table-dark" >
			<th>NUM</th>
			<th>NAME</th>
			<th>ADDR</th>
		</thead>
	
		<%for(int i=0; i<row_index; i++) {%>
		<tr>
			<td><%out.print(list.get(i).getNum());%></td>
			<td><%out.print(list.get(i).getName());%></td>
			<td><%out.print(list.get(i).getAddr());%></td>
		</tr>
		<%} %>
	</table>
</body>
</html>
