package Manager.servlet;

import java.io.IOException;
import java.util.ArrayList;
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
import Worker.service.WorkerService;

/**
 * Servlet implementation class AddManagerSetServlet
 */
@WebServlet("/addmanagerset.do")
public class AddManagerSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddManagerSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//添加员工加载
		
		ManagerService ms=new ManagerService();
		WorkerService ws=new WorkerService();
		//获取权限
		try {
			List<ManagerStatus> lms=ms.queryallstatus();
			//获取未分配账号的员工
			List<Manager> lm=ms.queryallmanager();
			List<Worker> lw = ws.queryAllWorker();
			List<Worker> lw1=new ArrayList<Worker>(); //接收列表
			if(lms!=null&&lw!=null){
				for(int i=0;i<lw.size();i++){
					for(int j=0;j<lm.size();j++){
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
			request.setAttribute("statuslist", lms);
			request.setAttribute("workerlist", lw1);
			request.getRequestDispatcher("hou/addManager.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
