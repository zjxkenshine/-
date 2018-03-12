package Manager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.ManagerStatus;
import Manager.service.ManagerService;

import com.google.gson.Gson;

/**
 * Servlet implementation class StatusCheckServlet
 */
@WebServlet("/statuscheck.do")
public class StatusCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		Gson gson = new Gson();
    	ManagerService ms =new ManagerService();
       	try {
       		List<ManagerStatus> lm =ms.queryallstatus(); //利用分页查询方法——得到用户列表信息
       		System.out.println(lm);
    		String json =gson.toJson(lm);
    		out.write(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
