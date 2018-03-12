package Manager.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.OS;

import Manager.model.Manager;
import Manager.service.ManagerService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateSelfMessage
 */
@WebServlet("/updateselfmessage.do")
public class UpdateSelfMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSelfMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//更新本人信息
		try{
			//时间
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
		
			//获取Manager
			Manager ma = (Manager)request.getSession().getAttribute("user");
			//接值
			int managerid=ma.getManagerId();
			String managername=request.getParameter("managername");
			String e_mail = request.getParameter("e_mail");
			String discripe1 = request.getParameter("discripe1");
			
			int workerid=ma.getWorkerId();
			String workername=request.getParameter("workername");
			String idcard=request.getParameter("idcard");
			String tel=request.getParameter("tel");
			String times=request.getParameter("times");
			String sex=request.getParameter("sex");
			String age=request.getParameter("age");
			String discripe2=request.getParameter("discripe2");
			
			//存入model类
			Manager manager = new Manager();
			manager.setManagerId(managerid);
			manager.setManagerName(managername);
			manager.setE_mail(e_mail);
			manager.setDiscripe(discripe1);
			manager.setUpdateTime(pulicTime);
			
			Worker work = new Worker();
			work.setWorkId(workerid);
			work.setWorkName(workername);
			work.setSex(sex);
			work.setAge(age);
			work.setIdcard(idcard);
			work.setTel(tel);
			work.setWorkTime(times);
			work.setDiscripe(discripe2);
			work.setUpdateTime(pulicTime);
			
			//执行更新
			
			ManagerService ms=new ManagerService();
			WorkerService ws=new WorkerService();
			
			ms.updateselfmessage(manager);
			ws.updateselfmessage(work);
			
			
			//更新日志表
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("修改");
			mo.setOperatList("管理员表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("修改了一条管理员个人信息，id="+managerid);
			os.addmanageroperation(mo);
			
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("修改");
			mo.setOperatList("员工表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("修改了一条员工个人信息，id="+workerid);
			os.addmanageroperation(mo);
			
			response.sendRedirect("hou/updateSuccess.jsp");
		}catch (Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
