package Message.servlet;

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
import Message.model.Message;
import Message.service.MessageService;
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class MyMessageListServlet
 */
@WebServlet("/mymessagelist.do")
public class MyMessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMessageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//我的邮件查询
		
		try{
			//接收查询传过来的值
			@SuppressWarnings("unchecked")
			Map<String,String> map=(Map<String, String>)request.getSession().getAttribute("messagequery");
			System.out.println(map);
			Message msg = new Message();
			Manager ma = (Manager)request.getSession().getAttribute("user");
			if(map!=null){
				String frommanagerid=map.get("frommanagerid"); 
				String tomanagerid=map.get("tomanagerid");
				String sendtime1=map.get("sendtime1");
				String sendtime2=map.get("sendtime2");
				String readstatus=map.get("readstatus");
				
				System.out.println(frommanagerid+tomanagerid+sendtime1+sendtime2+readstatus);
				//判定传值
				if(frommanagerid!=null&&!frommanagerid.trim().equals("")){
					msg.setFromManagerId(Integer.parseInt(frommanagerid));
				}
				if(tomanagerid!=null&&!tomanagerid.trim().equals("")){
					msg.setToManagerId(Integer.parseInt(tomanagerid));
				}
				if(sendtime2!=null&&!sendtime2.equals("")){
					sendtime1=sendtime1+","+sendtime2;
				}
				if(readstatus!=null&&!readstatus.trim().equals("")){
					msg.setReadStatus(Integer.parseInt(readstatus));
				}else {
					msg.setReadStatus(2);
				}
				msg.setSendTime(sendtime1);
				
				
			}else{
				msg.setFromManagerId(ma.getManagerId());
				msg.setToManagerId(ma.getManagerId());
			}
			
			
			//获取页数，页面
			MessageService ms=new MessageService();
			PageService ps = new PageService();
			PageBean page=new PageBean();
			Page pa=new Page();
			pa.setPageName("个人邮件表");
			
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
			page.setTotalcount(ms.getMyMessageCount(msg));//得到用户 ——总数量
    		page.setTotalpage(ms.getMyMessageCount(msg)%page.getPageSize()==0?ms.getMyMessageCount(msg)/page.getPageSize():ms.getMyMessageCount(msg)/page.getPageSize()+1);//总页数
    		
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
    		List<Message> lm=ms.queryMessage(msg,page);
    		//处理描述信息,防止CSS崩坏
    		if(lm!=null){
    			for(int i=0;i<lm.size();i++){
    				if(lm.get(i).getDiscripe().length()>15){
    					lm.get(i).setDiscripe(lm.get(i).getDiscripe().substring(0,14)+"...");
    				}
    			}
    		}
    		
   
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
    		request.setAttribute("messagelist", lm);
    		request.setAttribute("manager", managername);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/myMessage.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}
	

}
