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
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class CleanQueryServlet
 */
@WebServlet("/cleanquery.do")
public class CleanQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CleanQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//加载
		Date nowTime =new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String pulicTime = sf.format(nowTime);
		
		//清空所有查询
		request.getSession().setAttribute("managerquery",null);
		request.getSession().setAttribute("workerquery",null);
		request.getSession().setAttribute("sharefilequery",null);
		request.getSession().setAttribute("sharepicquery",null);
		request.getSession().setAttribute("manageroperationquery",null);
		request.getSession().setAttribute("messagequery",null);
		request.getSession().setAttribute("clientquery",null);
		
		//添加日志
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			Manager ma=(Manager) request.getSession().getAttribute("user");
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("清理");
			mo.setOperatList("无");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("清理了查询信息");
			try {
				os.addmanageroperation(mo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				request.setAttribute("message",e.getMessage());	
				request.getRequestDispatcher("hou/error.jsp").forward(request, response);
			}
		
		
		//跳转
		response.sendRedirect("hou/cleanSuccess.jsp");
	}

}
