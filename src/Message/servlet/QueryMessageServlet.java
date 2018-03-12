package Message.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Page.model.Page;
import Page.service.PageService;

/**
 * Servlet implementation class QueryMessageServlet
 */
@WebServlet("/querymessage.do")
public class QueryMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询
		
		//取值
				String frommanagerid=request.getParameter("frommanagerid"); 
				String tomanagerid=request.getParameter("tomanagerid");
				String readstatus=request.getParameter("readstatus");
				String sendtime1=request.getParameter("sendtime1");
				String sendtime2=request.getParameter("sendtime2");
				
				//判断空值
				if(frommanagerid==null){
					frommanagerid="";
				}
				if(tomanagerid==null){
					tomanagerid="";
				}
				if(readstatus==null){
					readstatus="";
				}
				if(sendtime1==null){
					sendtime1="";
				}
				if(sendtime2==null){
					sendtime2="";
				}
				
				//往Session内传值
				Map<String,String> map1 = new HashMap<String, String>();
				map1.put("frommanagerid",frommanagerid);
				map1.put("tomanagerid",tomanagerid);
				map1.put("readstatus",readstatus);
				map1.put("sendtime1",sendtime1);
				map1.put("sendtime2",sendtime2);
				request.getSession().setAttribute("messagequery", map1);
				
				try {
					//获取page表信息
					PageService ps=new PageService();
					Page pa=new Page();
					pa.setPageName("个人邮件表");
					Manager ma = (Manager)request.getSession().getAttribute("user");
					pa.setManagerId(ma.getManagerId());
					
					//获取最大页
					pa.setNowPage(1);
					
					//更新nowpage
					
						ps.updatenowpage(pa);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						request.setAttribute("message",e.getMessage());	
						request.getRequestDispatcher("hou/error.jsp").forward(request, response);
					}
				request.getSession().setAttribute("flag","0");
				
				//跳转
				response.sendRedirect("hou/querySuccess.jsp");
				
			}
	

}
