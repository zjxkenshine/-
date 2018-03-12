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
 * Servlet implementation class AddWorkerServlet
 */
@WebServlet("/addworker.do")
public class AddWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWorkerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//员工添加
		
		System.out.println("执行员工添加");
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			WorkerService ws=new WorkerService();
			
			//取值
			String workername=request.getParameter("workername");
			String discripe=request.getParameter("discripe");
			String idcard=request.getParameter("idcard");
			String age=request.getParameter("age");
			String sex=request.getParameter("sex");
			String worktime=request.getParameter("times");
			String tel=request.getParameter("tel");
			String worktype=request.getParameter("workertype");
			Worker work =new Worker();
			work.setAddTime(pulicTime);
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
			mo.setOperationType("添加");
			mo.setOperatList("员工表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("添加了一条员工信息");
			os.addmanageroperation(mo);
			
			//执行添加,跳转
			ws.addWorker(work);
			response.sendRedirect("hou/addSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
		
	}

}
