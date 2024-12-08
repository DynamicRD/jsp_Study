<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.login.model.LoginDAO" %>
<%@ page import="co.kh.dev.login.model.LoginVO" %>
<%
    // 1.1 전송된 값을 UTF-8로 설정하기
    request.setCharacterEncoding("UTF-8");

    // 1.2 사용자 입력 받은 비밀번호 값
    String pass = request.getParameter("pass");
    String pass1 = request.getParameter("pass1");
    System.out.println("입력된 비밀번호: " + pass);
    System.out.println("확인 비밀번호: " + pass1);

    // 1.3 세션에서 사용자 아이디 가져오기
    session = request.getSession(false);
    String id = (String) session.getAttribute("id");
    System.out.println("세션 고유 아이디: " + session.getId());

    // 2. 비밀번호 변경 처리
    boolean successFlag = false;

    if (pass != null && pass.equals(pass1)) {
        // 비밀번호가 일치하면 DB에서 비밀번호를 변경
        LoginDAO ld = new LoginDAO();
        LoginVO lvo = new LoginVO(id, pass);
        successFlag = ld.changeLogin(lvo);
    }

    // 3. 결과에 따른 화면 처리
    if (successFlag) {
        // 비밀번호 변경 성공 시 세션에 새로운 비밀번호 저장
        session.setAttribute("pass", pass);
        System.out.println("비밀번호 변경 성공");

        // 성공 메시지 및 리다이렉트
        out.println("<html>");
        out.println("<head>");
        out.println("<script>");
        out.println("window.onload = function() {");
        out.println("    alert('비밀번호를 잘 변경했습니다.');");
        out.println("    window.location.href = 'loginServlet.jsp';"); // 리다이렉트
        out.println("};");
        out.println("</script>");
        out.println("</head>");
        out.println("<body>");
        out.println("</body>");
        out.println("</html>");
    } else {
        // 비밀번호 불일치 시 처리
        System.out.println("비밀번호 변경 실패");

        // 실패 메시지 및 리다이렉트
        out.println("<html>");
        out.println("<head>");
        out.println("<script>");
        out.println("window.onload = function() {");
        out.println("    alert('비밀번호가 서로 불일치해서 변경 실패했습니다.');");
        out.println("    window.location.href = 'loginServlet.jsp';"); // 리다이렉트
        out.println("};");
        out.println("</script>");
        out.println("</head>");
        out.println("<body>");
        out.println("</body>");
        out.println("</html>");
    }
%>