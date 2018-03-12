package Qian_Shop.servlet;

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
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class ProductAllSetServlet
 */
@WebServlet("/productallset.go")
public class ProductAllSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAllSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//商品详情设置
		try{
			String id=request.getParameter("goodsid");
			GoodsService gs=new GoodsService();
			Goods go=gs.querygoods(id);
			
			//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
    		
    		//获取其他商品
    		List<Goods> lg=gs.querygoodsbyclientid(go.getClientId());
    		
    		//获取Typename
    		List<GoodsType> lgt=gs.queryalltype();
    		Map<Integer,String> typename=new HashMap<Integer,String>();
    		for(int i=0;i<lgt.size();i++){
    			typename.put(lgt.get(i).getTypeId(),lgt.get(i).getTypeName());
    		}
    		
    		
    		QueryService qs=new QueryService();
			Client cl=(Client) request.getSession().getAttribute("client");
    		if(cl!=null){
	    		//获取最近搜索
				List<GoodsLateQuery> lglq=qs.querygoodslatequery(cl.getClientId());
				System.out.println(lg);
				
				//获取总搜索
				List<GoodsQuery> lgl=qs.querygoodsquery(String.valueOf(cl.getClientId()));
				System.out.println(lg);
				
				
				request.setAttribute("goodslatequery", lglq);
				request.setAttribute("goodsquery", lgl);
    		}
			
			System.out.println(go);
			request.setAttribute("goodslist", lg);
			request.setAttribute("typename", typename);
			request.setAttribute("clientname", clientname);
			request.setAttribute("goods", go);
			request.getRequestDispatcher("qian/productall.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
