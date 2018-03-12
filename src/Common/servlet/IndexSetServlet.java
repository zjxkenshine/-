package Common.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Message.model.WebMessage;
import Message.model.WebPic;
import Message.service.MessageService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class IndexSetServlet
 */
@WebServlet("/indexset.do")
public class IndexSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//首页加载
		MessageService ms = new MessageService();
		try{
			List<WebMessage> lwm=ms.getWebMessage();
			System.out.println(lwm);
			//传操作
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os=new OperationService();
			List<ManagerOperation> lmo =os.querydenglu(ma.getManagerId());
		//	System.out.println(lmo);
			
			//传姓名
			WorkerService ws=new WorkerService();
    		List<Worker> lw = ws.queryAllWorker();
    		Map<Integer,String> workername=new HashMap<Integer,String>();
    		if(lw!=null){
    			for(int i=0;i<lw.size();i++){
    				workername.put(lw.get(i).getWorkId(),lw.get(i).getWorkName());
    			}
    		}
			String name=workername.get(ma.getWorkerId());
			
			//未读消息数量
			int num =ms.querynotreadnum(String.valueOf(ma.getManagerId()));
			
			//网站图片获取
			WebPic wp= ms.queryWebpic();
			
			//获取公告消息
			String notice =ms.querynotice();
			
			
			
			request.setAttribute("notice", notice);
			request.setAttribute("webpic",wp);
			request.setAttribute("messagenum",num);
			request.setAttribute("worker",name);
			request.setAttribute("loginlist",lmo);
			request.setAttribute("webmessage",lwm);
			request.getRequestDispatcher("hou/index.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
