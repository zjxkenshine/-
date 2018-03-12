package Message.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class SendAllMessage
 */
@WebServlet(name = "SendAllMessageServlet", urlPatterns = { "/sendallmessage.do" })
public class SendAllMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendAllMessage() {
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
			
			MessageService ms=new MessageService();
			//取值
			String title = request.getParameter("title");
			String discripe = request.getParameter("discripe");
			String file = request.getParameter("file");
		//	System.out.println(tomanagerid+title+discripe+file);
			
			//获取除自己外所有管理员信息
			Manager ma=	(Manager) request.getSession().getAttribute("user");
			ManagerService mas=new ManagerService();
			List<Manager> lm =mas.queryallmanager();
			if(lm!=null){
				for(int i=0;i<lm.size();i++){
					if(lm.get(i).getManagerId()==ma.getManagerId()){
						lm.remove(i);
					}
				}
			}
			//存值
			Message msg = new Message();
			msg.setDiscripe(discripe);
			msg.setFileAddress(file);
			msg.setTitle(title);
			msg.setSendTime(pulicTime);
			msg.setSendDay(pulicTime);
			msg.setFromManagerId(ma.getManagerId());
			for(int i=0;i<lm.size();i++){	
				msg.setToManagerId(lm.get(i).getManagerId());
				ms.addmessage(msg);
			}
			
			//更新日志表
			Manager mans = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(mans.getManagerId());
			mo.setOperationType("添加");
			mo.setOperatList("个人邮件表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("群发了一则通知");
			os.addmanageroperation(mo);
			
			response.sendRedirect("hou/sendSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
