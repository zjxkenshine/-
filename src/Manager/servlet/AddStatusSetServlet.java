package Manager.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStatusSetServlet
 */
@WebServlet("/addstatusset.do")
public class AddStatusSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStatusSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//添加权限设置
		String count =request.getParameter("count");
		String nowpage=request.getParameter("nowpage");
		//传值，跳转
		request.setAttribute("count",count);
		request.setAttribute("nowpage", nowpage);
		request.getRequestDispatcher("hou/addStatus.jsp").forward(request, response);
	}

}