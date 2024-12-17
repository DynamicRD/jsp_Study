<%@page import="co.kh.dev.homepageproject.model.CommentMemberDAO"%>
<%@page import="co.kh.dev.homepageproject.model.CommentMemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int cNum = Integer.parseInt(request.getParameter("cNum"));
String cPageNum = request.getParameter("cPageNum");
CommentMemberVO cVo = new CommentMemberVO();
cVo.setNum(cNum);
SimpleDateFormat cSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
try {
    CommentMemberDAO cBdao = CommentMemberDAO.getInstance();
    CommentMemberVO cBvo = cBdao.selectCommentMemberDB(cVo);
    int c_Num = cVo.getNum();
    int cRef = cBvo.getRef();
    int cStep = cBvo.getStep();
    int cDepth = cBvo.getDepth();
%>
    <main>
        <b>글내용 보기</b> <br></br>
        <form>
            <table width="500" border="1" cellspacing="0" cellpadding="0"
                 align="center">
                <tr height="30">
                    <td align="center" width="125">글번호</td>
                    <td align="center" width="125" align="center"><%=cBvo.getNum()%></td>
                    <td align="center" width="125">조회수</td>
                    <td align="center" width="125" align="center"><%=cBvo.getReadcount()%></td>
                </tr>
                <tr height="30">
                    <td align="center" width="125">작성자</td>
                    <td align="center" width="125" align="center"><%=cBvo.getWriter()%></td>
                    <td align="center" width="125">작성일</td>
                    <td align="center" width="125" align="center"><%= cSdf.format(cBvo.getRegdate())%></td>
                </tr>
                <tr height="30">
                    <td align="center" width="125">글제목</td>
                    <td align="center" width="375" align="center" colspan="3"><%=cBvo.getSubject()%></td>
                </tr>
                <tr>
                    <td align="center" width="125">글내용</td>
                    <td align="left" width="375" colspan="3"><pre><%=cBvo.getContent()%></pre></td>
                </tr>
                <tr height="30">
                    <td colspan="4" align="right">
                        <%
                        String cSessionId = (String) session.getAttribute("id");  // 회원 id
                        String cWriter = cBvo.getWriter();  // 글쓴이 이름
                        boolean cIsMember = cSessionId != null;  // 회원인지 확인

                        // 글쓴이 이름에서 '(비회원)'이 포함되어 있는지 체크
                        boolean cIsNonMemberPost = cWriter.endsWith("(비회원)");
                        %>

                        <%-- 수정 권한 체크 --%>
                        <% if (cIsNonMemberPost || (cIsMember && cSessionId.equals(cWriter))) { %>
                            <input type="button" value="글수정" onclick="document.location.href='mainPage.jsp?num=<%=c_Num%>&pageNum=<%=cPageNum%>&tableflag=update'">
                            &nbsp;&nbsp;&nbsp;&nbsp; 
                            <input type="button" value="글삭제" onclick="document.location.href='mainPage.jsp?num=<%=c_Num%>&pageNum=<%=cPageNum%>&tableflag=delete&cWriter=<%=cWriter%>'">
                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 수정<1> --> 
                        <% } %>
                            
                        <input type="button" value="글목록" onclick="document.location.href='mainPage.jsp?pageNum=<%=cPageNum%>'">

                    </td>
                </tr>
            </table>
        </form>
    </main>
<%
} catch(Exception e) { e.printStackTrace(); } 
%>