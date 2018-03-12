package Job.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Goods.service.GoodsService;
import Job.service.JobService;
import Manager.model.Manager;
import Operation.model.ManagerOperation;
import Operation.service.OperationService;

/**
 * Servlet implementation class DeleteJobServlet
 */
@WebServlet("/deletejob.do")
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			String a=request.getParameter("id");
			JobService js=new JobService();
			String b[]=a.split(",");
			for (int j = 0; j < b.length; j++) {
				System.out.println(j);
				if(!b[j].equals("")&&b[j]!=null){
	//				System.out.println(b[j]);
					js.deletejob(b[j]);
				}
			}
			
			//获总数量
			
			
			//获取page表信息

			Manager ma = (Manager)request.getSession().getAttribute("user");
	
			
			//获取最大页		
		

	
			
			//更新日志表
			if(a!=null&&!a.equals("")){
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("删除");
			mo.setOperatList("兼职表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("删除了"+b.length+"条兼职信息，id="+a);
			os.addmanageroperation(mo);
			}
			//跳转
			request.getRequestDispatcher("hou/deleteSuccess.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
