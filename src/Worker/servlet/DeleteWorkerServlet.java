package Worker.servlet;

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
import Worker.service.WorkerService;

/**
 * Servlet implementation class DeketeWorkerServlet
 */
@WebServlet("/deleteworker.do")
public class DeleteWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWorkerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//删除员工
		
		System.out.println("执行员工删除");
		WorkerService ws=new WorkerService();
		ManagerService ms=new ManagerService();
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String id=request.getParameter("workerid");
			System.out.println(id);
			String b[]=id.split(",");
			for (int j = 0; j < b.length; j++) {
				if(!b[j].equals("")&&b[j]!=null){
					System.out.println(b[j]);
					ws.deleteWorker(b[j]);
					String workerid=b[j];
					ms.deletemanagerworkerid(workerid);
				}
			}
			//获总数量
			int count=Integer.parseInt(request.getParameter("count"));
			int nowpage=Integer.parseInt(request.getParameter("nowpage"));
			
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("员工表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			Page pb = ps.querypagesize(pa);
			int pagesize=Integer.parseInt(pb.getPageSize());
			
			//获取最大页
			int sumpage=(count-b.length)%pagesize==0?(count-b.length)/pagesize:(count-b.length)/pagesize+1;
			pa.setNowPage(nowpage>sumpage?sumpage:nowpage);
			
			//更新nowpage
			ps.updatenowpage(pa);
			
			//更新日志表
			if(id!=null&&!id.equals("")){
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("删除");
			mo.setOperatList("员工表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("删除了"+b.length+"条员工信息以及管理员信息，id="+id);
			os.addmanageroperation(mo);
			}
			
			request.getSession().setAttribute("flag","0");
			
			request.getRequestDispatcher("hou/deleteSuccess.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
