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
import Manager.service.ManagerService;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;
import Worker.service.WorkerService;

/**
 * Servlet implementation class ChangeWorkerStatusServlet
 */
@WebServlet("/changeworkerstatus.do")
public class ChangeWorkerStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeWorkerStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			ManagerService ms = new ManagerService();
			//获取标识
			String id=request.getParameter("id");
			String status=request.getParameter("status");
			String nowpage=request.getParameter("nowpage");
			System.out.println(status+id+nowpage);
			if(status.equals("0")){
				//执行管理员改状态
				int i=ms.updatemanagerstatus2(id);
			}
			if(status.equals("1")){
				//执行管理员改状态
				int i=ms.updatemanagerstatus3(id);
			}
			WorkerService ws=new WorkerService();
			ws.changestatus(status,id);
			
			//更新日志表
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("修改");
			mo.setOperatList("员工表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("修改了一条员工状态以及管理员状态，id="+id);
			os.addmanageroperation(mo);
			
			
			response.sendRedirect("workerlist.do?nowPage="+nowpage);
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}
	}
