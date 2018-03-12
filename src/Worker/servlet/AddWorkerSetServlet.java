package Worker.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class AddWorkerSetServlet
 */
@WebServlet("/addworkset.do")
public class AddWorkerSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWorkerSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//SET addworker->workertype
		//设置职位,员工添加传值
		//System.out.println("初始化职位");
		//获取职位信息
		try{
			WorkerService ws=new WorkerService();
			List<WorkerType> lmap=ws.queryallworktype();
			
			//传值跳转	
    		request.setAttribute("workertype",lmap);
			request.getRequestDispatcher("hou/addWorker.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
