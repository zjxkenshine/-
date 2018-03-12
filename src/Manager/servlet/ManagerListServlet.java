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
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class ManagerListServlet
 */
@WebServlet("/managerlist.do")
public class ManagerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询管理员
		
		try{
			//接收查询传过来的值
			@SuppressWarnings("unchecked")
			Map<String,String> map=(Map<String, String>)request.getSession().getAttribute("managerquery");
			System.out.println(map);
			Manager manager = new Manager();
			if(map!=null){
				String managerid=map.get("managerid"); 
				String managername=map.get("managername");
				String e_mail=map.get("e_mail");
				String managerstatus=map.get("managerstatus");
				String deletestatus=map.get("deletestatus");
				String workerid=map.get("workerid");
				String addtime1=map.get("addtime1");
				String addtime2=map.get("addtime2");
				
				//判定传值
				if(managerid!=null&&!managerid.trim().equals("")){
					manager.setManagerId(Integer.parseInt(managerid));
				}
				manager.setManagerName(managername);
				manager.setE_mail(e_mail);
				if(managerstatus!=null&&!managerstatus.equals("")){
					manager.setStatus(Integer.parseInt(managerstatus));
				}
				if(managerstatus.equals("0")){
					manager.setStatus(2058924627);
				}
				if(deletestatus!=null&&!deletestatus.equals("")){
					manager.setDeleteStatus(deletestatus);
				}
				if(workerid!=null&&!workerid.equals("")){
					manager.setWorkerId(Integer.parseInt(workerid));
				}
				if(addtime2!=null&&!addtime2.equals("")){
					addtime1=addtime1+","+addtime2;
				}
				manager.setRegisterTime(addtime1);
				
			}
			
			//获取页数，页面
			ManagerService ms = new ManagerService();
			PageService ps = new PageService();
			PageBean page=new PageBean();
			Page pa=new Page();
			pa.setPageName("管理员表");
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
					try{
						page.setNowPage(Integer.parseInt(request.getParameter("nowPage")));//得到当前第几页 
			    		System.out.println("nowpage==="+request.getParameter("nowPage"));
					}catch(Exception e){
					}	
		    	}
			}
			page.setTotalcount(ms.getManagerCount(manager));//得到用户 ——总数量
    		page.setTotalpage(ms.getManagerCount(manager)%page.getPageSize()==0?ms.getManagerCount(manager)/page.getPageSize():ms.getManagerCount(manager)/page.getPageSize()+1);//总页数
    		
    		if(page.getTotalpage()<page.getNowPage()){
    			page.setNowPage(page.getTotalpage());
    		}
    		if(page.getNowPage()<=0){
    			page.setNowPage(1);
    		}
    		
//    		System.out.println(page.getTotalcount());
//    		System.out.println(page.getTotalpage());
//    		System.out.println(page.getPageSize());
    		
    		//查询map
    		List<Manager> lm=ms.queryManager(manager,page);
    		
    		
    		//获取权限
    		List<ManagerStatus> lms=ms.queryallstatus();
    		Map<Integer,String> statusname=new HashMap<Integer, String>();
    		statusname.put(0, "未分配权限");
    		for(int m=0;m<lms.size();m++){
    			statusname.put(lms.get(m).getManagerStatusId(), lms.get(m).getManagerStatusName());
    		}
    //		System.out.println(lm);
    	/*	//权限处理
    		List<String []> ls=new ArrayList<String[]>();
    		for(int i=0;i<lm.size();i++){
    			if(lm.get(i).getStatus()!=0){
    				int statusid=lm.get(i).getStatus();
    				ManagerStatus status=ms.querystatus(String.valueOf(statusid));
    				if(!status.getStatusType().equals("0")){
    					String stu=status.getStatusType();
    					String a[]=stu.split(",");
    					ls.add(a);
    				}else {
						String a[]=new String[]{status.getStatusType()};
						ls.add(a);
					}
    			}
    		}
    		*/
    		//获取员工信息
    		WorkerService ws=new WorkerService();
    		List<Worker> lw = ws.queryAllWorker();
    		Map<Integer,String> workername=new HashMap<Integer,String>();
    		if(lw!=null){
    			for(int i=0;i<lw.size();i++){
    				workername.put(lw.get(i).getWorkId(),lw.get(i).getWorkName());
    			}
    		}
    		
    		//接值跳转
    		request.getSession().setAttribute("flag","1");
    		request.setAttribute("manager", lm);
    		request.setAttribute("statusname",statusname);
    		request.setAttribute("worker", workername);
    	//	request.setAttribute("status", ls);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/managerList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
