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
import Worker.model.WorkerType;
import Worker.service.WorkerService;

/**
 * Servlet implementation class UpdateWorkerTypeServlet
 */
@WebServlet("/updateworkertype.do")
public class UpdateWorkerTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWorkerTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//更新职位信息
		System.out.println("开始更新职位信息");
		WorkerService ws=new WorkerService();
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String typeid=request.getParameter("workertypeid");
			String typename=request.getParameter("workertypename");	
			String discripe = request.getParameter("discripe");
			System.out.println(typeid+typename+discripe);
			WorkerType wt = new WorkerType();
			wt.setWorkerTypeId(Integer.parseInt(typeid));
			wt.setWorkerTypeName(typename);
			wt.setNumber("0");
			wt.setStatus("1");
			wt.setDiscripe(discripe);
			System.out.println(wt);
			ws.updateworkertype(wt);
			response.sendRedirect("hou/updateSuccess.jsp");
			
			//更新日志表
			Manager ma = (Manager)request.getSession().getAttribute("user");
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("修改");
			mo.setOperatList("职位表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("修改了一条职位信息，id="+typeid);
			os.addmanageroperation(mo);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
