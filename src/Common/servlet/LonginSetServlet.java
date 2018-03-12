package Common.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Manager.model.Manager;
import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Message.service.MessageService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class LonginSetServlet
 */
@WebServlet("/loginset.do")
public class LonginSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LonginSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//登录传值
		
		
		System.out.println("执行servlet");
		ManagerService ms = new ManagerService();
		String managername = request.getParameter("managername");
		System.out.println(managername);
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			Manager ma=ms.managerquery(managername); //查询该用户
			
		//	System.out.println(ma);
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(30*60); //设置session时间
			
			//权限处理
    		String[] status=new String[]{};
    		int id=ma.getStatus();
    		if(id!=0){
    			ManagerStatus mst= ms.querystatus(String.valueOf(id));
    			String stu=mst.getStatusType();
    			System.out.println(stu);
    			status=stu.split(",");
    		}
    		
    	//	System.out.println(status);
    		//传邮件信息
    		MessageService mes=new MessageService();
    		int num =mes.querynotreadnum(String.valueOf(ma.getManagerId()));
    		
    		
    		//更新日志表
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("登录");
			mo.setOperatList("无");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("登录了系统");
			os.addmanageroperation(mo);
    		
			//传值
    		session.setAttribute("flag", "1");
    		session.setAttribute("messagenum",num);  
    		session.setAttribute("statuslist",status);  
			session.setAttribute("user", ma);
			response.sendRedirect("hou/shop_index.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
