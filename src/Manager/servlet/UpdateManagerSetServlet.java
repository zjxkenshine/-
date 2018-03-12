package Manager.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Worker.model.Worker;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateManagerSetServlet
 */
@WebServlet("/updatemanagerset.do")
public class UpdateManagerSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateManagerSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//管理员信息修改设置
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			ManagerService ms=new ManagerService();
			WorkerService ws=new WorkerService();
			//获取权限
		
				List<ManagerStatus> lms=ms.queryallstatus();
				
				//接值搜索
				String managerid = request.getParameter("managerid");
				List<Manager> lmlist=ms.queryallmanager(managerid);
				Manager manager = new Manager();
				if(lmlist!=null){
					manager=lmlist.get(0);
				}
				
				
				//获取未分配账号的员工与自身
				List<Manager> lm=ms.queryallmanager();
				List<Worker> lw = ws.queryAllWorker();
				List<Worker> lw1=new ArrayList<Worker>(); //接收列表
				if(lms!=null&&lw!=null){
					for(int i=0;i<lw.size();i++){
						for(int j=0;j<lm.size();j++){
							if(manager.getWorkerId()==lw.get(i).getWorkId()){
								lw1.add(lw.get(i));
								break;
							}
							if(lm.get(j).getWorkerId()==lw.get(i).getWorkId()){
								break;
							}
							if(j==lm.size()-1){
								lw1.add(lw.get(i));
							}
						}
					}
				}
				
				
				
				
				//传值跳转
				request.setAttribute("manager", manager);
				request.setAttribute("statuslist", lms);
				request.setAttribute("workerlist", lw1);
				request.getRequestDispatcher("hou/updateManager.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		}

}
