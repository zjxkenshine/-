package Qian_Shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.service.ClientService;
import Other.model.Province;
import Other.service.ClientAddressService;

/**
 * Servlet implementation class UpdateClientSetServlet
 */
@WebServlet("/updateclientset.go")
public class UpdateClientSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClientSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取客户信息
			Client cl=(Client) request.getSession().getAttribute("client");
			
			ClientService cs =new ClientService();
			
			Client cle=cs.queryclient(String.valueOf(cl.getClientId()));
			
			//获取省份信息
			ClientAddressService cas=new ClientAddressService();
			List<Province> lpro=cas.queryallprovince();
			
			request.setAttribute("lpro", lpro);
			request.setAttribute("client",cle );
			request.getRequestDispatcher("qian/updateclient.jsp").forward(request, response);
			
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
