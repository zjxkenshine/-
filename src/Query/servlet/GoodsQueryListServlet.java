package Query.servlet;

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
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class GoodsQueryListServlet
 */
@WebServlet("/goodsquerylist.do")
public class GoodsQueryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsQueryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//取值
			QueryService qs=new QueryService();
			List<GoodsQuery> lgq=qs.queryallgoodsquery();
			//处理描述信息,防止CSS崩坏
    	
    		
    		//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
			
    		//获取Typename
    		GoodsService gs=new GoodsService();
    		List<GoodsType> lgt=gs.queryalltype();
    		Map<Integer,String> typename=new HashMap<Integer,String>();
    		for(int i=0;i<lgt.size();i++){
    			typename.put(lgt.get(i).getTypeId(),lgt.get(i).getTypeName());
    		}
    		
			request.setAttribute("typename", typename);
			request.setAttribute("clientname", clientname);
			request.setAttribute("goodsquery", lgq);
			request.getRequestDispatcher("hou/goodsQueryList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
