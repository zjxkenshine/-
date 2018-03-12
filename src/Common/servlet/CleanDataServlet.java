package Common.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Message.service.MessageService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class CleanDataServlet
 */
@WebServlet("/cleandata.do")
public class CleanDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CleanDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//清理数据库
		try{
			
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//清理邮件表
			MessageService ms=new MessageService();
			ms.cleanmessage();
			
			//添加日志
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			Manager ma=(Manager) request.getSession().getAttribute("user");
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("清理");
			mo.setOperatList("无");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("清理了数据库信息");
			os.addmanageroperation(mo);
			//跳转
			response.sendRedirect("hou/cleanSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
