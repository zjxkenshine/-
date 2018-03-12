package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.model.Shop;
import Client.service.ShopService;
import Goods.model.Goods;
import Goods.service.GoodsService;
import Order.model.Order;
import Order.service.OrderService;

/**
 * Servlet implementation class BuyGoodsServlet
 */
@WebServlet("/buygoods.go")
public class BuyGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//购买商品
		try{
			
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//获取client
			Client cl=(Client) request.getSession().getAttribute("client");
			
			//获取所有goods
			List<Goods> lg=new ArrayList<Goods>();
			GoodsService gs=new GoodsService();
			lg=gs.queryallgoods();
			
			//获取shoplist
			List<Shop> ls=new ArrayList<Shop>();
			ShopService ss=new ShopService();
			if(cl!=null){
				ls=ss.queryallshop();
			}
			
			
			String discripe=request.getParameter("discripe");
			
			System.out.println(lg);
			System.out.println(ls);
			
			float sumprice=0;       //总价格
			if(ls!=null){
				for(int i=0;i<lg.size();i++){
					for(int j=0;j<ls.size();j++){
						if(lg.get(i).getGoodsId()==ls.get(j).getGoodsId()){
							sumprice=sumprice+Float.parseFloat(lg.get(i).getPrice());
							break;
						}
						
						if(j==ls.size()-1||ls.size()==0){
							
							lg.remove(i);
							i=i-1;
						}
					}
				}
			}else{											//lg为购物车里的货物列表
				lg=null;
			}
			
			List<Integer> lorder=new ArrayList<Integer>();
			
			if(lg!=null){
			for(int i=0;i<lg.size();i++){
				
				//删除该商品信息
				
				gs.updatesellstatus("0",String.valueOf(lg.get(i).getGoodsId()));
				
				//添加订单信息
				Order ord=new Order();
				ord.setAddTime(pulicTime);
				ord.setGoodsId(lg.get(i).getGoodsId());
				ord.setGoodsName(lg.get(i).getGoodsName());
				ord.setSaleClientId(lg.get(i).getClientId());
				ord.setBuyClientId(cl.getClientId());
				OrderService os=new OrderService();
				ord.setDiscripe(discripe);
				
				//获取订单号
				Random rand = new Random();
				List<Order> lo=os.queryallorder();
				int orderid=0;
				while(true){
					 orderid = rand.nextInt(900000)+100000;
					int num=0;
					if(lo!=null){
					for(int j=0;j<lo.size();j++){
						if(lo.get(j).getOrderId()==orderid){
							num++;
							continue;
						}
					}
					}
					if(num==0){
						lorder.add(orderid);
						break;
					}
					
					
				}
				ord.setOrderId(orderid);
				System.out.println(ord);
				
				//根据goodsid获取订单
				
				os.addorder(ord);
				os.updateorderstatus("2",String.valueOf(orderid));
			}
			}
			
			//清空购物车
			ss.deleteshopbyclientid(cl.getClientId());
			
			//传值
			System.out.println(lorder);
			request.setAttribute("sumprice", sumprice);
			request.setAttribute("orderlist",lorder );
			request.getRequestDispatcher("qian/buyAllSuccess.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
