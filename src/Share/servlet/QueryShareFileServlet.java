package Share.servlet;

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
 * Servlet implementation class QueryShareFileServlet
 */
@WebServlet("/querysharefile.do")
public class QueryShareFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryShareFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

				//取值
		String managerid=request.getParameter("managerid"); 
		String sharefileid=request.getParameter("sharefileid");
		String uploadtime1=request.getParameter("uploadtime1");
		String uploadtime2=request.getParameter("uploadtime2");
				
			
				
				//往Session内传值
				Map<String,String> map1 = new HashMap<String, String>();
				map1.put("managerid",managerid);
				map1.put("sharefileid",sharefileid);
				map1.put("uploadtime1",uploadtime1);
				map1.put("uploadtime2",uploadtime2);
				request.getSession().setAttribute("sharefilequery", map1);
				
				try {
					//获取page表信息
					PageService ps=new PageService();
					Page pa=new Page();
					pa.setPageName("文件共享表");
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
