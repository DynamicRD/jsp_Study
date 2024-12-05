package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자정보를 화면에 출력한다.
		response.setContentType("text/html;Charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			// 1.세션 정보 가져오기(세션객체가 있으면 세션객체리턴, 없으면 null 리턴한다)
			HttpSession session = request.getSession(false);
			// 2.세션정보가 있으면 아이디와 패스워드를 가져온다. 없으면 로그인창으로 이동
			if (session != null) {
				System.out.println("세션고유아이디 " + session.getId());
				// 사용자 정보 id,pass
				String id = (String) session.getAttribute("id");
				String pass = (String) session.getAttribute("pass");

				out.println("<html>");
				out.println("<body>");
				out.println("<table border='1' width='300'>");
				out.println("<tr>");
				out.println("<td width='300' align='center'>" + id + " 님 로그인 되었습니다.</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td width='300' align='center'>" + pass + " 패스워드입니다.</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='center'>");
				out.println("<a href='/jspStudy/loginMemberList.do'>회원들정보</a>");
				out.println("<a href='/jspStudy/loginMemberChange.do'>회원정보변경</a>");
				out.println("<a href='/jspStudy/logoutServlet.do'>로그아웃</a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			} else {
				out.println("<html>");
				 out.println("<body>");
				 out.print("<form method='post' action='/jspStudy/loginCheck.do'>");
				 out.println("<table border='1' width='300'>");
				 out.println("<tr>");
				 out.println("<th width='100'>아이디</th>");
				 out.println("<td width='200'>&nbsp;<input type='text' name='id'></td>");
				 out.println("</tr>");
				 out.println("<tr>");
				 out.println("<th width='100'>비번</th>");
				 out.println("<td width='200'>&nbsp;<input type='password' name='pass'></td>");
				 out.println("</tr>");
				 out.println("<tr>");
				 out.println("<td align='center' colspan='2'>");
				 out.println("<input type='button' onclick = \"location.href = '/jspStudy/loginMemberServlet.do' \" value='회원가입'>");
				 out.println("<input type='submit' value='로그인'>");
				 out.println("</td>");
				 out.println("</tr>");
				 out.println("</form>");
				 out.println("</table>");
				 out.println("</body>");
				 out.println("</html>");
			}
		}catch(Exception e) {
			System.out.println(e.toString());
		}finally {
			if(out != null) {
				out.close();
			}
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
