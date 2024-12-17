<%@page contentType="text/html; charset=UTF-8"%>

<% 
	//메인페이지 가운데 페이지 전환플래그
	String flag = request.getParameter("flag");
	if(flag == null){
		flag = "none";
	}
	String tableflag = request.getParameter("tableflag");
	if(tableflag == null){
		tableflag = "none";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/homepage.css" type="text/css"><link rel="stylesheet" href="css/regform.css" type="text/css">
<script language="javascript" src="js/hompage.js"></script>
<script language="javascript" src="js/regform.js"></script>
<script src="https://kit.fontawesome.com/de7b35df6f.js" async
	crossorigin="anonymous"></script>
</head>
<body onload="carousel(); inputCheck(); inputCheck2();">
	<div class="header">
		<%@ include file="./dropMenu.jsp"%>
	</div>
		<%@ include file="./carousel.jsp"%>
	<div class="tbody">
		<div class="left">
			공지사항
			<div class="left1"></div>
			<div class="left2"></div>
		</div>
<!-- 		가운데     	-->
		<div class="center">
<% 
		  	//회원가입 화면을 띄운다
				if(flag.equals("regform")){
%>
			<%@ include file="./regForm.jsp"%>
<%			//회원정보변경화면을 메인에 띄운다
				}else if(flag.equals("memberChange")){ 
%>
			<%@ include file="./memberChange.jsp"%>
<%			//글목록 메인화면 
				} else if(tableflag.equals("none")){
%>
			<%@ include file="./tableMenu.jsp"%>
<%			//
				} else if(tableflag.equals("write")){
%>
			<%@ include file="./writeForm.jsp"%>
<%
				} else if(tableflag.equals("select")){
%>
			<%@ include file="./content.jsp"%>
			<%@ include file="./comments/commentMenu.jsp"%>
<%
				} else if(tableflag.equals("update")){
%>
			<%@ include file="./updateForm.jsp"%>
<%
				}  else if(tableflag.equals("delete")){
%>
			<%@ include file="./deleteForm.jsp"%>
<%
				}  
%>
		</div>
		
<!-- 		오른쪽 -->
		<div class="right">
			로그인창
			<div class="login">
			<% if(session.getAttribute("id") == null){ %>
			<%@ include file="./loginMenu.jsp"%>
			<%}else if(session != null){%>
			<%@ include file="./loginComplete.jsp"%>
			<%}%>		
			</div>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>