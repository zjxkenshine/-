package Operation.servlet;

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
 * Servlet implementation class QueryManagerOperationServlet
 */
@WebServlet("/querymanageroperation.do")
public class QueryManagerOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryManagerOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询消息处理
		
		//取值
				String managerid=request.getParameter("managerid"); 
				String operationtype=request.getParameter("operationtype");
				String operationlist=request.getParameter("operationlist");
				String operationtime1=request.getParameter("operationtime1");
				String operationtime2 = request.getParameter("operationtime2");
				
				try {
				//获取page表信息
				PageService ps=new PageService();
				Page pa=new Page();
				pa.setPageName("管理员日志表");
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
				
				//存入Session
				Map<String,String> map1 = new HashMap<String, String>();
				map1.put("managerid",managerid);
				map1.put("operationtype",operationtype);
				map1.put("operationlist",operationlist);
				map1.put("operationtime1",operationtime1);
				map1.put("operationtime2",operationtime2);
				request.getSession().setAttribute("manageroperationquery", map1);
				request.getSession().setAttribute("flag","0");
				
				//跳转
				response.sendRedirect("hou/querySuccess.jsp");
	}

}
