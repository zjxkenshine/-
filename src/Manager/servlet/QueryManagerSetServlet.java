package Manager.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class QueryManagerSetServlet
 */
@WebServlet("/querymanagerset.do")
public class QueryManagerSetServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryManagerSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//初始化搜索表单框
		try{
			ManagerService ms=new ManagerService();
			WorkerService ws=new WorkerService();
			//获取权限
			List<ManagerStatus> lms=ms.queryallstatus();
			
			//获取员工
			List<Worker> lw=ws.queryAllWorker();
			
			//传值跳转
			
			request.setAttribute("statuslist",lms);
			request.setAttribute("workerlist",lw);
			request.getRequestDispatcher("hou/queryManager.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
