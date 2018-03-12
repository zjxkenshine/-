package Manager.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class addManagerServlet
 */
@WebServlet("/addmanager.do")
public class AddManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//管理员添加
		System.out.println("执行管理员添加");
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);

			
			//取值
			String managername=request.getParameter("managername");
			String password=request.getParameter("password");
			String workerid=request.getParameter("workerid");
			String status=request.getParameter("status");
			String e_mail=request.getParameter("e_mail");
			String discripe=request.getParameter("discripe");
			
			//传值
			Manager manager = new Manager();
			manager.setDeleteStatus("1");
			manager.setDiscripe(discripe);
			manager.setE_mail(e_mail);
			manager.setManagerName(managername);
			manager.setPassword(password);
			manager.setRegisterTime(pulicTime);
			manager.setStatus(Integer.parseInt(status));
			manager.setWorkerId(Integer.parseInt(workerid));
			manager.setUpdateTime(pulicTime);
			System.out.println(manager);
			
			//更新日志表
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("添加");
			mo.setOperatList("管理员表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("添加了一条管理员信息");
			os.addmanageroperation(mo);
			
			//执行添加,跳转
			ManagerService ms=new ManagerService();
			ms.addmanager(manager);
			response.sendRedirect("hou/addSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
