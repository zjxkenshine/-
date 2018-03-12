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
import Page.service.PageService;

/**
 * Servlet implementation class CleanPageServlet
 */
@WebServlet("/cleanpage.do")
public class CleanPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CleanPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//清理页面
		try{
			
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//清理页面
			Manager ma=(Manager) request.getSession().getAttribute("user");
			PageService ps =new PageService();
			ps.updatepagesize(ma.getManagerId());
			
			//添加日志
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("清理");
			mo.setOperatList("无");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("清理了页面信息");
			os.addmanageroperation(mo);
			//跳转
			response.sendRedirect("hou/cleanSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
