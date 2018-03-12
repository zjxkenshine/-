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
import sun.nio.cs.MS1250;

/**
 * Servlet implementation class ProDeleteStatusServlet
 */
@WebServlet("/prodeletestatus.do")
public class ProDeleteStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProDeleteStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//多重删除
			
			try{
				//加载
				Date nowTime =new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String pulicTime = sf.format(nowTime);
				
			//	System.out.println("执行一键删除权限");
				String a=request.getParameter("statusid");
				ManagerService ms=new ManagerService();
				String b[]=a.split(",");
				for (int j = 0; j < b.length; j++) {
					System.out.println(j);
					if(!b[j].equals("")&&b[j]!=null){
		//				System.out.println(b[j]);
						ms.deleteStatus(Integer.parseInt(b[j]));
						Manager manager =new Manager();
						manager.setStatus(Integer.parseInt(b[j]));
						ms.updatemanagerstatus1(manager);
					}
				}
				
				//获总数量
				
				
				//获取page表信息
				PageService ps=new PageService();
				Page pa=new Page();
				pa.setPageName("权限表");
				Manager ma = (Manager)request.getSession().getAttribute("user");
				pa.setManagerId(ma.getManagerId());
				Page pb = ps.querypagesize(pa);
				
				//获取最大页		
			
				//更新nowpage
				ps.updatenowpage(pa);
				request.getSession().setAttribute("flag","0" );
				
				//更新日志表
				if(a!=null&&!a.equals("")){
				OperationService os =new OperationService();
				ManagerOperation mo=new ManagerOperation();
				mo.setManagerId(ma.getManagerId());
				mo.setOperationType("删除");
				mo.setOperatList("权限表");
				mo.setOperationDay(pulicTime);
				mo.setOperationTime(pulicTime);
				mo.setDiscripe("删除了"+b.length+"条权限信息，id="+a);
				os.addmanageroperation(mo);
				}
				//跳转
				request.getRequestDispatcher("hou/deleteSuccess.jsp").forward(request, response);
			}catch(Exception e){
				request.setAttribute("message",e.getMessage());	
				request.getRequestDispatcher("hou/error.jsp").forward(request, response);
			}
			
	}

}
