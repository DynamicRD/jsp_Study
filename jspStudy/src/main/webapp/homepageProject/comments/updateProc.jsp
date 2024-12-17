<%@page import="co.kh.dev.homepageproject.model.CommentMemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<!-- 1. -->
<%
request.setCharacterEncoding("utf-8");
String cPageNum = request.getParameter("cPageNum");
%>
<jsp:useBean id="cVo" scope="page" class="co.kh.dev.homepageproject.model.CommentMemberVO">
	<jsp:setProperty name="cVo" property="*" />
</jsp:useBean>

<!-- 2. curd -->
<%
CommentMemberDAO cBdao = CommentMemberDAO.getInstance();
int cCheck = cBdao.updateDB(cVo);
// 1: 성공, 2. 패스워드문제, 3 수정문제
if (cCheck == 1) {
%>
<meta http-equiv="Refresh" content="0;url=mainPage.jsp?pageNum=<%=cPageNum%>">
<%
} else if(cCheck == 2){
%>
<script language="JavaScript">
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
</script>
<%
}else{
%>
<script language="JavaScript">
	alert("업데이트에 문제가 발생하였습니다.");
	history.go(-1);
</script>
<%
}
%>