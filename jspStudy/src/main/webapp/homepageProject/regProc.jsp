
<%@page import="co.kh.dev.homepageproject.model.MemberVO"%>
<%@page import="co.kh.dev.homepageproject.model.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1.사용자 정보를 가져온다 -->
<!-- 2.curd 한다 -->
<%
request.setCharacterEncoding("utf-8");
MemberDAO sdao = new MemberDAO();
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String phone = request.getParameter("tel");
String email = request.getParameter("email");
String zipcode = request.getParameter("zipcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
MemberVO mvo = new MemberVO(id,pass,name,phone,email,zipcode,address1,address2);
boolean flag = sdao.insertDB(mvo);
%>
<!-- 3.화면출력한다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br></br>
	<main>
		<%
		if (flag) {
			out.println("<b>회원가입을 축하 드립니다.</b><br/>");
			out.println("<a href=isRegformFalse.jsp>로그인</a>");
		} else {
			out.println("<b>다시 입력하여 주십시오.</b><br/>");
			out.println("<a href=mainPage.jsp>다시 가입</a>");
		}
		%>
	</main>
</body>
</html>