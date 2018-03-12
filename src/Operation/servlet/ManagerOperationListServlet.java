package Operation.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.OS;

import Manager.model.Manager;
import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Operation.dao.OperationDao;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class ManagerOperationListServlet
 */
@WebServlet("/manageroperationlist.do")
public class ManagerOperationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerOperationListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询管理员日志
		
				try{
					//接收查询传过来的值
					@SuppressWarnings("unchecked")
					Map<String,String> map=(Map<String, String>)request.getSession().getAttribute("manageroperationquery");
					System.out.println(map);
					ManagerOperation mo = new ManagerOperation();
					if(map!=null){
						String managerid=map.get("managerid"); 
						String operationtype=map.get("operationtype");
						String operationlist=map.get("operationlist");
						String operationtime1=map.get("operationtime1");
						String operationtime2=map.get("operationtime2");
						
						//判定传值
						if(managerid!=null&&!managerid.trim().equals("")){
							mo.setManagerId(Integer.parseInt(managerid));
						}
						mo.setOperationType(operationtype);
						mo.setOperatList(operationlist);
						if(operationtime2!=null&&!operationtime2.equals("")){
							operationtime1=operationtime1+","+operationtime2;
						}
						mo.setOperationTime(operationtime1);
						
					}
					
					//获取页数，页面
					OperationService os=new OperationService();
					PageService ps = new PageService();
					PageBean page=new PageBean();
					Page pa=new Page();
					pa.setPageName("管理员日志表");
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
					page.setTotalcount(os.getManagerOperationCount(mo));//得到用户 ——总数量
		    		page.setTotalpage(os.getManagerOperationCount(mo)%page.getPageSize()==0?os.getManagerOperationCount(mo)/page.getPageSize():os.getManagerOperationCount(mo)/page.getPageSize()+1);//总页数
		    		
		    		if(page.getTotalpage()<page.getNowPage()){
		    			page.setNowPage(page.getTotalpage());
		    		}
		    		if(page.getNowPage()<=0){
		    			page.setNowPage(1);
		    		}
		    		
//		    		System.out.println(page.getTotalcount());
//		    		System.out.println(page.getTotalpage());
//		    		System.out.println(page.getPageSize());
		    		
		    		//查询map
		    		List<ManagerOperation> lmo =os.querymanageroperation(mo,page);
		    		System.out.println(lmo);
		    		
		    		//获取管理员信息
		    		ManagerService ms1= new ManagerService();
		    		List<Manager> lmList = ms1.queryallmanager();
		    		Map<Integer,String> managername=new HashMap<Integer,String>();
		    		if(lmList!=null){
		    			for(int i=0;i<lmList.size();i++){
		    				managername.put(lmList.get(i).getManagerId(),lmList.get(i).getManagerName());
		    			}
		    		}
		    		
		    		//接值跳转
		    		request.getSession().setAttribute("flag","1");
		    		request.setAttribute("manageroperation", lmo);
		    		request.setAttribute("manager", managername);
		    		request.setAttribute("page", page);
					request.getRequestDispatcher("hou/managerOperationList.jsp").forward(request, response);
				}catch(Exception e){
					request.setAttribute("message",e.getMessage());	
					request.getRequestDispatcher("hou/error.jsp").forward(request, response);
				}
	}

}
