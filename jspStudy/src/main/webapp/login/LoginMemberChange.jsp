<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 사용자 정보 id, pass를 받아옵니다.
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
%>
<html>
<head>
    <style>
        #my_table {
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <!-- 비밀번호 변경 폼 -->
    <form method="post" action="loginMemberChangeDB.jsp">
        <table border="1" width="400" id="my_table">
            <tr>
                <th width="200">새로운 비밀번호</th>
                <td width="200">
                    &nbsp;<input type="password" name="pass">
                </td>
            </tr>
            <tr>
                <th width="200">비밀번호 재확인</th>
                <td width="200">
                    &nbsp;<input type="password" name="pass1">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" value="확인">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>