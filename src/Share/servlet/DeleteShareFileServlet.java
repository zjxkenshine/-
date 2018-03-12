package Share.servlet;

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
import Share.service.ShareService;

/**
 * Servlet implementation class DeleteShareFileServlet
 */
@WebServlet("/deletesharefile.do")
public class DeleteShareFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteShareFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			//执行删除
			int id=Integer.parseInt(request.getParameter("fileid"));
			ShareService ss=new ShareService();
			ss.deletesharefile(String.valueOf(id));
			
			
			int count=Integer.parseInt(request.getParameter("count"));
			int nowpage=Integer.parseInt(request.getParameter("nowpage"));
			
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("文件共享表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			Page pb = ps.querypagesize(pa);
			int pagesize=Integer.parseInt(pb.getPageSize());
			
			//获取最大页
			int sumpage=(count-1)%pagesize==0?(count-1)/pagesize:(count-1)/pagesize+1;
			pa.setNowPage(nowpage>sumpage?sumpage:nowpage);
			
			//更新nowpage
			ps.updatenowpage(pa);
			
			request.getSession().setAttribute("flag","0" );
			
			//更新日志表
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("删除");
			mo.setOperatList("共享表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("取消了一个文件共享,id="+id);
			os.addmanageroperation(mo);
			
			//更新当前页
			request.getRequestDispatcher("hou/cancelSuccess.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
