package Share.servlet;

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
 * Servlet implementation class QueryShareFileSetServlet
 */
@WebServlet("/querysharefileset.do")
public class QueryShareFileSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryShareFileSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try{
			ManagerService ms1= new ManagerService();
			List<Manager> lmList = ms1.queryallmanager();
			
			request.setAttribute("managerlist", lmList);
			request.getRequestDispatcher("hou/queryShareFile.jsp").forward(request, response);
			
			}catch(Exception e){
				request.setAttribute("message",e.getMessage());	
				request.getRequestDispatcher("hou/error.jsp").forward(request, response);
			}
		
	}

}
