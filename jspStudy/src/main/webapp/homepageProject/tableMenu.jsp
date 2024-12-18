<%@page import="co.kh.dev.homepageproject.model.BoardMemberDAO"%>
<%@page import="co.kh.dev.homepageproject.model.BoardMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
// 1. 페이징기법 -  페이지 사이즈:1페이지에 10개 보이기
int pageSize = 10;
// 2. 페이징기법 - 페이지번호 선택
request.setCharacterEncoding("utf-8");
String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}
//3. 현재페이지 설정, start, end 
int currentPage = Integer.parseInt(pageNum);
int start = (currentPage - 1) * pageSize + 1; //4페이지 시작보여줘		(4-1)*10+1=>31
int end = (currentPage - 1) * pageSize + 10; //4페이지 끝번호 보여줘 4*10 =>40

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
//4. 해당된 페이지 10개를 가져온다
int number = 0;
ArrayList<BoardMemberVO> BoardMemberList = null;
BoardMemberDAO bdao = BoardMemberDAO.getInstance();

int count = bdao.selectCountDB();//전체 글수
if (count > 0) {
	//현재페이지 내용 10개만 가져온다
	BoardMemberList = bdao.selectStartEndDB(start, end);
}
//5. 만약 4페이지를 가져왔다면(31~40)을 가져왔따면 NUMBER = 40 전체객수 100 1페이지(100~91) 2페이지(90~81)
number = count - (currentPage - 1) * pageSize;
%>

	<main>
		<b>글목록(전체 글:<%=count%>)
		</b>
		<table width="800">
			<tr>
				<td align="right"><a
					href="mainPage.jsp?tableflag=write">글쓰기</a></td>
			</tr>
		</table>
		<%
		if (count == 0) {
		%>
		<table width="800" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
		<%
		} else {
		%>
		<table border="1" width="800" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
				<td align="center" width="50">댓 글</td>
				<td align="center" width="100">IP</td>
			</tr>
			<%
			for (BoardMemberVO bmvo : BoardMemberList) {
				
			%>
			<tr height="30">
				<td align="center" width="50"><%=number--%></td>
				<td width="250">
					<!-- 수정 <5> --> 
					<%-- <a href="content.jsp">  --%>
					<a href="mainPage.jsp?num=<%=bmvo.getNum()%>&pageNum=1&tableflag=select&cPageNum=1"> 
					<!-- 수정<6> -->
					<%
					//6. depth 값에 따라서 5배수 증가를 해서 화면에 보여줘야한다
					//depth : 1 => 길이:5, 2=>10
					int wid = 0;
					if (bmvo.getDepth() > 0) {
						wid = 5 * bmvo.getDepth();
					%>
						<img src="img/level.gif" width="<%=wid%>" height="16">	<!-- 공백 -->
  					<img src="img/re.gif">
						<%
					}
						%>
						<%=bmvo.getSubject()%></a> 
<%
 if (bmvo.getReadcount() >= 20) {
 %> <img src="img/hot.gif" border="0" height="16"> 
 <%
 }
 %>
				</td>
				<td align="center" width="100"><%=bmvo.getWriter()%></td>
				<td align="center" width="150"><%=sdf.format(bmvo.getRegdate())%></td>
				<td align="center" width="50"><%=bmvo.getReadcount()%></td>
				<td align="center" width="50"><%=bmvo.getComments()%></td>
				<td align="center" width="100"><%=bmvo.getIp()%></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>
		<!-- 수정 <7> -->
	</main>
	<br>
<div  align="center">
<%
 			if (count > 0) {
 			int pageBlock = 5;
 			int imsi = count % pageSize == 0 ? 0 : 1;
 			int pageCount = count / pageSize + imsi;
 			int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
 			int endPage = startPage + pageBlock - 1;
 			if (endPage > pageCount) endPage = pageCount;
 			if (startPage > pageBlock) { 
%>
 				<a href="mainPage.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%
 				}
 			for (int i = startPage ; i <= endPage ; i++) { 
				if(currentPage == i){
%>					
 				<a href="mainPage.jsp?pageNum=<%= i %>">[[<%= i %>]]</a>
<% 				
				}else{
%>					
 				<a href="mainPage.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<% 				
				}
%>
<%
				}
 			if (endPage < pageCount) { %>
 				<a href="mainPage.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%
 				}
 %>
 <% 			
		 }
%>
</div>