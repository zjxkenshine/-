package Manager.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.java2d.loops.MaskBlit;
import util.DBUtil;
import Manager.model.Manager;
import Manager.service.ManagerService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Page.model.Page;
import Page.service.PageService;
import Worker.service.WorkerService;

/**
 * Servlet implementation class DeleteManager
 */
@WebServlet(name = "DeleteManagerServlet", urlPatterns = { "/deletemanager.do" })
public class DeleteManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//删除管理员
		System.out.println("执行管理员删除");
		ManagerService ms=new ManagerService();
		PageService ps=new PageService();
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String id=request.getParameter("managerid");
			System.out.println(id);
			String b[]=id.split(",");
			for (int j = 0; j < b.length; j++) {
				if(!b[j].equals("")&&b[j]!=null){
//					System.out.println(b[j]);
					ms.deletemanager(b[j]);
				}
			}
			
			int count=Integer.parseInt(request.getParameter("count"));
			int nowpage=Integer.parseInt(request.getParameter("nowpage"));
			
			//获取page表信息
			Page pa=new Page();
			pa.setPageName("管理员表");
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
			mo.setOperatList("管理员表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("删除了"+b.length+"条管理员信息，id="+id);
			os.addmanageroperation(mo);
			}
			request.getSession().setAttribute("flag","0" );
			
			request.getRequestDispatcher("hou/deleteSuccess.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}
	
	

}
