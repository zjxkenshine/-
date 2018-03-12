package Message.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Manager.service.ManagerService;
import Message.model.Message;
import Message.service.MessageService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Page.model.Page;
import Page.service.PageService;

/**
 * Servlet implementation class DeleteMessageServlet
 */
@WebServlet("/deletemessage.do")
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//邮件删除
		MessageService ms=new MessageService();
		PageService ps=new PageService();
		try{

			
			Manager ma = (Manager)request.getSession().getAttribute("user");
			
			String id=request.getParameter("messageid");
			System.out.println(id);
			String b[]=id.split(",");
			for (int j = 0; j < b.length; j++) {
				if(!b[j].equals("")&&b[j]!=null){
					System.out.println(b[j]);
					Message msg=ms.querymessage(b[j]);
					if(msg.getFromManagerId()==ma.getManagerId()){
						ms.updatedeletestatus(0, 1, b[j]);
					}else if(msg.getToManagerId()==ma.getManagerId()){
						ms.updatedeletestatus(1, 0, b[j]);
					}
				}
			}
			
			int count=Integer.parseInt(request.getParameter("count"));
			int nowpage=Integer.parseInt(request.getParameter("nowpage"));
			
			//获取page表信息
			Page pa=new Page();
			pa.setPageName("管理员表");

			pa.setManagerId(ma.getManagerId());
			Page pb = ps.querypagesize(pa);
			int pagesize=Integer.parseInt(pb.getPageSize());
			
			//获取最大页
			int sumpage=(count-b.length)%pagesize==0?(count-b.length)/pagesize:(count-b.length)/pagesize+1;
			pa.setNowPage(nowpage>sumpage?sumpage:nowpage);
			
			//更新nowpage
			ps.updatenowpage(pa);
			
			request.getSession().setAttribute("flag","0" );
			
			request.getRequestDispatcher("hou/deleteSuccess.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
