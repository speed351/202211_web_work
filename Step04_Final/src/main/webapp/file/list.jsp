<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다(로그인 하지 않았으면 null이다)
	String id = (String)session.getAttribute("id");

	//한페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	//보여줄 페이지의 번호를 일단1이라고 초기값 지정
	int pageNum = 1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum = request.getParameter("pageNum");
	//만약 페이지 번호가 넘어온다면
	if(strPageNum!=null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정
		pageNum = Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 RowNum
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum = 1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow = FileDao.getInstance().getCount();
	//전체 페이지의 갯수
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되어있다면 잘못된 값이므로 보정해준다
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount;
	}
	
	//FileDto 객체를 생성
	FileDto dto = new FileDto();
	//위에서 계산한 값을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//파일 목록을 select
	List<FileDto> list = FileDao.getInstance().getList(dto);
	

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
		<jsp:include page="/include/nav_bar.jsp">
			<jsp:param value="file" name="thisPage"/>
		</jsp:include>
			<div>
				<img class="title_image" src="https://www.wallpaperup.com/uploads/wallpapers/2015/01/19/590738/03184d055da164780a30798d345d4cfd-1000.jpg" alt="file" style="width:70%;"/>
			</div>
			<br>
		<table class="table table-striped" >
			<thead class="table table-dark">
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
		<nav>
			<ul class="pagination">
				<%if(startPageNum != 1){ %>
					<li class="page-item"><a href="list.jsp?pageNum=<%=startPageNum-1 %>" class="page-link">Prev</a></li>
				<%}%>
				
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<li class="page-item <%=pageNum==i ? "active" : ""%>"><a href="list.jsp?pageNum=<%=i%>" class="page-link"><%=i %></a></li>
				<%} %>
				<%if(endPageNum<totalPageCount) {%>
					<li class="page-item"><a href="list.jsp?pageNum=<%=endPageNum+1 %>" class="page-link" >Next</a></li>
				<%}%>
			</ul>
		</nav>
		
		
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
















