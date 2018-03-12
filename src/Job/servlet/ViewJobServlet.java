package Job.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.service.ClientService;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Goods.service.GoodsService;
import Job.model.Job;
import Job.service.JobService;

/**
 * Servlet implementation class ViewJobServlet
 */
@WebServlet("/viewJob.do")
public class ViewJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			JobService js=new JobService();
			
			String id =request.getParameter("id");
			Job job=js.queryjob(id);
			
			
			//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
	
   
    		
			request.setAttribute("clientname", clientname);
			request.setAttribute("job", job);
			request.getRequestDispatcher("hou/viewJob.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
