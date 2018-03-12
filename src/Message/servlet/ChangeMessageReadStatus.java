package Message.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.service.ManagerService;
import Message.service.MessageService;

/**
 * Servlet implementation class ChangeMessageReadStatus
 */
@WebServlet("/changemessagereadstatus.do")
public class ChangeMessageReadStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMessageReadStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//改变阅读状态
		try{
			
			MessageService ms=new MessageService();
			
			//获取标识
			String id=request.getParameter("id");
			String status=request.getParameter("readstatus");
			String nowpage=request.getParameter("nowpage");
			System.out.println(status+id+nowpage);
			ms.changereadstatus(id,status);
			
			response.sendRedirect("mymessagelist.do?nowPage="+nowpage);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
