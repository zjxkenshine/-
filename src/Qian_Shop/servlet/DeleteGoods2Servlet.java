package Qian_Shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Goods.model.Goods;
import Goods.service.GoodsService;

/**
 * Servlet implementation class DeleteGoods2Servlet
 */
@WebServlet("/deletegoods.go")
public class DeleteGoods2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteGoods2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取id
			String id=request.getParameter("id");
			System.out.println(id);
			//删除
			GoodsService gs=new GoodsService();
			gs.deletegoods(id);
			
			response.sendRedirect("mygoods.go");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取id
			String id=request.getParameter("id");
			System.out.println(id);
			//删除
			GoodsService gs=new GoodsService();
			gs.deletegoods(id);
			
			response.sendRedirect("mygoods.go");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
