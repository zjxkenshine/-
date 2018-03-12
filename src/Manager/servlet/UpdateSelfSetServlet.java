package Manager.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Worker.model.Worker;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateSelfSetServlet
 */
@WebServlet("/updateselfset.do")
public class UpdateSelfSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSelfSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置基本信息
		//获取Manager
		try{
		Manager ma = (Manager)request.getSession().getAttribute("user");
		
		WorkerService ws = new WorkerService();
		ManagerService ms=new ManagerService();
		
		//获取员工信息
		List<Worker> LW =ws.queryWorker(String.valueOf(ma.getWorkerId()));
		Worker work = new Worker();
		if(LW.size()==1){
			work=LW.get(0);
		}
		
		//获取权限
		List<ManagerStatus> lms=ms.queryallstatus();
		
		//获取职位信息
		List<WorkerType> lmap=ws.queryallworktype();
		
		
		
		request.setAttribute("statuslist",lms);
		request.setAttribute("workertype",lmap);
		request.setAttribute("worker", work);
		request.getRequestDispatcher("hou/updateSelfMessage.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
