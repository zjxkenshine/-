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
 * Servlet implementation class ViewMessageServlet
 */
@WebServlet("/viewmessage.do")
public class ViewMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查看邮件
		try{
			//获取id
			String id=request.getParameter("messageid");
			
			MessageService ms=new MessageService();
			Message msg= ms.querymessage(id);
			
			ManagerService mas=new ManagerService();
			List<Manager> lm =mas.queryallmanager();
		
			//更新状态
			Manager ma = (Manager) request.getSession().getAttribute("user");
			if(msg.getToManagerId()==ma.getManagerId()){
				String a="0";
				ms.changereadstatus(id,a);
			}
			
			request.setAttribute("msg",msg);
			request.setAttribute("managerlist",lm);
			request.getRequestDispatcher("hou/viewMessage.jsp").forward(request, response);
					
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
