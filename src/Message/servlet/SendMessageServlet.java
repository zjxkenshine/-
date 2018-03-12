package Message.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Message.dao.MessageDao;
import Message.model.Message;
import Message.service.MessageService;

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/sendmessage.do")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//发送邮件处理
		
		try{
			
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			MessageService ms=new MessageService();
			//取值
			String tomanagerid=request.getParameter("tomanager");
			String title = request.getParameter("title");
			String discripe = request.getParameter("discripe");
			String file = request.getParameter("file");
		//	System.out.println(tomanagerid+title+discripe+file);
			
			//存值
			Manager ma = (Manager)request.getSession().getAttribute("user");
			Message msg = new Message();
			msg.setDiscripe(discripe);
			msg.setFileAddress(file);
			msg.setTitle(title);
			msg.setToManagerId(Integer.parseInt(tomanagerid));
			msg.setSendTime(pulicTime);
			msg.setSendDay(pulicTime);
			msg.setFromManagerId(ma.getManagerId());
			System.out.println(msg);
			
			ms.addmessage(msg);
			response.sendRedirect("hou/sendSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
