package co.kh.dev.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginCheck.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			//1. 사용자정보를 읽는다
			request.setCharacterEncoding("UTF-8");
			String id =request.getParameter("id");
			String pass = request.getParameter("pass");
			
			//2. 데이터베이스에서 확인한다. id,pass
			ResultSet rs = null;
			Connection con = null;
			PreparedStatement pstmt = null; // 오라클에서 작업할 쿼리문 사용할게 하는 명령문
			boolean successFlag = false;
			String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
			String MEMBER_SELECT = "select * from login";
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(url, "webuser", "123456");
				pstmt = con.prepareStatement(MEMBER_SELECT);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String idCheck = rs.getString("ID");
					String passCheck = rs.getString("PASS");
					if(id.equals(idCheck) && pass.equals(passCheck)) {
						successFlag = true;
						break;
					}
				}
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

			//3. 체크확인 로그인이 인정이 되면 세션을 만들어서 저장한다.
			if(successFlag == true) {
				//세션이 있으면 가져오고, 없으면 세션을 생성한다.
				HttpSession session =request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("pass", pass);
			}
			response.sendRedirect("/jspStudy/loginServlet.do");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
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
