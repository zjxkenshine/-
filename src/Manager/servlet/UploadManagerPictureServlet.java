package Manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.service.ManagerService;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UploadManagerPictureServlet
 */
@WebServlet("/uploadmanagerpicture.do")
public class UploadManagerPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadManagerPictureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//上传头像
		try{
			//取值
			String managerpic = request.getParameter("managerpic");
			String managerid=request.getParameter("managerid");
			ManagerService ms=new ManagerService();
			
			ms.uploadmanagerpicture(managerpic, managerid);
			response.sendRedirect("hou/uploadSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
