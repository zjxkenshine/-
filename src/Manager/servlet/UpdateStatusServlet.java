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
 * Servlet implementation class UpdateStatusServlet
 */
@WebServlet("/updatestatus.do")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//更新权限
		//	System.out.println("执行servlet");
			String status[] = request.getParameterValues("status");
		//	System.out.println(status[0]);
			ManagerService ms=new ManagerService();
			int statusid=Integer.parseInt(request.getParameter("statusid"));
			String statusname=request.getParameter("statusname");
			String discripe=request.getParameter("discripe");
			try{
				//加载
				Date nowTime =new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String pulicTime = sf.format(nowTime);
				
				String statustype="";
				try{
					if(status.length>0){
						for(String i:status){
							statustype+=i+",";
						}
					}
				}catch(Exception e){
					statustype="0";
				}
				ManagerStatus mst=new ManagerStatus();
				mst.setManagerStatusId(statusid);
				mst.setManagerStatusName(statusname);
				mst.setDiscription(discripe);
				mst.setStatusType(statustype);
				System.out.println(mst);
		
				
				//获取page表信息
				PageService ps=new PageService();
				Page pa=new Page();
				pa.setPageName("权限表");
				Manager ma = (Manager)request.getSession().getAttribute("user");
				pa.setManagerId(ma.getManagerId());
				
				//获取最大页
				
				//更新日志表
				OperationService os =new OperationService();
				ManagerOperation mo=new ManagerOperation();
				mo.setManagerId(ma.getManagerId());
				mo.setOperationType("修改");
				mo.setOperatList("权限表");
				mo.setOperationDay(pulicTime);
				mo.setOperationTime(pulicTime);
				mo.setDiscripe("修改了一条权限信息，id="+statusid);
				os.addmanageroperation(mo);
				
				//更新nowpage
				ps.updatenowpage(pa);
				ms.updateStatus(mst);
				request.getSession().setAttribute("flag", "0");
				response.sendRedirect("hou/updateSuccess.jsp");
			}catch(Exception e){
				request.setAttribute("message",e.getMessage());	
				request.getRequestDispatcher("hou/error.jsp").forward(request, response);
			}
	}

}
