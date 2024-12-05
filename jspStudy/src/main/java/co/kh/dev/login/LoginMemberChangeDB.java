package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.common.DBUtility;

@WebServlet("/loginMemberChangeDB.do")
public class LoginMemberChangeDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1.1 전송된값을 utf-8셋팅하기
		request.setCharacterEncoding("UTF-8");
		// 1.1 정보가져오기
		String pass = request.getParameter("pass");
		String pass1 = request.getParameter("pass1");
		System.out.println(pass);
		System.out.println(pass1);
		HttpSession session = request.getSession(false);
		System.out.println("세션고유아이디 " + session.getId());
		// 사용자 정보 id,pass
		String id = (String) session.getAttribute("id");
		// 2. table에 저장한다(프로토콜: 약속)
		Connection con = null;
		PreparedStatement pstmt = null; // 오라클에서 작업할 쿼리문 사용할게 하는 명령문
		boolean successFlag = false;
		String MEMBER_UPDATE = "update login set pass = ? where id = ?";
		try {
			if(pass.equals(pass1)) {
				con = DBUtility.dbCon();
				pstmt = con.prepareStatement(MEMBER_UPDATE);
				pstmt.setString(1, pass);
				pstmt.setString(2, id);

				int count = pstmt.executeUpdate();
				successFlag = (count != 0) ? (true) : (false);
				DBUtility.dbClose(con, pstmt);
			}
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		// 3.화면출력
		if (successFlag == true) {
			session.setAttribute("pass", pass);
			System.out.println("비번변경성공");
			response.sendRedirect("/jspStudy/loginServlet.do");
		} else {
			System.out.println("비번변경실패");
			response.sendRedirect("/jspStudy/loginServlet.do");
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
