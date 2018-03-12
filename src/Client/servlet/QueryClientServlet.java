package Client.servlet;

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
 * Servlet implementation class QueryClientServlet
 */
@WebServlet("/queryclient.do")
public class QueryClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//查询客户
		
		//取值
		String clientname=request.getParameter("clientname"); 
		String clientid=request.getParameter("clientid");
		String clientcode=request.getParameter("clientcode");
		String school=request.getParameter("school");
		String e_mail=request.getParameter("e_mail");
		String registertime1=request.getParameter("registertime1");
		String registertime2=request.getParameter("registertime2");
		
		//判断空值
	
		
		//往Session内传值
		Map<String,String> map1 = new HashMap<String, String>();
		map1.put("clientid",clientid);
		map1.put("clientname",clientname);
		map1.put("clientcode",clientcode);
		map1.put("school",school);
		map1.put("e_mail",e_mail);
		map1.put("registertime1",registertime1);
		map1.put("registertime2",registertime2);
		request.getSession().setAttribute("clientquery", map1);
		
		try {
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("客户列表");
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
