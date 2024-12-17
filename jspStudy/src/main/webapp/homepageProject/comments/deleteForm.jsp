<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int cNum = Integer.parseInt(request.getParameter("cNum"));
String cPageNum = request.getParameter("cPageNum");
%>
<main>
    <b>글삭제</b> <br></br>
    <form method="POST" name="cDelForm" action="deleteProc.jsp?pageNum=<%=cPageNum%>" onsubmit="return deleteSave()">
        <input type="hidden" name="cNum" value="<%=cNum%>">
        <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
            <tr height="30">
                <% if (session.getAttribute("id") == null) { %>
                    <td align=center><b>비밀번호를 입력해 주세요.</b></td>
                </tr>
                <tr height="30">
                    <td align=center>비밀번호 : 
                        <input type="password" name="cPass" size="8" maxlength="12"> 
                    </td>
                </tr>
                <tr height="30">
                    <td align=center>
                <% } else if (session.getAttribute("id").equals(request.getParameter("cWriter"))) { %>
                    <td align=center>
                        <b>정말 삭제하시겠습니까?.</b>
                        <input type="hidden" name="cPass" value="<%=session.getAttribute("pass") %>" size="8" maxlength="12"> 
                    </td>
                </tr>
                <tr height="30">
                    <td align=center>
                <% } else { %>
                    <td align=center><b>비밀번호를 입력해 주세요.</b></td>
                </tr>
                <tr height="30">
                    <td align=center>비밀번호 : 
                        <input type="password" name="cPass" size="8" maxlength="12"> 
                    </td>
                </tr>
                <tr height="30">
                    <td align=center>
                <% } %>
                    <input type="submit" value="글삭제"> 
                    <input type="button" value="글목록" onclick="document.location.href= 'mainPage.jsp?pageNum=<%=cPageNum%>'">
                </td>
            </tr>
        </table>
    </form>
</main>