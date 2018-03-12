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
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class ShopCarSetServlet
 */
@WebServlet("/shopcarset.go")
public class ShopCarSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopCarSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取购物车信息
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
			
			//获取Typename
    		List<GoodsType> lgt=gs.queryalltype();
    		Map<Integer,String> typename=new HashMap<Integer,String>();
    		for(int i=0;i<lgt.size();i++){
    			typename.put(lgt.get(i).getTypeId(),lgt.get(i).getTypeName());
    		}
    		
    		//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
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
			
			request.setAttribute("typename", typename);
			request.setAttribute("clientname", clientname);
			request.setAttribute("goodslist", lg);
			request.setAttribute("sumprice", sumprice);
			request.getRequestDispatcher("qian/shop_car.jsp").forward(request, response);;
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
