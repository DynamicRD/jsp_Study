package co.kh.dev.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginMemberDBServlet.do")
public class LoginMemberDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1.1 전송된값을 utf-8셋팅하기
		request.setCharacterEncoding("UTF-8");
		// 1.1 정보가져오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		// 2. table에 저장한다(프로토콜: 약속)
		Connection con = null;
		PreparedStatement pstmt = null; // 오라클에서 작업할 쿼리문 사용할게 하는 명령문
		boolean successFlag = false;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
		String MEMBER_INSERT = "insert into login values(?,?)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, "webuser", "123456");
			pstmt = con.prepareStatement(MEMBER_INSERT);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			int count = pstmt.executeUpdate();
			successFlag = (count != 0) ? (true) : (false);
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();

				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();

				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
		}

		// 3.화면출력
		if (successFlag == true) {
			System.out.println("가입성공");
			response.sendRedirect("/jspStudy/loginServlet.do");
		} else {
			System.out.println("가입실패");
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
