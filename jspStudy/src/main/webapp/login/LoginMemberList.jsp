<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.login.model.LoginDAO" %>
<%@ page import="co.kh.dev.login.model.LoginVO" %>
<%
    // 로그인 정보 리스트 가져오기
    LoginDAO ldao = new LoginDAO();
    ArrayList<LoginVO> list = ldao.listLogin(); // DB에서 사용자 목록 가져오기
%>

<html>
<head>
    <title>가입자 리스트</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        p {
            text-align: center;
        }
    </style>
</head>
<body>

    <h2 align="center">가입자 리스트</h2>

   
        <table>
            <tr>
                <th width="100">아이디</th>
                <td width="100">${user.id}</td>
                <th width="100">비밀번호</th>
                <td width="100">${user.pass}</td>
                <th width="100">이름</th>
                <td width="100">${user.name}</td>
            </tr>
        </table>
        <br/>


    <p>
        <input type="button" value="이전화면으로" onclick="location.href='loginServlet.jsp'">
    </p>

</body>
</html>