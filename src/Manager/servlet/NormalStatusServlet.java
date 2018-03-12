package Manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Page.model.Page;
import Page.service.PageService;

/**
 * Servlet implementation class NormalStatusServlet
 */
@WebServlet("/updatenormalstatusset.do")
public class NormalStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NormalStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取普通权限
		String id=request.getParameter("statusid");
		//	System.out.println(id);
			ManagerService ms=new ManagerService();
			try{
				ManagerStatus mst=ms.querystatus(id);
		//		System.out.println(mst);
				String status[]=mst.getStatusType().split(",");
			//	System.out.println(status[1]);
				
			
				String nowpage=request.getParameter("nowpage");
				//传值，跳转
			
				request.setAttribute("nowpage", nowpage);
				
				request.setAttribute("list",mst);
				request.setAttribute("status", status);
				request.getRequestDispatcher("hou/updateStatus.jsp").forward(request, response);
			}catch(Exception e){
				request.setAttribute("message",e.getMessage());	
				request.getRequestDispatcher("hou/error.jsp").forward(request, response);
			}
	}

}
