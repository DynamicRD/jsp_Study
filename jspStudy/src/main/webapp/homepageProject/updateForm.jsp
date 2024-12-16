<%@page import="co.kh.dev.homepageproject.model.BoardMemberDAO"%>
<%@page import="co.kh.dev.homepageproject.model.BoardMemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardMemberVO vo = new BoardMemberVO();
vo.setNum(num);
%>
<%
try {
	BoardMemberDAO bdao = BoardMemberDAO.getInstance();
	BoardMemberVO article = bdao.selectBoardMemberOneDB(vo);
%>
	<main>
		<b>글수정</b> <br>
		<form method="post" name="writeform" action="updateProc.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=article.getNum()%>">
			
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				 align="center">
				<tr>
					<td width="70" align="center">이 름</td>
					<td align="left" width="330"><input type="text" size="10"
						maxlength="10" name="writer" value="<%=article.getWriter()%>">
					</td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td width="70" align="center">Email</td>
					<td align="left" width="330"><input type="text" size="40"
						maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td width="70" align="center">내 용</td>
					<td align="left" width="330"><textarea name="content"
							rows="13" cols="40">
        <%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td align="left" width="330"><input type="password" size="8"
						maxlength="12" name="pass"></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="submit" value="글수정"> 
						<input type="reset"	value="다시작성"> 
						<input type="button" value="목록보기" onclick="document.location.href='mainPage.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
	</main>
	<%
	} catch (Exception e) {
	}
	%>
