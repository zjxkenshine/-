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
import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Page.model.Page;
import Page.service.PageService;

/**
 * Servlet implementation class AddStatusServlet
 */
@WebServlet("/addstatus.do")
public class AddStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//添加权限
		String status[] = request.getParameterValues("status");
	//	System.out.println(status[0]);
		ManagerService ms=new ManagerService();
		ManagerStatus mst=new ManagerStatus();
		String statusname=request.getParameter("statusname");
		String discripe=request.getParameter("discripe");
		Date nowTime =new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String pulicTime = sf.format(nowTime);
		try{
			//处理权限，存入类
			String statustype="";
			for(String i:status){
				statustype+=i+",";
			}
			mst.setNumber("0");
			mst.setManagerStatusName(statusname);
			mst.setDiscription(discripe);
			mst.setStatusType(statustype);
			mst.setAddTime(pulicTime);
	//		System.out.println(mst);
			//执行添加
			ms.addstatus(mst);
			
			//更新日志表
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("添加");
			mo.setOperatList("权限表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("添加了一条权限信息");
			os.addmanageroperation(mo);
			
			response.sendRedirect("hou/addSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
