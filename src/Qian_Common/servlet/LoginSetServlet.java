package Qian_Common.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Client.model.Client;
import Client.service.ClientService;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Goods.service.GoodsService;
import Qian_Message.model.QianMessage;
import Qian_Message.service.QianMessageService;
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.service.QueryService;

/**
 * Servlet implementation class LoginSetServlet
 */
@WebServlet("/loginset.go")
public class LoginSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(30*60); //设置session时间
		
		try{
			String e_mail=request.getParameter("e_mail");
			ClientService cs=new ClientService();
			Client cl= cs.queryClientbye_mail(e_mail);
			
			//存入消息信息
			Map<String,String> qianmessage=new HashMap<String, String>();
			QianMessageService qms=new QianMessageService();
			List<QianMessage> lqm=qms.queryallqianmessage();
			for(int i=0;i<lqm.size();i++){
				qianmessage.put(lqm.get(i).getMessageName(), lqm.get(i).getMessageValue());
			}
			
		
			session.setAttribute("qianmessage", qianmessage);
			session.setAttribute("client", cl);
			response.sendRedirect("qian/index.jsp");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
