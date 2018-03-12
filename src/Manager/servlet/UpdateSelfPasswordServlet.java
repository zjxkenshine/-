package Manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;

/**
 * Servlet implementation class UpdateSelfPasswordServlet
 */
@WebServlet("/updateselfpassword.do")
public class UpdateSelfPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSelfPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//更新密码
		try{
			//接值
			String password = request.getParameter("password");
			ManagerService ms=new ManagerService();
			Manager ma =(Manager) request.getSession().getAttribute("user");
			
			//修改
			ms.updateselfpassword(password, ma.getManagerId());
			response.sendRedirect("hou/updateSuccess.jsp");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
