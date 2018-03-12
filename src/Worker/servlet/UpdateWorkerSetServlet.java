package Worker.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Worker.model.Worker;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateWorkerSetServlet
 */
@WebServlet("/updateworkerset.do")
public class UpdateWorkerSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//员工修改传值
		try{
			//设置职位信息
			WorkerService ws=new WorkerService();
			List<WorkerType> lmap=ws.queryallworktype();
			
			//获取员工信息
			String workerid = request.getParameter("workerid");
			List<Worker> lw=ws.queryWorker(workerid);
			Worker work =new Worker();
			if(lw!=null){
				work=lw.get(0);
			}
			//传值跳转	
			request.setAttribute("worker",work);
    		request.setAttribute("workertype",lmap);
			request.getRequestDispatcher("hou/updateWorker.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
