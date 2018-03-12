package Operation.servlet;

import java.io.IOException;

import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;


/**
 * Servlet implementation class QueryManagerOperationSetServlet
 */
@WebServlet("/querymanageroperationset.do")
public class QueryManagerOperationSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryManagerOperationSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置查询表的值
		
		try{
			ManagerService ms=new ManagerService();
			List<Manager> lm=ms.queryallmanager();
			
			request.setAttribute("managerlist", lm);
			request.getRequestDispatcher("hou/queryManagerOperation.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
