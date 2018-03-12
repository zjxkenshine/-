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

import util.DBUtil;
import Client.model.Client;
import Client.service.ClientService;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Goods.service.GoodsService;
import Job.model.Job;
import Job.service.JobService;

/**
 * Servlet implementation class JobListServlet
 */
@WebServlet("/joblist.do")
public class JobListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//取值
			JobService js=new JobService();
			List<Job> lj=js.queryallJob();
			
			//处理描述信息,防止CSS崩坏
    		if(lj!=null){
    			for(int i=0;i<lj.size();i++){
    				if(lj.get(i).getDiscripe().length()>10){
    					lj.get(i).setDiscripe(lj.get(i).getDiscripe().substring(0,10)+"...");
    				}
    			}
    		}
    		
    		//获取Client名
    		ClientService cs=new ClientService();
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
		
    		
			request.setAttribute("clientname", clientname);
			request.setAttribute("joblist", lj);
			request.getRequestDispatcher("hou/jobList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
