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
 * Servlet implementation class MySelfServlet
 */
@WebServlet("/myself.go")
public class MySelfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MySelfServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//个人信息获取
		try{
			//获取客户信息
			Client cl=(Client) request.getSession().getAttribute("client");
			
			ClientService cs =new ClientService();
			
			Client cle=cs.queryclient(String.valueOf(cl.getClientId()));
			
			request.setAttribute("client",cle );
			request.getRequestDispatcher("qian/myself.jsp").forward(request, response);
			
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
