<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.login.model.LoginDAO" %>
<%@ page import="co.kh.dev.login.model.LoginVO" %>

<html>
<head>
    <title>회원 탈퇴</title>
    <style>
        #my_table {
            margin: 0 auto;
            border-collapse: collapse;
        }

    </style>
</head>
<body>

<%
    session = request.getSession(false);
    if (session != null) {
        String id = (String) session.getAttribute("id");
        LoginDAO ldao = new LoginDAO();
        LoginVO lvo = new LoginVO(id);
        boolean successFlag = ldao.deleteLogin(lvo);

        if (successFlag) {
            // 탈퇴 성공
            session.invalidate(); // 세션 무효화
%>
            <script>
                alert('탈퇴 성공했습니다.');
                window.location.href = 'loginServlet.jsp';  // 리다이렉트
            </script>
<%
        } else {
            // 탈퇴 실패
%>
            <script>
                alert('세상에 탈퇴실패가 가능했나요.');
                window.location.href = 'loginServlet.jsp';  // 리다이렉트
            </script>
<%
        }
    } else {
        // 세션이 없다면 로그인 페이지로 이동
%>
        <script>
            alert('로그인 세션이 만료되었습니다. 다시 로그인해주세요.');
            window.location.href = 'loginServlet.jsp';  // 리다이렉트
        </script>
<%
    }
%>

</body>
</html>