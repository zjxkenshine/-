package Share.servlet;

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
 * Servlet implementation class ResetShareFileServlet
 */
@WebServlet("/resetsharefile.do")//
public class ResetShareFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetShareFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//清空查询
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
				request.getSession().setAttribute("sharefilequery",null);
				
				//跳转
				response.sendRedirect("hou/setSuccess.jsp");

	}

}
