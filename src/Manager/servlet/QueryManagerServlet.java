package Manager.servlet;

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
 * Servlet implementation class QueryManagerServlet
 */
@WebServlet("/querymanager.do")
public class QueryManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//管理员查询
		//取值
		String managerid=request.getParameter("managerid"); 
		String managername=request.getParameter("managername");
		String e_mail=request.getParameter("e_mail");
		String managerstatus=request.getParameter("managerstatus");
		String deletestatus=request.getParameter("deletestatus");
		String workerid=request.getParameter("workerid");
		String addtime1=request.getParameter("addtime1");
		String addtime2=request.getParameter("addtime2");
		
		//判断空值
		if(deletestatus.equals("")){
			deletestatus=null;
		}
		
		//往Session内传值
		Map<String,String> map1 = new HashMap<String, String>();
		map1.put("managerid",managerid);
		map1.put("managername",managername);
		map1.put("e_mail",e_mail);
		map1.put("managerstatus",managerstatus);
		map1.put("deletestatus",deletestatus);
		map1.put("addtime1",addtime1);
		map1.put("addtime2",addtime2);
		map1.put("workerid",workerid);
		request.getSession().setAttribute("managerquery", map1);
		
		try {
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("管理员表");
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
