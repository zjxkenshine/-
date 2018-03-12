package Goods.servlet;

import java.io.IOException;
import java.security.interfaces.DSAKey;
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

/**
 * Servlet implementation class GoodsListServlet
 */
@WebServlet("/goodslist.do")
public class GoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//商品列表
		try{
			//取值
			GoodsService gs=new GoodsService();
			List<Goods> lg=gs.queryallgoods1();
			//处理描述信息,防止CSS崩坏
    		if(lg!=null){
    			for(int i=0;i<lg.size();i++){
    				if(lg.get(i).getDiscripe().length()>10){
    					lg.get(i).setDiscripe(lg.get(i).getDiscripe().substring(0,10)+"...");
    				}
    			}
    		}
    		
    		//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
			
    		//获取Typename
    		List<GoodsType> lgt=gs.queryalltype();
    		Map<Integer,String> typename=new HashMap<Integer,String>();
    		for(int i=0;i<lgt.size();i++){
    			typename.put(lgt.get(i).getTypeId(),lgt.get(i).getTypeName());
    		}
    		
			request.setAttribute("typename", typename);
			request.setAttribute("clientname", clientname);
			request.setAttribute("goods", lg);
			request.getRequestDispatcher("hou/goodsList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
