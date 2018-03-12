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
import Client.model.Shop;
import Client.service.ShopService;
import Goods.model.Goods;
import Goods.service.GoodsService;

/**
 * Servlet implementation class AddShopCarServlet
 */
@WebServlet("/addshopcar.go")
public class AddShopCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShopCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//添加购物车
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String goodsid=request.getParameter("goodsid");
			
			//获取Client
			Client cl=(Client) request.getSession().getAttribute("client");
			
			
			//获取sh
			ShopService ss=new ShopService();
			Shop sh=new Shop();
			
			sh.setClientId(cl.getClientId());
			sh.setGoodsId(Integer.parseInt(goodsid));
			sh.setAddTime(pulicTime);
			//判定是否有值
			List<Shop> ls=ss.queryallshop();
			int flag=0;
			if(ls!=null){
				for(int i=0;i<ls.size();i++){
					if(ls.get(i).getGoodsId()==Integer.parseInt(goodsid)){
						flag=1;
						break;
					}
				}
			}
			
			//判断是否是自己卖的
			GoodsService gs=new GoodsService();
			Goods go=gs.querygoods(goodsid);
			if(cl.getClientId()==go.getClientId()){
				flag=2;
			}
			
			System.out.println(flag);
			//添加
			if(flag==0){
				ss.addshop(sh);
				response.sendRedirect("hou/addShopSuccess.jsp");
			}else if(flag==1){
				response.sendRedirect("hou/addShopError.jsp");
			}else if(flag==2){
				response.sendRedirect("hou/addShopError2.jsp");
			}
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
