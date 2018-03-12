package Qian_Shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.service.ShopService;

/**
 * Servlet implementation class DeleteShopCarServlet
 */
@WebServlet("/deleteshopcar.go")
public class DeleteShopCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteShopCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//删除购物车
		try{
			//goodsid
			String id=request.getParameter("id");
			
			//删除shop
			ShopService ss=new ShopService();
			ss.deleteshopbygoodsid(Integer.parseInt(id));
			
			//跳转
			response.sendRedirect("shopcarset.go");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
