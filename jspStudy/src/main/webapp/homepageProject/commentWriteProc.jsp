<%@page import="co.kh.dev.homepageproject.model.CommentMemberVO"%>
<%@page import="co.kh.dev.homepageproject.model.CommentMemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 2. curd -->
<%
CommentMemberVO cVo = new CommentMemberVO();
cVo.setWriter(request.getParameter("cWriter"));
cVo.setRef(Integer.parseInt(request.getParameter("cRef")));
cVo.setStep(Integer.parseInt(request.getParameter("cStep")));
cVo.setDepth(Integer.parseInt(request.getParameter("cDepth")));
cVo.setPass(request.getParameter("cPass"));
cVo.setContent(request.getParameter("cContent"));

// commentPage 값 처리
String commentPageStr = request.getParameter("commentPage");
int commentPage = 0; // 기본값 0
if (commentPageStr != null && !commentPageStr.isEmpty()) {
    try {
        commentPage = Integer.parseInt(commentPageStr);
    } catch (NumberFormatException e) {
        // 숫자가 아닌 값이 들어왔을 경우 기본값 0으로 설정
        commentPage = 0;
    }
}

cVo.setRegdate(new Timestamp(System.currentTimeMillis()));
cVo.setIp(request.getRemoteAddr());
cVo.setBnum(commentPage);

if(session.getAttribute("id") == null){
    cVo.setWriter(cVo.getWriter() + "(비회원)");
}
if(cVo.getDepth() != 0){
    cVo.setContent("[답글]"+cVo.getContent());
}

CommentMemberDAO cBdao = CommentMemberDAO.getInstance();
boolean cFlag = cBdao.insertDB(cVo);

if (cFlag == true) {
    response.sendRedirect("mainPage.jsp?num=" + commentPage + "&pageNum=1&tableflag=select&cPageNum=1");
} else {
%>
<script>
    alert("글 등록이 실패되었습니다.");
    history.go(-1);
</script>
<%
}
%>