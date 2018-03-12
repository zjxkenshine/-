package Qian_Shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.service.ClientService;

/**
 * Servlet implementation class UpdateClientPasswordServlet
 */
@WebServlet("/updateclientpassword.go")
public class UpdateClientPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClientPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取密码
			String pass=request.getParameter("password");
			
			//获取client
			Client cl=(Client) request.getSession().getAttribute("client");
			
			
			
			ClientService cs=new ClientService();
			cs.upldateclientpassword(pass, String.valueOf(cl.getClientId()));
			
			response.sendRedirect("hou/updateSuccess.jsp");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
