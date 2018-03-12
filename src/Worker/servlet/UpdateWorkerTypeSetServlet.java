package Worker.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateWorkerTypeSetServlet
 */
@WebServlet("/updateworkertypeset.do")
public class UpdateWorkerTypeSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerTypeSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			//职位信息获取
				String id=request.getParameter("workertypeid");
			//	System.out.println(id);
				WorkerService ws=new WorkerService();
				try{
					WorkerType wt=ws.queryworkertype(id);
					request.setAttribute("list",wt);
					request.getRequestDispatcher("hou/updateWorkerType.jsp").forward(request, response);
				}catch(Exception e){
					request.setAttribute("message",e.getMessage());	
					request.getRequestDispatcher("hou/error.jsp").forward(request, response);
				}
	}

}
