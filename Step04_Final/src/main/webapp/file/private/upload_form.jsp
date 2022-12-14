<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
.content_box{
	position : absoulte;
	border-style : solid;
	border-color : #ced4da;
	border-radius : 5px;
	width : 500px;
	height : 300px;
	padding : 30px;
	background-color : white;
    margin: auto;
}
</style>
<body>
	<div class="container">
		<br>
		<h3 style="text-align:center">파일 업로드</h3>
		<br>
		<jsp:include page="/include/nav_bar.jsp">
			<jsp:param value="file" name="thisPage"/>
		</jsp:include>
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file" />
			- enctype="multipart/form-data" 가 설정된 폼을 전송하면
			폼전송된 내용을 추출할 때 HTTPServletRequest 객체로 추출을 할 수 없다.
			MultiPartRequest 객체를 이용해서 추출해야 한다.
		 -->
		 <div class="content_box">
			 <form action="upload.jsp" method="post" enctype="multipart/form-data">
			 	<div>
			 		<label for="title">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			 		<input type="text" name="title" id="title"/>
			 	</div>
			 	<div>
			 		<label for="myFile">첨부파일</label>
			 		<input type="file" name="myFile" id="myFile"/>
			 	</div>
			 	<br>
			 	<button class="btn btn-primary" type="submit">업로드</button>
			 </form>
		 </div>
	</div>
		<jsp:include page="/include/footer.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>

		<jsp:include page="/include/ad.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>	
</body>
</html>