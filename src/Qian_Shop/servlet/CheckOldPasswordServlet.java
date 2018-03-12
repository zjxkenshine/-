package Qian_Shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Client.model.Client;
import Client.service.ClientService;

/**
 * Servlet implementation class CheckOldPasswordServlet
 */
@WebServlet("/checkoldpassword.go")
public class CheckOldPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOldPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取clientid
			Client cl=(Client) request.getSession().getAttribute("client");
			
			//获取密码
			ClientService cs=new ClientService();
			Client client=cs.queryclient(String.valueOf(cl.getClientId()));
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
			Gson gson = new Gson();
			String pass=gson.toJson(client.getPassWord());
			out.write(pass);
			out.flush();
			out.close();
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
