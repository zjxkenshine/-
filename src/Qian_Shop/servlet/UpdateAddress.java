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
 * Servlet implementation class UpdateAddress
 */
@WebServlet("/updateaddress.go")
public class UpdateAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			AddressService as=new AddressService();
			String id=request.getParameter("addressid");
			String address=request.getParameter("address");
			String name=request.getParameter("name");
			
			Client cl=(Client) request.getSession().getAttribute("client");
			Address add=new Address();
			add.setAddressId(Integer.parseInt(id));
			add.setAddress(address);
			add.setName(name);
			add.setClientId(cl.getClientId());
			
			as.updateaddress(add);
			response.sendRedirect("hou/updateSuccess.jsp");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
