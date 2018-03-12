package Worker.servlet;

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
 * Servlet implementation class QueryWorkerServlet
 */
@WebServlet("/queryworker.do")
public class QueryWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryWorkerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//员工查询
		
		//取值
		String workerid=request.getParameter("workerid"); 
		String workername=request.getParameter("workername");
		String workertypeid=request.getParameter("workertype");
		String idcard=request.getParameter("idcard");
		String sex = request.getParameter("sex");
		String addtime1=request.getParameter("addtime1");
		String addtime2=request.getParameter("addtime2");
		String worktime1 = request.getParameter("worktime1");
		String worktime2 =request.getParameter("worktime2");
		String age1=request.getParameter("age1");
		String age2=request.getParameter("age2");
		String status=request.getParameter("status");
		String tel=request.getParameter("tel");
		
		if(status.equals("")){
			status=null;
		}
		try {
		//获取page表信息
		PageService ps=new PageService();
		Page pa=new Page();
		pa.setPageName("员工表");
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
		map1.put("workerid",workerid);
		map1.put("workername",workername);
		map1.put("workertypeid",workertypeid);
		map1.put("idcard",idcard);
		map1.put("sex",sex);
		map1.put("addtime1",addtime1);
		map1.put("addtime2",addtime2);
		map1.put("worktime1",worktime1);
		map1.put("worktime2",worktime2);
		map1.put("age1",age1);
		map1.put("age2",age2);
		map1.put("status",status);
		map1.put("tel", tel);
		request.getSession().setAttribute("workerquery", map1);
		request.getSession().setAttribute("flag","0");
		
		//跳转
		response.sendRedirect("hou/querySuccess.jsp");
	}

}
