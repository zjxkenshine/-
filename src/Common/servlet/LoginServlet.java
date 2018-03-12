package Common.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.service.ManagerService;

import com.google.gson.Gson;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		ManagerService ms = new ManagerService();
		String managername=request.getParameter("username");
		String rcord =(String)request.getSession().getAttribute("rCode");
		Map<String,Object> map =new HashMap<String,Object>();
		PrintWriter out =response.getWriter();
		Gson gson = new Gson();
		try{
			Map<String,Object> ma=ms.querymanager(managername);
			if(ma!=null&&ma.size()!=0){
				String password=(String) ma.get("Password");
	//			System.out.println(password);
				String sta=(String) ma.get("DeleteStatus");
	//			System.out.print(sta);
				map.put("password", password);
				map.put("rcord", rcord);
				map.put("status", sta);  //验证码,密码以及状态
	//			System.out.println(map);
			}else{
				map.put("password","");
			}
			String json =gson.toJson(map);
    		out.write(json);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
