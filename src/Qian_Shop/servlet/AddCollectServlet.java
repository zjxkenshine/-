package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.model.Collect;
import Client.model.Shop;
import Client.service.CollectService;
import Client.service.ShopService;

/**
 * Servlet implementation class AddCollectServlet
 */
@WebServlet("/addcollect.go")
public class AddCollectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCollectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//添加收藏
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String goodsid=request.getParameter("goodsid");
			
			//获取Client
			Client cl=(Client) request.getSession().getAttribute("client");
			
			
			//获取sh
			CollectService cs=new CollectService();
			Collect col=new Collect();
			
			col.setClientId(cl.getClientId());
			col.setGoodsId(Integer.parseInt(goodsid));
			col.setCollectTime(pulicTime);
			
			//判定是否有值
			List<Collect> ls=cs.queryallcollect();
			int flag=0;
			if(ls!=null){
				for(int i=0;i<ls.size();i++){
					if(ls.get(i).getGoodsId()==Integer.parseInt(goodsid)){
						flag=1;
						break;
					}
				}
			}
			
			System.out.println(flag);
			//添加
			if(flag==0){
				cs.addcollect(col);
				response.sendRedirect("hou/addCollectSuccess.jsp");
			}else if(flag>0){
				response.sendRedirect("hou/addCollectError.jsp");
			}
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
