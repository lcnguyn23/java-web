package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.loaibean;
import bean.sachbean;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class htsach
 */
@WebServlet("/htsach")
public class htsach extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public htsach() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();

    loaibo lbo = new loaibo();
    ArrayList<loaibean> dsloai = lbo.getloai();

    sachbo sbo = new sachbo();
    ArrayList<sachbean> dssach = sbo.getsach();

    String ml = request.getParameter("ml");
    String key = request.getParameter("txttk");

    if (ml != null)
      dssach = sbo.TimMa(ml);
    else if (key != null)
      dssach = sbo.Tim(key);

    request.setAttribute("dsloai", dsloai);
    request.setAttribute("dssach", dssach);
    RequestDispatcher rd = request.getRequestDispatcher("htsach.jsp");
    rd.forward(request, response);
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}
