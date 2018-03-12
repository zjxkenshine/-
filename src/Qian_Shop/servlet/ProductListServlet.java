package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import Goods.service.GoodsService;
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/produtclist.go")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
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
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//取值
			String querystring=request.getParameter("querystring");
			String typeid=request.getParameter("typeid");
			String query =request.getParameter("query");
			
			
		//	System.out.println("执行到此");
			GoodsService gs=new GoodsService();
			QueryService qs=new QueryService();
			List<Goods> lg=new ArrayList<Goods>();
			Client cl=(Client) request.getSession().getAttribute("client");
			
			if(querystring!=null&&!querystring.equals("")){
				if(cl!=null){
					GoodsLateQuery glq=new GoodsLateQuery();
					glq.setAddTime(pulicTime);
					glq.setClientId(cl.getClientId());
					glq.setQueryString(querystring);
					//获取最近搜索数<=3
					if(qs.getgoodslatequerynum(String.valueOf(cl.getClientId()))>=3){
						GoodsLateQuery glq1=qs.querygoodslatequery(String.valueOf(cl.getClientId())); //获取最早搜索
						GoodsLateQuery glq2=qs.querygoodslastquery(String.valueOf(cl.getClientId())); //获取最近一次搜索
						
						if(!querystring.equals(glq2.getQueryString())){      //最近搜索与搜索相同
							glq.setQueryId(glq1.getQueryId());
							qs.updategoodslatequery(glq);
						}
					
					}else{
						qs.addgoodslatequery(glq);
					}
				}
				lg=gs.querygoodsbystring(querystring);
				
			}
			if(typeid!=null){
				if(cl!=null){
					//获取搜索数量
					int num=qs.getgoodsquerynum(cl.getClientId(),typeid);
					//System.out.println(num);
					if(num==0){
						GoodsQuery gq=new GoodsQuery();
						gq.setClient(cl.getClientId());
						gq.setGoodsTypeId(Integer.parseInt(typeid));
						gq.setQueryNum(1);
						qs.addgoodsquery(gq);
					}else{
						num++;
						System.out.println(num);
						qs.updategoodsquerynum(num,typeid,cl.getClientId());
					}
				
				}
				lg=gs.querygoodsbytype(typeid);
			}
			
			if(query!=null){
				lg=gs.querygoodsbystring(query);
			}
			
			if(cl!=null){
	    		//获取最近搜索
				List<GoodsLateQuery> lglq=qs.querygoodslatequery(cl.getClientId());
				System.out.println(lg);
				
				
				request.setAttribute("goodslatequery", lglq);
    		}
			
			System.out.println(lg);
			
			//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
			
    		request.setAttribute("clientname",clientname);
			request.setAttribute("goodslist",lg);	
			request.getRequestDispatcher("qian/productlist.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
