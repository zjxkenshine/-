package Message.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Message.model.WebMessage;
import Message.service.MessageService;

/**
 * Servlet implementation class UpdateWebMessageServlet
 */
@WebServlet("/updatewebmessage.do")
public class UpdateWebMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWebMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MessageService ms = new MessageService();
		try{
			List<WebMessage> lwm=ms.getWebMessage();
			System.out.println(lwm);
			request.setAttribute("webmessage",lwm);
			request.getRequestDispatcher("hou/updateWebMessage.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
