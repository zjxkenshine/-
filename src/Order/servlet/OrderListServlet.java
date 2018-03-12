package Order.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.service.ClientService;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Goods.service.GoodsService;
import Order.model.Order;
import Order.model.OrderStatus;
import Order.service.OrderService;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderlist.do")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//订单列表
		try{
			//取值
			OrderService os=new OrderService();
			List<Order> lo=os.queryallorder();
		
    		
    		//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
			
    		//获取订单类型
    		List<OrderStatus> lgt=os.queryallstatus();
    		Map<Integer,String> typename=new HashMap<Integer,String>();
    		for(int i=0;i<lgt.size();i++){
    			typename.put(lgt.get(i).getOrderStatusId(),lgt.get(i).getOrderStatusName());
    		}
    		
			request.setAttribute("status", typename);
			request.setAttribute("clientname", clientname);
			request.setAttribute("order",lo);
			request.getRequestDispatcher("hou/orderList.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
