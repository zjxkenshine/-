package Manager.servlet;

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
import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;

/**
 * Servlet implementation class ManagerStatusQueryServlet
 */
@WebServlet("/managerstatusquery.do")
public class ManagerStatusQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerStatusQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询权限
		String key = request.getParameter("key");
		System.out.println(key);
		ManagerService ms = new ManagerService();
		PageService ps = new PageService();
		PageBean page=new PageBean();
		if(key==null){
			key="";
		}
    	
		try{
			Page pa=new Page();
			pa.setPageName("权限表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			//System.out.println(pa);
			Page pb = ps.querypagesize(pa);
			//System.out.println(pb);
			String flag=(String) request.getSession().getAttribute("flag");
			System.out.println(flag);
			if(pb!=null){
				page.setPageSize(Integer.parseInt((String)pb.getPageSize()));
				if(flag.equals("0")){
					int nowpage=pb.getNowPage();
					System.out.println(nowpage);
					page.setNowPage(nowpage);
				}
			}else{
				ps.addpage(pa);
			}
			if(flag.equals("1")){
				if(request.getParameter("nowPage")!=null){
		    		page.setNowPage(Integer.parseInt(request.getParameter("nowPage")));//得到当前第几页 
		    		System.out.println("nowpage==="+request.getParameter("nowPage"));
		    	}
			}
			page.setTotalcount(ms.getStatusCount(key));//得到用户 ——总数量
    		page.setTotalpage(ms.getStatusCount(key)%page.getPageSize()==0?ms.getStatusCount(key)/page.getPageSize():ms.getStatusCount(key)/page.getPageSize()+1);//总页数
    		
//    		System.out.println(page.getTotalcount());	
//    		System.out.println(page.getTotalpage());
//    		System.out.println(page.getPageSize());
    		if(page.getTotalpage()<page.getNowPage()){
    			page.setNowPage(page.getTotalpage());
    		}
    		if(page.getNowPage()<=0){
    			page.setNowPage(1);
    		}
    		
    		List<ManagerStatus> lm=ms.querystatus(key,page);
   // 		System.out.println(lm);
    		
    		//处理描述信息,防止CSS崩坏
    		if(lm!=null){
    			for(int i=0;i<lm.size();i++){
    				if(lm.get(i).getDiscription().length()>15){
    					lm.get(i).setDiscription(lm.get(i).getDiscription().substring(0,14)+"...");
    				}
    			}
    		}
    		Map<Integer,Long> num=new HashMap<Integer,Long>();
    		if(lm!=null){
    			for(int i=0;i<lm.size();i++){
    				int id=lm.get(i).getManagerStatusId();
    				long number=ms.countmanager(id);
    				num.put(id, number);
    			}
    		}
    		request.setAttribute("num",num);
    		//传值
    		request.getSession().setAttribute("flag","1");
    		request.setAttribute("status", lm);
    		request.setAttribute("key", key);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/admin_Competence.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
