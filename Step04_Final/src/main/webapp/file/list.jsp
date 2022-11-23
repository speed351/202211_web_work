<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//로그인된 아이디를 읽어온다(로그인 하지 않았으면 null이다)
	String id = (String)session.getAttribute("id");
	//파일 목록을 얻어와서
	List<FileDto> list = FileDao.getInstance().getList();

	//응답하기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<body>
	<div class="container">
		<h3>자료실 목록 보기</h3>
		<jsp:include page="/include/nav_bar.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td><%=tmp.getTitle()%></td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName()%></a>							
						</td>
						<td><%=tmp.getFileSize()%></td>
						<td><%=tmp.getRegdate()%></td>
						<td>
							<%-- 글 작성자가 로그인된 아이디와 같을때만 삭제 링크를 제공한다. 
							반대로 로그인된 아이디를 작성자와 비교하면 nullpoint exception이 발생할 수 있으므로 조심 --%>
							<%if(tmp.getWriter().equals(id)){ %>
								<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
							<%} %>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete = confirm("삭제 하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
			
		}
	</script>
</body>
</html>
















