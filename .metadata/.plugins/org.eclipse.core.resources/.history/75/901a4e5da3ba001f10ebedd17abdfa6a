<%@page import="java.sql.Timestamp"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1. 사용자정보를 가져온다, 세션정보를 가져온다 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" scope="page"
	class="co.kh.dev.boardone.model.BoardVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<!-- 2.curd -->
<!-- 3.화면설계 -->
<%
vo.setRegdate(new Timestamp(System.currentTimeMillis()));
vo.setIp(request.getRemoteAddr());
BoardDAO bdao = BoardDAO.getInstance();
boolean flag = bdao.insertDB(vo);
if (flag == true) {
	response.sendRedirect("list.jsp");
} else {
%>
	<script>
		slert("게시판등록 실패");
		history.go(-1);
	</script>
<%
}
%>
