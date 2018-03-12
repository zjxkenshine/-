package Qian_Shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Other.model.Address;
import Other.service.AddressService;

/**
 * Servlet implementation class AddAddressServlet
 */
@WebServlet("/addaddress.go")
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//添加收货地址
			AddressService as=new AddressService();
			
			//获取client
			Client cl=(Client) request.getSession().getAttribute("client");
			
			String address=request.getParameter("address");
			String name=request.getParameter("name");
			Address add=new Address();
			add.setName(name);
			add.setAddress(address);
			add.setClientId(cl.getClientId());
			as.addaddress(add);
			
			response.sendRedirect("hou/addSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
