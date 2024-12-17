<%@page import="co.kh.dev.homepageproject.model.CommentMemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1. 사용자정보를 가져온다. -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="cVo" scope="page" class="co.kh.dev.homepageproject.model.CommentMemberVO">
    <jsp:setProperty name="cVo" property="*" />
</jsp:useBean>
<!-- 2. curd -->
<%
cVo.setRegdate(new Timestamp(System.currentTimeMillis()));
cVo.setIp(request.getRemoteAddr());
if(session.getAttribute("id")==null){
    cVo.setWriter(cVo.getWriter()+"(비회원)");
}
CommentMemberDAO cBdao = CommentMemberDAO.getInstance();
boolean cFlag = cBdao.insertDB(cVo);
if (cFlag == true) {
    response.sendRedirect("mainPage.jsp");
}else{
%>
<script>
    alert("글 등록이 실패되었습니다.")
    history.go(-1);
</script>
<%
}
%>