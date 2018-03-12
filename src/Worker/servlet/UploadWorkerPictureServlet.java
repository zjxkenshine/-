package Worker.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Worker.service.WorkerService;

/**
 * Servlet implementation class UploadWorkerPictureServlet
 */
@WebServlet("/uploadworkerpicture.do")
public class UploadWorkerPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadWorkerPictureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//上传员工照片处理
		try{
			//取值
			String workerpic = request.getParameter("workerpic");
			String workerid=request.getParameter("workerid");
			WorkerService ws=new WorkerService();
			System.out.println(workerpic+workerid);
			ws.updateworkerpicture(workerpic,workerid);
			response.sendRedirect("hou/uploadSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
