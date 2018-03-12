package Page.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Page.model.Page;
import Page.service.PageService;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdatePageServlet
 */
@WebServlet("/updatepage.do")
public class UpdatePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//更新页数
		try {
			//获取表名，页数，及操作人id
			String pagename=request.getParameter("pagename");
			String pagesize=request.getParameter("pagesize");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			int managerid=ma.getManagerId();
			
			//存入page类
			Page pa=new Page();
			pa.setManagerId(managerid);
			pa.setPageName(pagename);
			pa.setPageSize(pagesize);
			System.out.println(pa);
			
			//查询是否存在该条信息
			PageService ps = new PageService();
			
			//更新
			ps.updatepage(pa);
			
			
			//判定跳转页面
			if(pagename.equals("员工表")){
				response.sendRedirect("workerlist.do");
			}else if(pagename.equals("管理员表")){
				response.sendRedirect("managerlist.do");
			}else if(pagename.equals("管理员日志表")){
				response.sendRedirect("manageroperationlist.do");
			}else if(pagename.equals("个人邮件表")){
				response.sendRedirect("mymessagelist.do");
			}else if(pagename.equals("文件共享表")){
				response.sendRedirect("sharefilelist.do");
			}else if(pagename.equals("图片共享表")){
				response.sendRedirect("sharepiclist.do");
			}else if(pagename.equals("客户列表")){
				response.sendRedirect("clientlist.do");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
