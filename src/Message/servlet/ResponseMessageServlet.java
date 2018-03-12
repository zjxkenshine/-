package Message.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;
import Message.model.Message;
import Message.service.MessageService;

/**
 * Servlet implementation class ResponseMessageServlet
 */
@WebServlet("/responsemessage.do")
public class ResponseMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResponseMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try{
		//获取除自己外所有管理员信息
		System.out.println("发送邮件");
	//	Manager ma=	(Manager) request.getSession().getAttribute("user");
		ManagerService ms=new ManagerService();
		List<Manager> lm =ms.queryallmanager();
		
		//获取回复人信息
		MessageService mes=new MessageService();
		String id=request.getParameter("messageid");	
		Message msg = mes.querymessage(id);
		
		request.setAttribute("frommanagerid",msg.getFromManagerId());
		request.setAttribute("managerlist",lm);
		request.getRequestDispatcher("hou/responseMessage.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}


}
