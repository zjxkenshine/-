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
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Page.model.Page;
import Page.service.PageService;
import Worker.service.WorkerService;

/**
 * Servlet implementation class DeleteWorkerTypeServlet
 */
@WebServlet("/deleteworkertype.do")
public class DeleteWorkerTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWorkerTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//删除职位
		System.out.println("执行职位删除");
		WorkerService ws=new WorkerService();
		
		
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String id=request.getParameter("workertypeid");
			String b[]=id.split(",");
			for (int j = 0; j < b.length; j++) {
				if(!b[j].equals("")&&b[j]!=null){
					System.out.println(b[j]);
					ws.deleteworkertype(b[j]);
					//执行管理员改状态
					int workerid=Integer.parseInt(b[j]);
					ws.updateworkertype(workerid);
				}
			}
			//获总数量
		
			
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("职位表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			Page pb = ps.querypagesize(pa);
			int pagesize=Integer.parseInt(pb.getPageSize());
			
			//获取最大页
		
			//更新nowpage
			
			//更新日志表
			if(id!=null&&!id.equals("")){
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("删除");
			mo.setOperatList("职位表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("删除了"+b.length+"条职位信息，id="+id);
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
