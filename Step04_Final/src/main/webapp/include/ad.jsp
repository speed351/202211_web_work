<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
@media screen and (max-width: 1000px) {
  .ad{
    display: none;
  }
} 
.right_side{
	position: fixed;
	top: 0;
	right: 0;
	width: 200px;
	height: 100%;
	display : inline-block;
}

.ad {
	position : absolute;
	top: 250px;
	right: 25px;
	height: 500px;
	background-color: yellow;
	color: black;
	width: 150px;
	text-align: center;
}

</style>
	<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-white right_side">
		<div class="ad">
			<p>광고 자리</p>
		</div>
	</div>
</div>

