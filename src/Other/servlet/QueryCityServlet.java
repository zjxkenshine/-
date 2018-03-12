package Other.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Other.model.City;
import Other.service.ClientAddressService;

/**
 * Servlet implementation class QueryCityServlet
 */
@WebServlet("/querycity.go")
public class QueryCityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryCityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//接收provinceid
			String pro_id=request.getParameter("pro_id");
			System.out.println(pro_id);
			
			//查询
			ClientAddressService cas=new ClientAddressService();
			List<City> lc=cas.queryallcity(pro_id);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			Gson gson = new Gson();
			String city=gson.toJson(lc);
			out.write(city);
			out.flush();
			out.close();
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
