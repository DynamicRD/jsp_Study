<%@page import="co.kh.dev.homepageproject.model.BoardMemberVO"%>
<%@page import="co.kh.dev.homepageproject.model.BoardMemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String pass = request.getParameter("pass");
String truePass = request.getParameter("truePass");
int deleteNum = Integer.parseInt(request.getParameter("deleteNum"));
%>
<% 
if (pass.equals(truePass)) {
BoardMemberDAO bdao = BoardMemberDAO.getInstance();
BoardMemberVO vo = new BoardMemberVO();
vo.setNum(deleteNum);
boolean check = bdao.deleteDB(vo);
System.out.println(deleteNum);
		if(check){
%>
<script>
	alert("삭제되었습니다");
	history.go(-1);
</script>
<%
		}else{
%>
	<script>
		alert("DB처리 실패");
		history.go(-1);
	</script>
<%
		}
} else {
%>
<script>
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
</script>
<%
}
%>