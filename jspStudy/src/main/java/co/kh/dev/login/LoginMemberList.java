package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
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

import co.kh.dev.common.DBUtility;

@WebServlet("/loginMemberList.do")
public class LoginMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Connection con = null;
		String LOGIN_SELECT = "select * from login";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBUtility.dbCon();
			pstmt = con.prepareStatement(LOGIN_SELECT);
			rs = pstmt.executeQuery();

			// 3. 출력하기
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<html>");
			out.println("<head><title>가입자 리스트</title></head>");
			out.println("<body>");
			while (rs.next()) {
				String id = rs.getString("ID");
				String pass = rs.getString("PASS");
				out.println("<table align=center width=500 border=1>");
				out.println("<tr>");
				out.println("<th width=100>아이디</th>");
				out.println("<td width=100 align=center>" + id + "</td>");
				out.println("<th width=100>비밀번호</th>");
				out.println("<td width=100 align=center>" + pass + "</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("<p>");
			}
			out.println("<p align=center><a href=/jspStudy/loginServlet.do>이전화면으로</a></p>");
			out.println("</body>");
			out.println("</html>");
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			DBUtility.dbClose(con, pstmt, rs);
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
