package Other.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Other.model.City;
import Other.model.School;
import Other.service.ClientAddressService;

import com.google.gson.Gson;

/**
 * Servlet implementation class QuerySchoolServlet
 */
@WebServlet("/queryschool.go")
public class QuerySchoolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuerySchoolServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//接收cityid
			String school_id=request.getParameter("city_id");
			//System.out.println(school_id);
			
			//查询
			ClientAddressService cas=new ClientAddressService();
			List<School> ls=cas.queryallschool(school_id);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			Gson gson = new Gson();
			String city=gson.toJson(ls);
			System.out.println(ls);
			out.write(city);
			out.flush();
			out.close();
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
