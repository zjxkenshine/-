package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Goods.model.Goods;
import Goods.service.GoodsService;

/**
 * Servlet implementation class AddGoodsServlet
 */
@WebServlet("/addgoods.go")
public class AddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//取值
			String goodsname=request.getParameter("goodsname");
			String price=request.getParameter("price");
			String goodstype=request.getParameter("goodstype");
			String address=request.getParameter("address");
			String goodspic=request.getParameter("goodspic");
			String discripe=request.getParameter("discripe");
			
			//获取client
			Client client=(Client) request.getSession().getAttribute("client");
			
			//传值
			Goods go=new Goods();
			go.setClientId(client.getClientId());
			go.setGoodsName(goodsname);
			go.setLocation(address);
			go.setPrice(price);
			go.setPicture(goodspic);
			go.setTypeId(Integer.parseInt(goodstype));
			go.setAddTime(pulicTime);
			go.setAddDay(pulicTime);
			go.setDiscripe(discripe);
			
			
			//传值添加
			GoodsService gs=new GoodsService();
			gs.addgoods(go);
			
			
			response.sendRedirect("hou/addSuccess.jsp");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
