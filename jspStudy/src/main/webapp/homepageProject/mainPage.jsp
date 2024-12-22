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
<link rel="stylesheet" href="css/regform.css" type="text/css">
<script language="javascript" src="js/hompage.js"></script>
<script language="javascript" src="js/regform.js"></script>
<script src="https://kit.fontawesome.com/de7b35df6f.js" async
	crossorigin="anonymous"></script>

<style>
@charset "UTF-8";

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    display: flex;
    background-color: #f4f4f4;
    text-align: center;
    flex-direction: column;
}

main {
    width: 80%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    justify-content: center;
    align-content: center;
}

.login_table {
    width: 600px;
}
.login_block {
    background-color: #A1E8B4;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

TD, SELECT {
    font-size: 14px;
    color: #333;
    line-height: 1.6;
    padding: 10px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
}

ul {
    list-style-type: none;
    display: flex;
    flex-direction: row;
    padding: 10px 0;
}

ul > li {
    margin-right: 20px;
}

.header {
    border: 1px solid #ddd;
    width: 1500px;
    height: 100px;
    display: flex;
    flex-direction: row;
    font-size: 20px;
    text-align: center;
    justify-content: space-between;
    align-items: center;
    padding: 20px 30px;
    background-color: #F7F8E0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto;
    border-radius: 8px;
}

.header ul > li > a {
    display: inline-block;
    width: 100px;
    padding: 12px;
    text-align: center;
    background-color: #f0f0f0;
    border-radius: 4px;
    font-weight: 500;
    color: #333;
    transition: background-color 0.3s;
}

.header ul > li:hover > a {
    background-color: #007bff;
    color: #fff;
}

.dropdown {
    position: relative;
}

div.dropdown-content {
    display: none;
    position: absolute;
    background-color: #13e07a;
    min-width: 160px;
    z-index: 2;
    box-shadow: 0 8px 16px rgba(66, 68, 90, 0.2);
    border-radius: 4px;
}

div.dropdown-content a {
    display: block;
    padding: 12px;
    color: #333;
    text-decoration: none;
    transition: background-color 0.3s;
}

div.dropdown-content a:hover {
    background-color: #00c16e;
}

.dropdown:hover .dropdown-content {
    display: block;
}

div.slideshow {
    background-color: black;
    height: 465px;
    width: 1500px;
    position: relative;
    margin: 0 auto;
    overflow: hidden;
    border-radius: 8px;
}

div.slideshow_slides {
    position: absolute;
    width: 100%;
    height: 100%;
}

div.slideshow_slides a {
    position: absolute;
    width: 100%;
    height: 100%;
    display: inline-block;
    text-align: center;
}

div.slideshow_slides a img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 8px;
}

div.slideshow_nav a {
    position: absolute;
    left: 50%;
    top: 50%;
    color: white;
    font-size: 62px;
    transform: translateY(-50%);
    opacity: 0.5;
    transition: opacity 0.3s;
}

div.slideshow_nav a:hover {
    opacity: 1;
}

div.slideshow_nav a.prev {
    margin-left: -462px;
}

div.slideshow_nav a.next {
    margin-left: 400px;
}

div.shlideshow_indicator {
    position: absolute;
    bottom: 20px;
    left: 0;
    right: 0;
    text-align: center;
}

div.shlideshow_indicator a {
    display: inline-block;
    color: white;
    padding: 7px;
    font-size: 24px;
    transition: color 0.3s;
}

div.shlideshow_indicator a.active {
    color: #d54909;
}

.tbody {
    display: flex;
    flex-direction: row;
    background-color: #f4f4f4;
    margin: 0 auto;
}

div.left, div.center, div.right {
    border: 1px solid #ddd;
    background-color: #F7F8E0;
    padding: 20px;
    border-radius: 8px;
}

div.left {
    width: 300px;
    height: 1000px;
}

.left .left1, .left .left2 {
    margin: 0 auto;
    border: 1px solid #ddd;
    width: 250px;
    height: 400px;
    margin-bottom: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

div.center {
    width: 900px;
    min-height: 1000px; 
    height: auto; 
}

.maintable {
    margin: 0 auto;
    border: 1px solid #ddd;
    width: 850px;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.maintable th, tr, td {
    margin: 0 auto;
    border: 1px solid #ddd;
    padding: 5px;
    font-weight: 400;
    color: #333;
}

.maintable .num, .maintable .writer, .maintable .day, .maintable .recommend {
    width: 100px;
}

.maintable .title {
    width: 300px;
}

.maintable .comments {
    width: 50px;
}

.writeForm {
    margin: 20px auto;
    display: flex;
    justify-content: center;
    padding: 10px;
}
.lightgrey{
	background-color: lightgrey;
}
.lightgreen{
	background-color: #CEF6F5;
}

/* 우측 */
div.right {
    width: 300px;
    height: 1000px;
    margin: 0 auto;
}

.right .login {
    margin: 0 auto;
    border: 1px solid #ddd;
    width: 250px;
    height: 250px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    background-color: #A1E8B4;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.login_table {
    margin: 0 auto;
}

.login_block input {
    margin: 10px auto;
    width: 100%;
    padding: 5px;
    font-size: 14px;
    border-radius: 4px;
    border: 1px solid #ddd;
    transition: border-color 0.3s;
}

.login_block input:focus {
    border-color: #007bff;
}

.login tr, td, th {
    border: 1px solid #ddd;
}

.footer {
    margin: 20px auto;
    width: 1400px;
    background-color: white;
    height: 300px;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.footer p {
    font-size: 16px;
}
</style>

</head>
<body onload="carousel(); inputCheck(); inputCheck2();">
	<div class="header" >
		<%@ include file="./dropMenu.jsp"%>
	</div>
		<%@ include file="./carousel.jsp"%>
	<div class="tbody">
		<div class="left">
			공지사항
			<div class="left1">
				<%@ include file="./informs.jsp"%>
			</div>	
			<div class="left2"></div>
		</div>
<!-- 		가운데     	-->
		<div class="center" >
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
				}else if(flag.equals("findMemberForm")){ 
%>
			<%@ include file="./findMemberForm.jsp"%>
<%			
				}else if(flag.equals("findPassForm")){ 
%>
			<%@ include file="./findPassForm.jsp"%>
<%			
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
			<%@ include file="./commentMenu.jsp"%>
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