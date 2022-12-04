<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_CSS.css" type="text/css" />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container_board container">
		<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage" />
		</jsp:include>
		
		<div class="board_h">
		<br>
			<h3 style="text-align:center;">다음 경기 일정</h3>
		</div>
		
		<div class="boardb" style="text-align:center; grid-column-start:1; grid-column-end:2;">
			<!-- 경기 카드 이미지 -->
			<div class="card" style="width:78%; margin-left: 30%">
			  <img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/FRA?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">프랑스</h5>
			    <p class="card-text">피파 랭킹 : <strong style="color:red;">4위</strong></p>
			    <p class="card-text">감독 : <strong style="color:red;">디디에 데샹</strong></p>
			    <p class="card-text">키 플레이어 : <strong style="color:red;">킬리안 음바페</strong></p>
			    <a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4481" class="btn btn-primary">자세히 보기</a>
			  </div>
			</div>
		</div>
		<div class="boardb" style="text-align:center;grid-column-start:2; grid-column-end:3;">
			<h3 >VS</h3>
		</div>
		
		<div class="boardb" style="text-align:center;grid-column-start:3; grid-column-end:4;">
			<!-- 경기 카드 이미지 -->
			<div class="card" style="width:70%;">
			  <img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/POL?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">폴란드</h5>
			    <p class="card-text">피파 랭킹 : <strong style="color:red;">26위</strong></p>
			    <p class="card-text">감독 : <strong style="color:red;">체스와프 미흐네비츠</strong></p>
			    <p class="card-text">키 플레이어 : <strong style="color:red;">로베르트 레반도프스키</strong></p>
			    <a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4703" class="btn btn-primary">자세히 보기</a>
			  </div>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br>	
		<div class="board_f"  style="text-align:center; grid-column-start:1; grid-column-end:2; display: inline-flex; position:relative; left:30%; bottom: -100%;height: 100px;">
		 	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4713"><img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/ENG?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="..." style="width:30%; position: absolute; border: 1px solid;"></a>
			<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4739"><img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/SEN?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="..." style="width:30%; left: 100px; position: absolute; border: 1px solid;""></a>
			<br>
			<h5 style="position: absolute; bottom:0%; left: 5%;">2022.12.05 04:00</h5>
		</div>
		<div class="board_f"  style="text-align:center; grid-column-start:2; grid-column-end:3; display: inline-flex; position:relative; left:30%; bottom: -100%;height: 100px;">
		 	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=6736"><img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/JPN?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="..." style="width:23.7%; position: absolute; border: 1px solid;"></a>
			<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4715"><img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/CRO?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="..." style="width:23.7%; left: 100px; position: absolute; border: 1px solid;""></a>
			<br>
			<h5 style="position: absolute; bottom: 0%; left: 5%;">2022.12.07 00:00</h5>
		</div>
		<div class="board_f"  style="text-align:center; grid-column-start:3; grid-column-end:4; display: inline-flex; position:relative; left:30%; bottom: -100%;height: 100px;">
		 	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4748"><img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/BRA?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="..." style="width:23.7%; position: absolute; border: 1px solid;"></a>
			<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=23120"><img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/KOR?tx=c_fill,g_auto,q_auto" class="card-img-top" alt="..." style="width:23.7%; left: 100px; position: absolute; border: 1px solid;""></a>
			<br>
			<h5 style="position: absolute; bottom:0%; left: 5%;">2022.12.07 04:00</h5>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
</body>

</html>