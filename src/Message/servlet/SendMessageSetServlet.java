package Message.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import Manager.model.Manager;
import Manager.service.ManagerService;

/**
 * Servlet implementation class SendMessageSetServlet
 */
@WebServlet("/sendmessagset.do")
public class SendMessageSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//发送邮件初始化
				try{
						//获取除自己外所有管理员信息
					Manager ma=	(Manager) request.getSession().getAttribute("user");
					ManagerService ms=new ManagerService();
					List<Manager> lm =ms.queryallmanager();
					if(lm!=null){
						for(int i=0;i<lm.size();i++){
							if(lm.get(i).getManagerId()==ma.getManagerId()){
								lm.remove(i);
							}
						}
					}
				
				
				
				request.setAttribute("managerlist",lm);
				request.getRequestDispatcher("hou/sendMessage.jsp").forward(request, response);
				}catch(Exception e){
					request.setAttribute("message",e.getMessage());	
					request.getRequestDispatcher("hou/error.jsp").forward(request, response);
				}
			}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
}