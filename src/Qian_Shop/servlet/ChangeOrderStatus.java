package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Goods.service.GoodsService;
import Order.model.Order;
import Order.service.OrderService;

/**
 * Servlet implementation class ChangeOrderStatus
 */
@WebServlet("/changeorderstatus2.go")
public class ChangeOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOrderStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//获取status,id值
			String status=request.getParameter("status");
			String id=request.getParameter("id");
			
			//更改状态
			OrderService os=new OrderService();
			os.updateorderstatus(status, id);
			
			os.updatefinishtime(pulicTime, id);
			
			Order ord=os.queryorderbyorderid(id);
			
			//更改商品状态
			GoodsService gs=new GoodsService();
			gs.updatesellstatus("1",String.valueOf(ord.getGoodsId()));
		
			
			response.sendRedirect("mysale.go");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
