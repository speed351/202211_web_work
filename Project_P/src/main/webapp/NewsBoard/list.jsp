<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인된 아이디를 읽어온다(로그인 하지 않았으면 null이다)
	String id = (String)session.getAttribute("id");


	//한페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT = 5;
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
	int totalRow = BoardDao.getInstance().getCount();
	//전체 페이지의 갯수
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되어있다면 잘못된 값이므로 보정해준다
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount;
	}
	
	//CafeDto 객체를 생성
	BoardDto dto = new BoardDto();
	//위에서 계산한 값을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	

	//글 목록 얻어오기
	List<BoardDto> list = BoardDao.getInstance().getList(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_CSS.css" type="text/css" />
</head>
	<body>

	
		<div class="container container_board" style="min-height: 700px;">
			<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage" />
			</jsp:include>		
			<div class="board_b">
				<table class="table table-striped">
					
					<thead class="table table-dark">
						<tr>
							<th style="width:100px; text-align : center;">No.</th>
							<th style="width:700px;">제목</th>
							<th style="text-align : center;">작성자</th>
							<th style="text-align : center;">조회수</th>
							<th style="text-align : center;">작성일</th>
						</tr>				
					</thead>
					<tbody>
						<%
						for(BoardDto tmp:list ){
						%>
							<tr>
								<td style="width:100px; text-align : center;"><%=tmp.getNum() %></td>
								<td style="width:700px;">
									<a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a>
								</td>
								<td style="text-align : center;"><%=tmp.getWriter() %></td>
								<td style="text-align : center;"><%=tmp.getViewCount() %></td>
								<td style="text-align : center;"><%=tmp.getRegdate() %></td>
							</tr>				
						<%} %>
					</tbody>
				</table>
			</div>
			<div class="board_f">
				<nav style="display:inline;">
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

			</div>
			
		</div>		
		
	</body>

	<jsp:include page="/include/footer.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
</html>