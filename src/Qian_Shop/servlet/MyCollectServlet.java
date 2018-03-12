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
import Client.model.Collect;
import Client.service.ClientService;
import Client.service.CollectService;
import Goods.model.Goods;
import Goods.service.GoodsService;

/**
 * Servlet implementation class MyCollectServlet
 */
@WebServlet("/mycollect.go")
public class MyCollectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCollectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//获取客户信息
			Client cl=(Client) request.getSession().getAttribute("client");
			
			//获取Collect
			CollectService cos=new CollectService();
			List<Collect> lco=cos.querycollectbyclientid(cl.getClientId());
			
			//获取Goods名
    		GoodsService gs=new GoodsService();
    		List<Goods> lg=gs.queryallgoods1();
    		Map<Integer,String> goodsname=new HashMap<Integer,String>();
    		for(int i=0;i<lg.size();i++){
    			goodsname.put(lg.get(i).getGoodsId(),lg.get(i).getGoodsName());
    		}
			
    //		System.out.println(goodsname);
    		request.setAttribute("goodsname", goodsname);
			request.setAttribute("collectlist",lco );
			request.getRequestDispatcher("qian/mycollect.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
