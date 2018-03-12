package Client.servlet;

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
import Manager.model.Manager;
import Manager.service.ManagerService;
import Message.model.Message;
import Message.service.MessageService;
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;

/**
 * Servlet implementation class ClientListServlet
 */
@WebServlet("/clientlist.do")
public class ClientListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//client查询
		
		try{
			//接收查询传过来的值
			@SuppressWarnings("unchecked")
			Map<String,String> map=(Map<String, String>)request.getSession().getAttribute("clientquery");
			System.out.println(map);
			Client cl=new Client();
			ClientService cs=new ClientService();
			Manager ma = (Manager)request.getSession().getAttribute("user");
			if(map!=null){
				String clientid=map.get("clientid"); 
				String clientname=map.get("clientname");
				String clientcode=map.get("clientcode");
				String school=map.get("school");
				String realname=map.get("realname");
				String e_mail=map.get("e_mail");
				String registertime1=map.get("registertime1");
				String registertime2=map.get("registertime2");
				
			
				//判定传值
				if(clientid!=null&&!clientid.trim().equals("")){
					cl.setClientId(Integer.parseInt(clientid));;
				}
				if(clientname!=null&&!clientname.trim().equals("")){
					cl.setClientName(clientname);
				}
				if(clientcode!=null&&!clientcode.trim().equals("")){
					cl.setClientCode(clientcode);
				}
				if(school!=null&&!school.trim().equals("")){
					cl.setSchool(school);
				}
				if(realname!=null&&!realname.trim().equals("")){
					cl.setRealName(realname);
				}
				if(e_mail!=null&&!e_mail.trim().equals("")){
					cl.setE_mail(e_mail);
				}
				if(registertime2!=null&&!registertime2.equals("")){
					registertime1=registertime1+","+registertime2;
				}
			
				
				
			}
			
			
			//获取页数，页面

			PageService ps = new PageService();
			PageBean page=new PageBean();
			Page pa=new Page();
			pa.setPageName("客户列表");
			
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
			page.setTotalcount(cs.getClientCount(cl));//得到用户 ——总数量
    		page.setTotalpage(cs.getClientCount(cl)%page.getPageSize()==0?cs.getClientCount(cl)/page.getPageSize():cs.getClientCount(cl)/page.getPageSize()+1);//总页数
    		
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
    		List<Client> lc=cs.queryclient(cl, page);
    		//处理描述信息,防止CSS崩坏
    		
    		
  
    		
    		//接值跳转
    		request.getSession().setAttribute("flag","1");
    		request.setAttribute("clientlist", lc);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/clientList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
