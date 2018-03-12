package Operation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Page.model.Page;
import Page.service.PageService;

/**
 * Servlet implementation class ResetManagerOperationServlet
 */
@WebServlet("/resetmanageroperation.do")
public class ResetManagerOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetManagerOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//重置管理员日志查询
		try {
			//获取page表信息
			PageService ps=new PageService();
			Page pa=new Page();
			pa.setPageName("管理员日志表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			
			//获取第一页
			pa.setNowPage(1);
			
			//更新nowpage
			
			ps.updatenowpage(pa);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				request.setAttribute("message",e.getMessage());	
				request.getRequestDispatcher("hou/error.jsp").forward(request, response);
			}
		request.getSession().setAttribute("flag","0");
		request.getSession().setAttribute("manageroperationquery",null);
		//跳转
		response.sendRedirect("hou/setSuccess.jsp");
	}
	

}
