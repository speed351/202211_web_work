<%@page import="java.util.List"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	
	//로그인 후 가야할 목적지 정보
	String url = request.getParameter("url");
	
	if (url == null) {
		//로그인 후에 인덱스로 이동
		String cPath = request.getContextPath();
		url = cPath + "/index.jsp";
	} else {
	
		//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비
		String encodedUrl = URLEncoder.encode(url);
	}
	
	String thisPage = request.getParameter("thisPage");
	
	

	//글 목록 받아오기
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
<title>index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_CSS.css" type="text/css" />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

</head>
<body>
	<div class="container">
		<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage" />
		</jsp:include>	
		<div class="screen">
			<div class="crop_img">
				<img class="screen_img" src="https://post-phinf.pstatic.net/MjAyMjEwMjRfMTYy/MDAxNjY2NTUwMjk1ODg3.hRnyDmU_zUjFG_7TRwJ3qJ0_JlXFM5CMrrjngBbYkaEg.frIeOOorSFB0geSrJoh2MzTvSADa8uc4fWIpNCud3XIg.PNG/image.png" alt="WorldCup_Korea" />
			</div>
		</div>
		<div class="board1">
			<div class="board_title">
				<a href="${pageContext.request.contextPath}/TalkBoard/list.jsp" style="text-decoration : none;">
					<strong>&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
						  <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
						  <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
						</svg>
						Talking Board
					</strong>
				</a>
			</div>
			<div class="board_content"  >
			<hr style="margin:5px; color:#00ff0000" />
				<ul>
			
				
				<%
					for(BoardDto tmp:list ){
					%>
						<%if(tmp==null){ %>
	
								<li>1</li>
								
						<%}else{ %>
								<li>
									<a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a>
								</li>	
						<%} %>
					<%} %>
				</ul>
			</div>
		</div>
		<div class="board2">
			<div class="board_title" >
				<a href="${pageContext.request.contextPath}/NewsBoard/list.jsp" style="text-decoration : none;">
					<strong>&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-newspaper" viewBox="0 0 16 16">
						  <path d="M0 2.5A1.5 1.5 0 0 1 1.5 1h11A1.5 1.5 0 0 1 14 2.5v10.528c0 .3-.05.654-.238.972h.738a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 1 1 0v9a1.5 1.5 0 0 1-1.5 1.5H1.497A1.497 1.497 0 0 1 0 13.5v-11zM12 14c.37 0 .654-.211.853-.441.092-.106.147-.279.147-.531V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v11c0 .278.223.5.497.5H12z"/>
						  <path d="M2 3h10v2H2V3zm0 3h4v3H2V6zm0 4h4v1H2v-1zm0 2h4v1H2v-1zm5-6h2v1H7V6zm3 0h2v1h-2V6zM7 8h2v1H7V8zm3 0h2v1h-2V8zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1z"/>
						</svg>
						News board
					</strong>
				</a>
			</div>
			
			<div class="board_content">
			<hr style="margin:5px; color:#00ff0000" />
				<ul>
					<li>1번 글</li>
					<li>2번 글</li>
					<li>3번 글</li>
					<li>4번 글</li>
					<li>5번 글</li>
				</ul>
			</div>
		</div>
		<div class="rank">
			<div class="board_title" style="position:relative;">
				<a href="${pageContext.request.contextPath}/Ranking/rank.jsp" style="text-decoration : none;">
					<strong>&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
			  				<path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
						</svg>				
						Rank Page
					</strong>
				</a>
			</div>
			<div class="board_content" >
				<div class="rank_type" style="display:inline;">
					
					<input type="radio" id="goal" name="rank_tab" checked/>
					<label class="label_goal" for="goal">득점</label>
					<input type="radio" id="assist" name="rank_tab" />
					<label class="label_assist" for="assist">도움</label>
					
					<section id="goal_content">
						<ul>
							<li>득점 1등</li>
							<li>득점 2등</li>
							<li>득점 3등</li>
						</ul>
					</section>
					<section id="assist_content">
						<ul>
							<li>어시 1등</li>
							<li>어시 2등</li>
							<li>어시 3등</li>
						</ul>
					</section>
				</div>
			</div>
		</div>


	</div>

</body>

		<jsp:include page="/include/footer.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>
</html>