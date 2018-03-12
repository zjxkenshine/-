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

import Worker.model.Worker;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class QueryWorkerSet
 */
@WebServlet("/queryworkset.do")
public class QueryWorkerSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryWorkerSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置查询信息

		try{
			//获取职位
			WorkerService ws=new WorkerService();
			List<WorkerType> lmap=ws.queryallworktype();
			
			//传值跳转	
    		request.setAttribute("workertype",lmap);
			request.getRequestDispatcher("hou/queryWorker.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
