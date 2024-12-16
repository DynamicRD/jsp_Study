<%@page import="co.kh.dev.homepageproject.model.BoardMemberDAO"%>
<%@page import="co.kh.dev.homepageproject.model.BoardMemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardMemberVO vo = new BoardMemberVO();
	vo.setNum(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
try{
BoardMemberDAO bdao = BoardMemberDAO.getInstance();
BoardMemberVO bvo =  bdao.selectBoardMemberDB(vo);
int _num = vo.getNum();
int ref=bvo.getRef();
int step=bvo.getStep();
int depth=bvo.getDepth();
%>
	<main>
		<b>글내용 보기</b> <br></br>
		<form>
			<table width="500" border="1" cellspacing="0" cellpadding="0"
				 align="center">
				<tr height="30">
					<td align="center" width="125">글번호</td>
					<td align="center" width="125" align="center"><%=bvo.getNum()%></td>
					<td align="center" width="125">조회수</td>
					<td align="center" width="125" align="center"><%=bvo.getReadcount()%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125">작성자</td>
					<td align="center" width="125" align="center"><%=bvo.getWriter()%></td>
					<td align="center" width="125">작성일</td>
					<td align="center" width="125" align="center"><%= sdf.format(bvo.getRegdate())%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125">글제목</td>
					<td align="center" width="375" align="center" colspan="3"><%=bvo.getSubject()%></td>
				</tr>
				<tr>
					<td align="center" width="125">글내용</td>
					<td align="left" width="375" colspan="3"><pre><%=bvo.getContent()%></pre></td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right">
					<input
						type="button" value="글수정"
						onclick="document.location.href='mainPage.jsp?num=<%=_num%>&pageNum=<%=pageNum%>&tableflag=update'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="글삭제"
						onclick="document.location.href='mainPage.jsp?num=<%=_num%>&pageNum=<%=pageNum%>&tableflag=delete'">
						&nbsp;&nbsp;&nbsp;&nbsp; <!-- 수정<1> --> 
						<input type="button" value="글목록" onclick="document.location.href='mainPage.jsp?pageNum=<%=pageNum%>'">

					</td>
				</tr>
			</table>
		</form>
	</main>
			<%
 }catch(Exception e){e.printStackTrace();} 
%>