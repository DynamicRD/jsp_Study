<%@page import="co.kh.dev.homepageproject.model.CommentMemberDAO"%>
<%@page import="co.kh.dev.homepageproject.model.CommentMemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int cNum = Integer.parseInt(request.getParameter("num"));
String cPageNum = request.getParameter("pageNum");
CommentMemberVO cVo = new CommentMemberVO();
cVo.setNum(cNum);
%>
<%
try {
	CommentMemberDAO cBdao = CommentMemberDAO.getInstance();
	CommentMemberVO cBvo = cBdao.selectCommentMemberOneDB(cVo);
%>
	<main>
		<b>글수정</b> <br>
		<form method="post" name="cWriteForm" action="updateProc.jsp?pageNum=<%=cPageNum%>" onsubmit="return writeSave()">
			<input type="hidden" name="cNum" value="<%=cBvo.getNum()%>">
			
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				 align="center">
				<tr>
					<td width="70" align="center">이 름</td>
					<td align="left" width="330"><input type="hidden" size="10"
						maxlength="10" name="cWriter" value="<%=cBvo.getWriter()%>">
						<%=cBvo.getWriter()%>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="50" name="cSubject" value="<%=cBvo.getSubject()%>"></td>
				</tr>
<%-- 				<tr>
					<td width="70" align="center">Email</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="30" name="cEmail" value="<%=cBvo.getEmail()%>"></td>
				</tr> --%>
				<tr>
					<td width="70" align="center">내 용</td>
					<td align="left" width="330"><textarea name="cContent"
							rows="13" cols="40">
        <%=cBvo.getContent()%></textarea></td>
				</tr>
				<% if (session.getAttribute("id") == null) { %>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td align="left" width="330">
						<input type="password" size="8"	maxlength="12" name="cPass">
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
				<% } else { %>
				<tr>
					<td colspan=2 align="center">
					<input type="hidden" size="8" name="cPass" value=<%=session.getAttribute("pass")%>>
				<% } %>
    				<input type="submit" value="글수정">
    				<input type="reset" value="다시작성">
						<input type="button" value="목록보기" onclick="document.location.href='mainPage.jsp?pageNum=<%=cPageNum%>'">
					</td>
				</tr>
			</table>
		</form>
	</main>
	<%
} catch (Exception e) {
}
%>