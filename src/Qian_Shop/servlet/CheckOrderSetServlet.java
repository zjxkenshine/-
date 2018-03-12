package Qian_Shop.servlet;

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
import Client.model.Shop;
import Client.service.ClientService;
import Client.service.ShopService;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Goods.service.GoodsService;
import Other.dao.AddressDao;
import Other.model.Address;
import Other.service.AddressService;
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class CheckOrderSetServlet
 */
@WebServlet("/checkorderset.go")
public class CheckOrderSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOrderSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//订单确认
		try{
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
			
			
    		
			System.out.println(lg);
			System.out.println(ls);
			
			float sumprice=0;
			if(ls!=null){
				for(int i=0;i<lg.size();i++){
					for(int j=0;j<ls.size();j++){
						if(lg.get(i).getGoodsId()==ls.get(j).getGoodsId()){
							break;
						}
						
						if(j==ls.size()-1||ls.size()==0){
							
							lg.remove(i);
							i=i-1;
						}
					}
				}
			}else{
				lg=null;
			}
			
			if(lg!=null){
				for(int i=0;i<lg.size();i++){
					sumprice=sumprice+Float.parseFloat((String)lg.get(i).getPrice());
				}
				QueryService qs=new QueryService();
				if(cl!=null){
		    		//获取最近搜索
					List<GoodsLateQuery> lglq=qs.querygoodslatequery(cl.getClientId());
					System.out.println(lg);
					
					//获取总搜索
					List<GoodsQuery> lgl=qs.querygoodsquery(String.valueOf(cl.getClientId()));
					System.out.println(lg);
					
					
					request.setAttribute("goodslatequery",lglq);
					request.setAttribute("goodsquery", lgl);
	    		}
			}
			
			//获取地址
			AddressService as=new AddressService();
			List<Address> lad=as.queryaddressbyclientid(cl.getClientId());
		
			
			request.setAttribute("addresslist", lad);
			request.setAttribute("goodslist", lg);
			request.setAttribute("sumprice", sumprice);
			request.getRequestDispatcher("qian/shop-car1.jsp").forward(request, response);;
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
