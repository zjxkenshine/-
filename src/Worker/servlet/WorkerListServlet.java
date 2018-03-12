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
import javax.websocket.Session;

import Manager.model.Manager;
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;
import Worker.model.Worker;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class WorkerListServlet
 */
@WebServlet("/workerlist.do")
public class WorkerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//员工表查询
		try{
			//接收查询传过来的值
			@SuppressWarnings("unchecked")
			Map<String,String> map=(Map<String, String>)request.getSession().getAttribute("workerquery");
			System.out.println(map);
			Worker work =new Worker();
			if(map!=null){
				String workerid=map.get("workerid"); 
				String workername=map.get("workername");
				String workertypeid=map.get("workertypeid");
				String idcard=map.get("idcard");
				String sex = map.get("sex");
				String addtime1=map.get("addtime1");
				String addtime2=map.get("addtime2");
				String worktime1 = map.get("worktime1");
				String worktime2 = map.get("worktime2");
				String age1=map.get("age1");
				String age2=map.get("age2");
				String status=map.get("status");
				String tel=map.get("tel");
				//将查询项存入session-queryworker.do
			
			
				//判定部分值并传入worker类
				
				if(workerid!=null&&!workerid.trim().equals("")){
					work.setWorkId(Integer.parseInt(workerid));
				}System.out.println("执行到此");
				if(workertypeid!=null&&!workertypeid.trim().equals("")){
					work.setWorkerType(Integer.parseInt(workertypeid));
				}
				if(addtime2!=null&&!addtime2.trim().equals("")){
					addtime1=addtime1+","+addtime2;
				}
				if(worktime2!=null&&!worktime2.trim().equals("")){
					worktime1=worktime1+","+worktime2;
				}
				if(age2!=null&&!age2.trim().equals("")){
					age1=age1+","+age2;
				}
				System.out.println("执行到此");
				work.setAddTime(addtime1);
				work.setAge(age1);
				work.setWorkTime(worktime1);
				work.setSex(sex);
				work.setWorkName(workername);
				work.setIdcard(idcard);
				work.setDeleteStatus(status);
				work.setTel(tel);
			}else {
			}
			//获取页面类
			WorkerService ws=new WorkerService();
			PageService ps = new PageService();
			PageBean page=new PageBean();
			String flag=(String) request.getSession().getAttribute("flag");
			if(flag.equals("1")){
	    	if(request.getParameter("nowPage")!=null){
	    		try{
		    		page.setNowPage(Integer.parseInt(request.getParameter("nowPage")));//得到当前第几页 
		    		System.out.println("nowpage==="+request.getParameter("nowPage"));
	    		}catch(Exception e){
	    		}
	    	}
			}
	    	Page pa=new Page();
			pa.setPageName("员工表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			//System.out.println(pa);
			Page pb = ps.querypagesize(pa);      //查询该员工在该表的页面设置

			if(pb!=null){
				page.setPageSize(Integer.parseInt((String)pb.getPageSize()));  //获取页面设置
				if(flag.equals("0")){
					int nowpage=pb.getNowPage();
					System.out.println(nowpage);
					page.setNowPage(nowpage);
				}
			}else{
				ps.addpage(pa);
			}	
			page.setTotalcount(ws.getWorkerCount(work));//得到用户 ——总数量
    		page.setTotalpage(ws.getWorkerCount(work)%page.getPageSize()==0?ws.getWorkerCount(work)/page.getPageSize():ws.getWorkerCount(work)/page.getPageSize()+1);//总页数
    		
    		if(page.getTotalpage()<page.getNowPage()){
    			page.setNowPage(page.getTotalpage());
    		}
    		if(page.getNowPage()<=0){
    			page.setNowPage(1);
    		}
    		
    		//获取职位信息
    		List<WorkerType> lmap=ws.queryallworktype();
    		Map<Integer,String> worktype=new HashMap<Integer, String>();
    		worktype.put(0,"未设置职位");
    		for(int m=0;m<lmap.size();m++){
    			worktype.put(lmap.get(m).getWorkerTypeId(), lmap.get(m).getWorkerTypeName());
    		}
    		
    	//	System.out.println("123");
    		//查询员工
    		List<Worker> lw=ws.queryWorker(work,page);
    //		System.out.println(lw);
    		
    		
    		
    		//传值跳转
    		request.getSession().setAttribute("flag","1");
    		request.setAttribute("workerlist", lw);
    		request.setAttribute("workertype",worktype);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/workerList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	
	}

}
