package Client.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.service.ClientService;
import Manager.model.Manager;
import Manager.service.ManagerService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class ChangeClientUseStatus
 */
@WebServlet("/changeclientusestatus.do")
public class ChangeClientUseStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeClientUseStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//改变客户状态
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//获取标识
			String id=request.getParameter("id");
			String status=request.getParameter("status");
			String nowpage=request.getParameter("nowpage");
			System.out.println(status+id+nowpage);
			ClientService cs=new ClientService();
			cs.changeuserstatus(status, id);
			
			
			//更新日志表
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("修改");
			mo.setOperatList("客户表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("修改了一条客户状态，id="+id);
			os.addmanageroperation(mo);
			response.sendRedirect("clientlist.do?nowPage="+nowpage);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}
	

}
