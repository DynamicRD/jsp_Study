<%@page import="co.kh.dev.homepageproject.model.CommentMemberVO"%>
<%@page import="co.kh.dev.homepageproject.model.CommentMemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int cNum = Integer.parseInt(request.getParameter("cNum"));
String cPageNum = request.getParameter("cPageNum");
String cPass = request.getParameter("cPass");
%>
<% 
CommentMemberDAO cBdao = CommentMemberDAO.getInstance();
CommentMemberVO cVo = new CommentMemberVO();
cVo.setNum(cNum);
cVo.setPass(cPass);
boolean cCheck = cBdao.deleteDB(cVo);
if (cCheck) {
%>
<meta http-equiv="Refresh" content="0;url=mainPage.jsp?pageNum=<%=cPageNum%>">
<%
} else {
%>
<script>
    alert("비밀번호가 맞지 않습니다");
    history.go(-1);
</script>
<%
}
%>