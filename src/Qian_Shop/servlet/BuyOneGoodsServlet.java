package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.service.ClientService;
import Goods.model.Goods;
import Goods.service.GoodsService;
import Order.model.Order;
import Order.service.OrderService;

/**
 * Servlet implementation class BuyOneGoodsServlet
 */
@WebServlet("/buyonegoods.go")
public class BuyOneGoodsServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyOneGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//购买一件产品
		try{
			String id=request.getParameter("id");
			
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			

			//获取client信息
		//	ClientService cs=new ClientService();
			Client cl=(Client) request.getSession().getAttribute("client");
			
		
			
			//判断该商品是否存在或是本人发布
			GoodsService gs=new GoodsService();
			Goods good=gs.querygoods(id);
			if(good.getClientId()==cl.getClientId()||good.getSellStatus().equals("0")){
				
				response.sendRedirect("qian/buyError.jsp");
			}else{
			
			//删除该商品信息
			
			gs.updatesellstatus("0",id);
			
			
			//添加订单信息
			Order ord=new Order();
			ord.setAddTime(pulicTime);
			ord.setGoodsId(Integer.parseInt(id));
			ord.setGoodsName(good.getGoodsName());
			ord.setSaleClientId(good.getClientId());
			ord.setBuyClientId(cl.getClientId());
			OrderService os=new OrderService();
			
			//获取订单号
			Random rand = new Random();
			List<Order> lo=os.queryallorder();
			int orderid=0;
			while(true){
				 orderid = rand.nextInt(900000)+100000;
				int num=0;
				if(lo!=null){
				for(int i=0;i<lo.size();i++){
					if(lo.get(i).getOrderId()==orderid){
						num++;
						continue;
					}
				}
				}
				if(num==0){
					break;
				}
				
				
			}
			ord.setOrderId(orderid);
			System.out.println(ord);
			
			os.addorder(ord);
			os.updateorderstatus("2",String.valueOf(orderid));
			
			//跳转页面
			request.setAttribute("price",good.getPrice());
			request.setAttribute("orderid", orderid);
			request.getRequestDispatcher("qian/buySuccess.jsp").forward(request, response);
			}
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
