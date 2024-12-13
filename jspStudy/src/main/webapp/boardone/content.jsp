<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./view/color.jsp"%>
<!-- 1.사용자 정보 가져옴 -->
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardVO vo = new BoardVO();
	vo.setNum(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<!-- 2. curd -->
<%
BoardDAO bdao = BoardDAO.getInstance();
BoardVO bvo = bdao.selectBoardDB(vo);
int ref=vo.getRef();
int step=vo.getStep();
int depth=vo.getDepth();
%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="script.js"></script>
<head>
<body bgcolor="<%=bodyback_c%>">
	<main>
		<b>글내용 보기</b> <br></br>
		<form>
			<table width="500" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr height="30">
					<td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
					<td align="center" width="125" align="center"><%=bvo.getNum()%></td>
					<td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
					<td align="center" width="125" align="center"><%=bvo.getReadcount()%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
					<td align="center" width="125" align="center"><%=bvo.getWriter()%></td>
					<td align="center" width="125" bgcolor="<%=value_c%>">작성일</td>
					<td align="center" width="125" align="center"><%= sdf.format(bvo.getRegdate())%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
					<td align="center" width="375" align="center" colspan="3"><%=bvo.getSubject()%></td>
				</tr>
				<tr>
					<td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
					<td align="left" width="375" colspan="3"><pre><%=bvo.getContent()%></pre></td>
				</tr>
				<tr height="30">
					<td colspan="4" bgcolor="<%=value_c%>" align="right">
					<input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num= <%=vo.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num= <%=vo.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- 수정<1> -->
 					<input type="button" value="글목록" onclick="document.location.href='list.jsp? pageNum= <%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>