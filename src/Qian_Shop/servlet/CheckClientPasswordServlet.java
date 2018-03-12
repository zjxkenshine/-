package Qian_Shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Manager.model.Manager;
import Manager.service.ManagerService;

import com.google.gson.Gson;

/**
 * Servlet implementation class CheckClientPasswordServlet
 */
@WebServlet("/checkclientpassword.go")
public class CheckClientPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckClientPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//初始化
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();

			Map<String,String> map=new HashMap<String,String>();
			Gson gson = new Gson();
			
			//取值
			String value=request.getParameter("param");
			Client cl=(Client) request.getSession().getAttribute("client");
			if(value.equals(cl.getPassWord())){
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
