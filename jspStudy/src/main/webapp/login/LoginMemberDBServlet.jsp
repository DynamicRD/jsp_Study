<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.login.model.LoginDAO" %>
<%@ page import="co.kh.dev.login.model.LoginVO" %>
<%
    // 1.1 전송된 값을 UTF-8로 설정하기
    request.setCharacterEncoding("UTF-8");

    // 1.2 사용자 입력 받은 정보
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");

    boolean successFlag = false;

    // 2. 로그인 정보 객체 생성 및 DB에 저장
    LoginDAO ldao = new LoginDAO();
    LoginVO lvo = new LoginVO(id, pass, name);
    successFlag = ldao.newLogin(lvo);

    // 3. 결과에 따른 화면 처리
    if (successFlag) {
        // 가입 성공 시 처리
        System.out.println("가입 성공");

        // 성공 메시지 및 리다이렉트
        out.println("<html>");
        out.println("<head>");
        out.println("<script>");
        out.println("window.onload = function() {");
        out.println("    alert('가입 성공했습니다.');");
        out.println("    window.location.href = 'loginServlet.jsp';");  // 리다이렉트
        out.println("};");
        out.println("</script>");
        out.println("</head>");
        out.println("<body>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    } else {
        // 가입 실패 시 처리
        System.out.println("가입 실패");

        // 실패 메시지 및 리다이렉트
        out.println("<html>");
        out.println("<head>");
        out.println("<script>");
        out.println("window.onload = function() {");
        out.println("    alert('가입 실패했습니다.');");
        out.println("    window.location.href = 'loginServlet.jsp';");  // 리다이렉트
        out.println("};");
        out.println("</script>");
        out.println("</head>");
        out.println("<body>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
%>