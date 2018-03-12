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
import Client.model.Collect;
import Client.service.ClientService;
import Client.service.CollectService;
import Goods.model.Goods;
import Goods.service.GoodsService;
import Job.model.Job;
import Job.model.JobCollect;
import Job.service.JobCollectService;
import Job.service.JobService;

/**
 * Servlet implementation class JobCollectListServlet
 */
@WebServlet("/jobcollectlist.do")
public class JobCollectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobCollectListServlet() {
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
			ClientService cs=new ClientService();
			JobCollectService cls=new JobCollectService();
			List<JobCollect> lcl=cls.queryalljobcollect();
		
    		
    		//获取Client名
    		List<Client> lc=cs.queryallclient();
    		Map<Integer,String> clientname=new HashMap<Integer,String>();
    		for(int i=0;i<lc.size();i++){
    			clientname.put(lc.get(i).getClientId(),lc.get(i).getClientName());
    		}
			
    		//获取订单类型
    		JobService js=new JobService();
    		List<Job> lg= js.queryallJob();
    		Map<Integer,String> jobname=new HashMap<Integer,String>();
    		for(int i=0;i<lg.size();i++){
    			jobname.put(lg.get(i).getJobId(),lg.get(i).getJobName());
    		}
    		
			request.setAttribute("jobname", jobname);
			request.setAttribute("clientname", clientname);
			request.setAttribute("jobcollect",lcl);
			request.getRequestDispatcher("hou/jobcollectList.jsp").forward(request, response);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
