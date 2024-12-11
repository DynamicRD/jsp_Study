<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"  href="css/homepage.css" type="text/css">
<script language="javascript" src="js/hompage.js"></script>
<script src="https://kit.fontawesome.com/de7b35df6f.js" async
	crossorigin="anonymous"></script>
</head>
<body onload="carousel();">
	<div class="header">
		<p>
			<i class="fa-solid fa-house"></i> 개인웹사이트
		</p>
		<ul>
			<li class="dropdown"><a href="#" class="dropbtn">menu</a>
				<div class="dropdown-content">
					<a href="#">select</a> <a href="#">select</a> <a href="#">select</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropbtn">menu</a>
				<div class="dropdown-content">
					<a href="#">select</a> <a href="#">select</a> <a href="#">select</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropbtn">menu</a>
				<div class="dropdown-content">
					<a href="#">select</a> <a href="#">select</a> <a href="#">select</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropbtn">menu</a>
				<div class="dropdown-content">
					<a href="#">select</a> <a href="#">select</a> <a href="#">select</a>
				</div></li>
		</ul>
		<p>
			<a href=""><i class="fa-brands fa-facebook"></i></a> <a href=""><i
				class="fa-solid fa-dove"></i></a>
		</p>
	</div>
	<div class="slideshow">
		<div class="slideshow_slides">
			<a href="#"><img src="/images/slide-1.jpg" alt=""></a> 
			<a href="#"><img src="/images/slide-2.jpg" alt=""></a> 
			<a href="#"><img src="/images/slide-3.jpg" alt=""></a> 
			<a href="#"><img src="/images/slide-4.jpg" alt=""></a>
		</div>
		<div class="slideshow_nav">
			<a href="#" class="prev"><i
				class="fa-solid fa-circle-chevron-left"></i></a> <a href="#"
				class="next"><i class="fa-solid fa-circle-chevron-right"></i></a>
		</div>
		<div class="shlideshow_indicator">
			<a href="#" class="active"><i class="fa-solid fa-circle-dot"></i></a>
			<a href="#"><i class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
				class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
				class="fa-solid fa-circle-dot"></i></a>
		</div>
	</div>
	<div class="tbody">
		<div class="left">
			공지사항
			<div class="left1"></div>
			<div class="left2"></div>
		</div>
		<div class="center">
			게시판
			<table class="maintable">
				<tr>
					<th class="num">번호</th>
					<th class="title">제목</th>
					<th class="writer">글쓴이</th>
					<th class="day">날짜</th>
					<th class="comments">댓글</th>
					<th class="recommend">추천</th>
				</tr>
				<!-- 반복 10회까지 -->
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<div class="main_footer">
				<ul>
					<li><i class="fa-solid fa-angle-left"></i></li>
					<!-- 10개까지 늘어난다 -->
					<li><a href="#">1</a></li>
					<li><i class="fa-solid fa-angle-right"></i></li>
				</ul>
			</div>

		</div>
		<div class="right">
			로그인창
			<div class="login">
<<<<<<< HEAD
			<% if(session.getAttribute("id") == null){ %>
			<%@ include file="./loginMenu.jsp"%>
			<%}else if(session != null){%>
			<%@ include file="./loginComplete.jsp"%>
			<%}%>		
=======
			<%@ include file="./loginMenu.jsp"%>
				
>>>>>>> 32e669fd1c705337160b3371263b806a371327dd
			</div>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>