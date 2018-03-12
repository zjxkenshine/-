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
import Client.service.ClientService;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Goods.service.GoodsService;
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class EsShopServlet
 */
@WebServlet("/es_shop.go")
public class EsShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EsShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取所有商品
			GoodsService gs=new GoodsService();
			List<Goods> lgoods=gs.queryallgoods();
			
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
    		
    		
    		QueryService qs=new QueryService();
			Client cl=(Client) request.getSession().getAttribute("client");
    		if(cl!=null){
	    		//获取最近搜索
				List<GoodsLateQuery> lg=qs.querygoodslatequery(cl.getClientId());
				System.out.println(lg);
				
				//获取总搜索
				List<GoodsQuery> lgl=qs.querygoodsquery(String.valueOf(cl.getClientId()));
				System.out.println(lg);
				
				
				request.setAttribute("goodslatequery", lg);
				request.setAttribute("goodsquery", lgl);
    		}
    		request.setAttribute("clientname", clientname);
    		request.setAttribute("lgoods", lgoods);
    		request.setAttribute("typelist", lgt);
    		request.setAttribute("typename", typename);
			request.getRequestDispatcher("qian/es_shop.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
