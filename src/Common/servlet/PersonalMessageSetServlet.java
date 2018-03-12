package Common.servlet;

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
 * Servlet implementation class PersonalMessageSetServlet
 */
@WebServlet("/personalmessageset.do")
public class PersonalMessageSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalMessageSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//个人信息设置
		try{
			//获取Manager
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
			Map<Integer,String> statusname=new HashMap<Integer, String>();
			statusname.put(0, "未分配权限");
			for(int m=0;m<lms.size();m++){
				statusname.put(lms.get(m).getManagerStatusId(), lms.get(m).getManagerStatusName());
			}
			
			//获取职位信息
			List<WorkerType> lmap=ws.queryallworktype();
			Map<Integer,String> worktype=new HashMap<Integer, String>();
			worktype.put(0,"未设置职位");
			for(int m=0;m<lmap.size();m++){
				worktype.put(lmap.get(m).getWorkerTypeId(), lmap.get(m).getWorkerTypeName());
			}
			
			
			request.setAttribute("status", statusname);
			request.setAttribute("workertype", worktype);
			
			request.setAttribute("worker", work);
			request.getRequestDispatcher("hou/Personal_info.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
