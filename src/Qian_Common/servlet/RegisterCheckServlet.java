package Qian_Common.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Client.model.Client;
import Client.service.ClientService;

/**
 * Servlet implementation class RegisterCheckServlet
 */
@WebServlet("/registercheck.go")
public class RegisterCheckServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//
		try{
			String e_mail=request.getParameter("e_mail");
			ClientService cs=new ClientService();
			List<Client> lc=cs.queryallclient();
			int num=0;
			for(int i=0;i<lc.size();i++){
				if(lc.get(i).getE_mail().equals(e_mail)){
					num++;
				}
			}
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			Gson gson = new Gson();
			if(num>=1){
				
				String json =gson.toJson("1");
	    		out.write(json);
			}else{
				String json =gson.toJson("0");
	    		out.write(json);
			}
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
