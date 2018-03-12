package Manager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;

import com.google.gson.Gson;

/**
 * Servlet implementation class CheckPasswordSerlet
 */
@WebServlet("/checkpassword.do")
public class CheckPasswordSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPasswordSerlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//验证密码
		try{
			//初始化
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
			ManagerService ms =new ManagerService();
			Map<String,String> map=new HashMap<String,String>();
			Gson gson = new Gson();
			
			//取值
			String value=request.getParameter("param");
			String name=request.getParameter("name");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			if(value.equals(ma.getPassword())){
				map.put("info","");
				map.put("status","y");
			}else {
				map.put("info","密码不正确");
				map.put("status","n");
			}
			//返回值
			String json=gson.toJson(map);
			out.print(json);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
