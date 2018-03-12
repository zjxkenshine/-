package Qian_Common.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Client.model.Client;
import Client.service.ClientService;

/**
 * Servlet implementation class LoginTestServlet
 */
@WebServlet("/logincheck.go")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			Gson gson = new Gson();
			
			
			String e_mail=request.getParameter("e_mail");
			System.out.println(e_mail);
			ClientService cs=new ClientService();
			List<Client> lc=cs.queryclient();
			if(lc!=null){
				for(int i=0;i<lc.size();i++){
					if(lc.get(i).getE_mail().equals(e_mail)){
						System.out.println(lc.get(i));
						String json =gson.toJson(lc.get(i));
			    		out.write(json);
					}
				}
			}
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
