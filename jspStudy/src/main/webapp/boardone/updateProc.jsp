<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<% 
request.setCharacterEncoding("euc-kr");
 String pageNum = request.getParameter("pageNum");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="vo" scope="page" class="co.kh.dev.boardone.model.BoardVO">
 <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	BoardDAO dbPro = BoardDAO.getInstance();
 	int check = dbPro.updateDB(vo);
 	if(check==1){
%>
<!-- 3.화면설계 -->
 <meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" >
<% }else if (check == 2){%>
 <script language="JavaScript">
 alert("비밀번호가 맞지 않습니다");
 history.go(-1);
 </script>
<%
 } else{
%> 
 <script language="JavaScript">
 alert("업데이트에 문제가 발생했습니다.");
 history.go(-1);
 </script>

<% 
}
%>