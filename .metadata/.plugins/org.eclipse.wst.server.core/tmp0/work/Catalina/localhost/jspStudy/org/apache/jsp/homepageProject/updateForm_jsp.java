/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.97
 * Generated at: 2024-12-15 14:50:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.homepageProject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import co.kh.dev.homepageproject.model.BoardMemberDAO;
import co.kh.dev.homepageproject.model.BoardMemberVO;

public final class updateForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(3);
    _jspx_imports_classes.add("co.kh.dev.homepageproject.model.BoardMemberDAO");
    _jspx_imports_classes.add("co.kh.dev.homepageproject.model.BoardMemberVO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      out.write('\n');

request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardMemberVO vo = new BoardMemberVO();
vo.setNum(num);

      out.write('\n');

try {
	BoardMemberDAO bdao = BoardMemberDAO.getInstance();
	BoardMemberVO article = bdao.selectBoardMemberOneDB(vo);

      out.write("\n");
      out.write("	<main>\n");
      out.write("		<b>글수정</b> <br>\n");
      out.write("		<form method=\"post\" name=\"writeform\"\n");
      out.write("			action=\"updateProc.jsp?pageNum=");
      out.print(pageNum);
      out.write("\"\n");
      out.write("			onsubmit=\"return writeSave()\">\n");
      out.write("			<input type=\"hidden\" name=\"num\" value=\"");
      out.print(article.getNum());
      out.write("\">\n");
      out.write("			<table width=\"400\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"\n");
      out.write("				 align=\"center\">\n");
      out.write("				<tr>\n");
      out.write("					<td width=\"70\" align=\"center\">이 름</td>\n");
      out.write("					<td align=\"left\" width=\"330\"><input type=\"text\" size=\"10\"\n");
      out.write("						maxlength=\"10\" name=\"writer\" value=\"");
      out.print(article.getWriter());
      out.write("\">\n");
      out.write("					</td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>\n");
      out.write("					<td width=\"70\" align=\"center\">제 목</td>\n");
      out.write("					<td align=\"left\" width=\"330\"><input type=\"text\" size=\"40\"\n");
      out.write("						maxlength=\"50\" name=\"subject\" value=\"");
      out.print(article.getSubject());
      out.write("\"></td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>\n");
      out.write("					<td width=\"70\" align=\"center\">Email</td>\n");
      out.write("					<td align=\"left\" width=\"330\"><input type=\"text\" size=\"40\"\n");
      out.write("						maxlength=\"30\" name=\"email\" value=\"");
      out.print(article.getEmail());
      out.write("\"></td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>\n");
      out.write("					<td width=\"70\" align=\"center\">내 용</td>\n");
      out.write("					<td align=\"left\" width=\"330\"><textarea name=\"content\"\n");
      out.write("							rows=\"13\" cols=\"40\">\n");
      out.write(" ");
      out.print(article.getContent());
      out.write("</textarea></td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>\n");
      out.write("					<td width=\"70\" align=\"center\">비밀번호</td>\n");
      out.write("					<td align=\"left\" width=\"330\"><input type=\"password\" size=\"8\"\n");
      out.write("						maxlength=\"12\" name=\"pass\"></td>\n");
      out.write("				</tr>\n");
      out.write("				<tr>\n");
      out.write("					<td colspan=2 align=\"center\">\n");
      out.write("						<input type=\"submit\" value=\"글수정\"> \n");
      out.write("						<input type=\"reset\"	value=\"다시작성\"> \n");
      out.write("						<input type=\"button\" value=\"목록보기\" onclick=\"document.location.href='mainPage.jsp?pageNum=");
      out.print(pageNum);
      out.write("'\">\n");
      out.write("					</td>\n");
      out.write("				</tr>\n");
      out.write("			</table>\n");
      out.write("		</form>\n");
      out.write("	</main>\n");
      out.write("	");

	} catch (Exception e) {
	}
	
      out.write('\n');
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
