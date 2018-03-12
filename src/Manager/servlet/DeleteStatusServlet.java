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
import Page.model.Page;
import Page.service.PageService;

/**
 * Servlet implementation class DeleteStatusServlet
 */
@WebServlet("/deletestatus.do")
public class DeleteStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//删除权限
		System.out.println("执行权限删除");
		try{
			
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//执行删除
			int id=Integer.parseInt(request.getParameter("statusid"));
			ManagerService ms=new ManagerService();
			ms.deleteStatus(id);
			
			//执行管理员改状态
			Manager manager =new Manager();
			manager.setStatus(id);
			ms.updatemanagerstatus1(manager);
			
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("权限表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			
			//获取最大页
			
			//更新nowpage
			ps.updatenowpage(pa);
			
			request.getSession().setAttribute("flag","0" );
			
			//更新日志表
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("删除");
			mo.setOperatList("权限表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("删除了一条权限信息,id="+id);
			os.addmanageroperation(mo);
			
			//更新当前页
			request.getRequestDispatcher("hou/deleteSuccess.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
