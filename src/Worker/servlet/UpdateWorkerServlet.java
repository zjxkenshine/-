package Worker.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Manager.model.Manager;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Worker.model.Worker;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateWorkerServlet
 */
@WebServlet("/updateworker.do")
public class UpdateWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//更新员工信息
		
		System.out.println("执行员工添加");
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			WorkerService ws=new WorkerService();
			
			//取值
			String workerid=request.getParameter("workerid");
			String workername=request.getParameter("workername");
			String discripe=request.getParameter("discripe");
			String idcard=request.getParameter("idcard");
			String age=request.getParameter("age");
			String sex=request.getParameter("sex");
			String worktime=request.getParameter("times");
			String tel=request.getParameter("tel");
			String worktype=request.getParameter("workertype");
			Worker work =new Worker();
			work.setWorkId(Integer.parseInt(workerid));
			work.setUpdateTime(pulicTime);
			work.setAge(age);
			work.setSex(sex);
			work.setDeleteStatus("1");
			work.setDiscripe(discripe);
			work.setIdcard(idcard);
			work.setTel(tel);
			work.setWorkerType(Integer.parseInt(worktype));
			work.setWorkName(workername);
			work.setWorkTime(worktime);
			System.out.println(work);
			
			//更新日志表
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("修改");
			mo.setOperatList("员工表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("修改了一条员工信息，id="+workerid);
			os.addmanageroperation(mo);
			
			//执行添加,跳转
			ws.updateWorker(work);
			response.sendRedirect("hou/updateSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
		
	}

}
