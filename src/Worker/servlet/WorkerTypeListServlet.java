package Worker.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class WorkerTypeListServlet
 */
@WebServlet("/workertypelist.do")
public class WorkerTypeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkerTypeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//加载职位列表
		WorkerService ws = new WorkerService();
		PageService ps = new PageService();
		PageBean page=new PageBean();
    	
		try{
			//获取页数，页面
			Page pa=new Page();
			pa.setPageName("职位表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			//System.out.println(pa);
			Page pb = ps.querypagesize(pa);
			//获取flag
			String flag=(String) request.getSession().getAttribute("flag");
			System.out.println(flag);
			if(pb!=null){
				page.setPageSize(Integer.parseInt((String)pb.getPageSize()));
				if(flag.equals("0")){
					int nowpage=pb.getNowPage();
					System.out.println(nowpage);
					page.setNowPage(nowpage);
				}
			}else{              //否则加表
				ps.addpage(pa);
			}	
			if(flag.equals("1")){
				if(request.getParameter("nowPage")!=null){
		    		page.setNowPage(Integer.parseInt(request.getParameter("nowPage")));//得到当前第几页 
		    		System.out.println("nowpage==="+request.getParameter("nowPage"));
		    	}
			}
			page.setTotalcount(ws.getWorkerTypeCount());//得到用户 ——总数量
    		page.setTotalpage(ws.getWorkerTypeCount()%page.getPageSize()==0?ws.getWorkerTypeCount()/page.getPageSize():ws.getWorkerTypeCount()/page.getPageSize()+1);//总页数
    		
    		if(page.getTotalpage()<page.getNowPage()){
    			page.setNowPage(page.getTotalpage());
    		}
    		if(page.getNowPage()<=0){
    			page.setNowPage(1);
    		}
//    		System.out.println(page.getTotalcount());	
//    		System.out.println(page.getTotalpage());
//    		System.out.println(page.getPageSize());
 //   		System.out.println(page);
    		List<WorkerType> lm=ws.queryallworktype();
    		
    		//处理描述信息,防止CSS崩坏
    		if(lm!=null){
    			for(int i=0;i<lm.size();i++){
    				if(lm.get(i).getDiscripe().length()>15){
    					lm.get(i).setDiscripe(lm.get(i).getDiscripe().substring(0,14)+"...");
    				}
    			}
    		}
    		Map<Integer,Long> num=new HashMap<Integer,Long>();
    		if(lm!=null){
    			for(int i=0;i<lm.size();i++){
    				int id=lm.get(i).getWorkerTypeId();
    				long number=ws.countworker(id);
    				num.put(id, number);
    			}
    		}
    		request.setAttribute("num",num);
    		
    		request.getSession().setAttribute("flag","1");
    		request.setAttribute("worker", lm);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/workerType.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
