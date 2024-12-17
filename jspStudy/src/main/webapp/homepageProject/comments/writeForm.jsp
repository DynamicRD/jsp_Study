<%@ page contentType="text/html; charset=UTF-8"%>
<%
 // 새로운 글로 입력(num=0, ref=0, step=0, depth=0)
 // 부모글에 대한 답변으로 입력(num=부모값, ref=부모값, step=부모값, depth=부모값)
 int cNum = 0, cRef = 1, cStep = 0, cDepth = 0;
 try {
     if (request.getParameter("num") != null) {
         cNum = Integer.parseInt(request.getParameter("cNum"));
         cRef = Integer.parseInt(request.getParameter("cRef"));
         cStep = Integer.parseInt(request.getParameter("cStep"));
         cDepth = Integer.parseInt(request.getParameter("cDepth"));
     }
%>
<main>
    <b>글쓰기</b>
    <br></br>
    <form method="post" name="cWriteForm" action="writeProc.jsp" onsubmit="return writeSave()">
        <%if(session.getAttribute("id")!=null){%>
            <input type="hidden" size="30" maxlength="30" name="cPass" value="<%=session.getAttribute("pass")%>" />
        <%} %>        
        <input type="hidden" name="cNum" value="<%=cNum%>"> 
        <input type="hidden" name="cRef" value="<%=cRef%>"> 
        <input type="hidden" name="cStep" value="<%=cStep%>"> 
        <input type="hidden" name="cDepth" value="<%=cDepth%>">
        <table width="400" border="1" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td align="right" colspan="2"><a href="mainPage.jsp">글목록</a></td>
            </tr>
            <tr>
                <td width="70" align="center">이름</td>
                <td width="330"  align="left" >
                <%if(session.getAttribute("id")!=null){%>
                    <input type="hidden" size="12" maxlength="12" name="cWriter" value="<%=session.getAttribute("id")%>"/>
                    <%=session.getAttribute("id")%>
                <%}else{ %>
                    <input type="text" size="12" maxlength="12" name="cWriter" />
                <%} %>
                </td>
            </tr>
            <tr>
                <td width="70" align="center">제목</td>
                <td width="330">
                    <% 
                        if (request.getParameter("cNum") == null) {
                    %> 
                        <input type="text" size="50" maxlength="50" name="cSubject" /> 
                    <% 
                        } else { 
                    %> 
                        <input type="text" size="50" maxlength="50" name="cSubject" value="[답변]" />
                    <% 
                        } 
                    %>
                </td>
            </tr>
            <tr>
                <td width="70" align="center">내용</td>
                <td width="330">
                    <textarea name="cContent" rows="13" cols="50"></textarea>
                </td>
            </tr>
            <%if(session.getAttribute("id")==null){%>
            <tr>
                <td width="70" align="center">비밀번호</td>
                <td width="330" align="left" >
                    <input type="password" size="10" maxlength="10" name="cPass" />
                </td>
            </tr>
            <%} %>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="글쓰기" /> 
                    <input type="reset" value="다시작성" />
                    <input type="button" value="목록" onClick="window.location='mainPage.jsp'">
                </td>
            </tr>
        </table>
    </form>
</main>
<%
} catch (Exception e) {
}
%>