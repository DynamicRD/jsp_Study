<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.login.model.LoginDAO" %>
<%@ page import="co.kh.dev.login.model.LoginVO" %>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    boolean successFlag = false;

    if (id != null && pass != null) {
        // 1. LoginVO 객체 생성
        LoginVO lvo = new LoginVO(id, pass);
        LoginDAO ld = new LoginDAO();

        // 2. selectLogin 메서드를 호출하여 로그인 정보 확인
        LoginVO rlvo = ld.selectLogin(lvo);
        successFlag = rlvo.isSuccessFlag();

        // 3. 로그인 성공 시 세션을 생성하여 사용자 정보 저장
        if (successFlag) {
            session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("pass", pass);
            session.setAttribute("name", rlvo.getName());
            response.sendRedirect("LoginServlet.jsp");
        } else {
%>
            <script>
                alert('로그인 실패했습니다.');
                window.location.href = 'LoginServlet.jsp';
            </script>
<%
        }
    }
%>