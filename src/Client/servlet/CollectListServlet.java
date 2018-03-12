package Client.servlet;

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
import Client.model.Collect;
import Client.service.ClientService;
import Client.service.CollectService;
import Goods.model.Goods;
import Goods.service.GoodsService;
import Order.model.Order;
import Order.model.OrderStatus;
import Order.service.OrderService;

/**
 * Servlet implementation class CollectListServlet
 */
@WebServlet("/collectlist.do")
public class CollectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//收藏列表
		try{
			//取值
			ClientService cs=new ClientService();
			CollectService cls=new CollectService();
			List<Collect> lcl=cls.queryallcollect();
		
    		
    		//获取Client名
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
			
    		//获取订单类型
    		GoodsService gs=new GoodsService();
    		List<Goods> lg= gs.queryallgoods1();
    		Map<Integer,String> goodsname=new HashMap<Integer,String>();
    		for(int i=0;i<lg.size();i++){
    			goodsname.put(lg.get(i).getGoodsId(),lg.get(i).getGoodsName());
    		}
    		
			request.setAttribute("goodsname", goodsname);
			request.setAttribute("clientname", clientname);
			request.setAttribute("collect",lcl);
			request.getRequestDispatcher("hou/collectList.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
