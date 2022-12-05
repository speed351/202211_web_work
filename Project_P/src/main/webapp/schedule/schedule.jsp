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
	<div class="container container_tournaments">
		<jsp:include page="/include/nav_bar.jsp">
				<jsp:param value="index" name="thisPage" />
		</jsp:include>
		
		
		<div class="board_16_8_t">
			<div class="card" style="width:200px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/NED?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4705">네덜란드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">3</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/USA?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4724" style="color:gray;">미국</a><strong class="score" style="position:absolute; right :10%; color:gray;">1</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.04. 00:00</p>
				</div>
			</div>
			<%-- 8강 --%>
			<div class="card" style="width:200px; position:absolute; right: -15%; top: 123%;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/NED?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4705">네덜란드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/ARG?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4819" style="color:;">아르헨티나</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.10. 04:00</p>
				</div>
			</div>
			<div style="position: absolute; border-top: solid #80808080 1px;border-right: solid #80808080 1px;width: 141px;height: 60px;right: 27px;top: 49%;"></div>
		</div>
		<div class="board_16_8_m1">
			<div class="card" style="width:200px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/ARG?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4819">아르헨티나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">2</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/AUS?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=7317" style="color:gray;">호주</a><strong class="score" style="position:absolute; right :10%; color:gray;">1</strong>
					<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.04. 04:00</p>
				</div>
			</div>
			<div style="position: absolute; border-bottom: solid #80808080 1px;border-right: solid #80808080 1px;width: 141px;height: 60px;right: 27px;top: -23%;"></div>
		</div>
		<div class="board_16_8_m2">
			<div class="card" style="width:200px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/JPN?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=6736">일본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/CRO?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4715" style="color:;">크로아티아</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.6. 00:00</p>
				</div>
			</div>
			<%-- 8강 --%>
			<div class="card" style="width:200px; position:absolute; right: -15%; top: 121%;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="" alt="" />&nbsp;
				  	<a href="">TBD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="" alt="" />&nbsp;
			  		<a href="" style="color:;">TBD</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.10. 00:00</p>
				</div>
			</div>
			<div style="position: absolute; border-top: solid #80808080 1px;border-right: solid #80808080 1px;width: 141px;height: 60px;right: 27px;top: 49%;"></div>
		</div>		
		<div class="board_16_8_b">
			<div class="card" style="width:200px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/BRA?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4748">브라질&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/KOR?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=23120" style="color:;">대한민국</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.06. 04:00</p>
				</div>
			</div>
			<div style="position: absolute; border-bottom: solid #80808080 1px;border-right: solid #80808080 1px;width: 141px;height: 60px;right: :;;top: -23%;"></div>
		</div>
		
		
		<div class="board_4_f_t">
		<br>
			<h3 style="text-align:center;">경기 일정</h3>
		</div>	
		
		<div class="board_4_f_m1">
			<div class="card" style="width:200px; position: absolute; left:150px; bottom: 50%; ">
				<div class="card-body" style="padding-bottom: 0px;">
					<p style="text-align:center;">FINAL</p>
					<img src="" alt="" />&nbsp;
				  	<a href="">TBD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="" alt="" />&nbsp;
			  		<a href="" style="color:;">TBD</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.19. 00:00</p>
				</div>
			</div>
		</div>	
		<div class="board_4_f_m2">
			
		
		</div>		
		
		<div class="board_4_f_b">
			<div class="card" style="width:200px; position: absolute; left:150px; bottom: 105px; ">
				<div class="card-body" style="padding-bottom: 0px;">
					<p style="text-align:center;">3,4위전</p>
					<img src="" alt="" />&nbsp;
				  	<a href="">TBD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="" alt="" />&nbsp;
			  		<a href="" style="color:;">TBD</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.18. 00:00</p>
				</div>
			</div>
		</div>	
		
		
		
		
		
		<div class="board_8_16_t">
			<div class="card" style="width:200px; position:absolute; right:0%; bottom:-40px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/ENG?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4713">잉글랜드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">3</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/SEN?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4739" style="color:gray;">세네갈</a><strong class="score" style="position:absolute; right :10%; color:gray;">0</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.05. 04:00</p>
				</div>
			</div>
			<%-- 8강 --%>
			<div class="card" style="width:200px;position:absolute;right: 63%;bottom: -141px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/ENG?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4713">잉글랜드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/FRA?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4481" style="color:;">프랑스</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.11. 04:00</p>
				</div>
			</div>
			<div style="position: absolute;border-top: solid #80808080 1px;border-left: solid #80808080 1px;width: 141px;height: 60px;right: 200px;top: 49%;"></div>
		</div>
		<div class="board_8_16_m1">
			<div class="card" style="width:200px; position:absolute; right:0%; bottom:-40px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/FRA?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4481">프랑스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">3</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/POL?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4703" style="color:gray;">폴란드</a><strong class="score" style="position:absolute; right :10%; color:;">1</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.5. 00:00</p>
				</div>
			</div>
			<div style="position: absolute;border-bottom: solid #80808080 1px;border-left: solid #80808080 1px;width: 141px;height: 60px;right: 200px;top:-59px;"></div>
		</div>
		<div class="board_8_16_m2">
			<div class="card" style="width:200px; position:absolute; right:0%; bottom:-40px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/MAR?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4778">모로코&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/ESP?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4698" style="color:gray;">스페인</a><strong class="score" style="position:absolute; right :10%; color:gray;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.07. 00:00</p>
				</div>
			</div>
			<%-- 8강 --%>
			<div class="card" style="width:200px;position:absolute;right: 63%;bottom: -141px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="" alt="" />&nbsp;
				  	<a href="">TBD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="" alt="" />&nbsp;
			  		<a href="" style="color:;">TBD</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.11. 00:00</p>
				</div>
			</div>
			<div style="position: absolute;border-top: solid #80808080 1px;border-left: solid #80808080 1px;width: 141px;height: 60px;right: 200px;top: 49%;"></div>
		</div>
		<div class="board_8_16_b">
			<div class="card" style="width:200px; position:absolute; right:0%; bottom:-40px;">
				<div class="card-body" style="padding-bottom: 0px;">
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/POR?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
				  	<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4704">포르투갈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><strong class="score" style="position:absolute; right :10%;">TBD</strong>
					<img src="https://cloudinary.fifa.com/api/v3/picture/flags-sq-4/SUI?tx=c_fill,g_auto,q_auto,w_24" alt="" />&nbsp;
			  		<a href="https://m.sports.naver.com/qatar2022/nation/index?teamCode=4699" style="color:;">스위스</a><strong class="score" style="position:absolute; right :10%; color:;">TBD</strong>
			  		<p style="font-size:8px; margin-top:0; margin-bottom:0; text-align:center;">22.12.5. 00:00</p>
				</div>
			</div>
			<div style="position: absolute;border-bottom: solid #80808080 1px;border-left: solid #80808080 1px;width: 141px;height: 60px;right: 200px;top:-59px;"></div>
		</div>

	</div>
	<jsp:include page="/include/footer.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
</body>

</html>