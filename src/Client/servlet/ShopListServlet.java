package Client.servlet;

import java.io.IOException;
import java.util.ArrayList;
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
import Client.model.Shop;
import Client.service.ClientService;
import Client.service.CollectService;
import Client.service.ShopService;
import Goods.model.Goods;
import Goods.service.GoodsService;

/**
 * Servlet implementation class ShopListServlet
 */
@WebServlet("/shoplist.do")
public class ShopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//购物车列表
		try{
			//取值
			ClientService cs=new ClientService();
			ShopService ss=new ShopService();
			List<Shop> ls=ss.queryallshop();
		
    		
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
			request.setAttribute("shop",ls);
			request.getRequestDispatcher("hou/shopList.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
