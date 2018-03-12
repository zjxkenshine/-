package Share.servlet;

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
import Share.model.ShareFile;
import Share.model.SharePic;
import Share.service.ShareService;

/**
 * Servlet implementation class AddShareFileServlet
 */
@WebServlet("/addsharefile.do")
public class AddShareFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShareFileServlet() {
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
			//接值
			String fileaddress =request.getParameter("file");
			String discripe = request.getParameter("discripe");
			Manager ma=(Manager)request.getSession().getAttribute("user");
			int managerid=ma.getManagerId();
			
			//传值
			ShareFile shf=new ShareFile();
			shf.setManagerId(managerid);
			shf.setUploadTime(pulicTime);
			shf.setFileAddress(fileaddress);
			shf.setDiscripe(discripe);
			System.out.println(shf);
			//添加
			ShareService ss=new ShareService();
			
			
			//更新日志表
			OperationService os =new OperationService();
			ManagerOperation mo=new ManagerOperation();
			mo.setManagerId(ma.getManagerId());
			mo.setOperationType("添加");
			mo.setOperatList("共享表");
			mo.setOperationDay(pulicTime);
			mo.setOperationTime(pulicTime);
			mo.setDiscripe("分享了一份文件");
			os.addmanageroperation(mo);
			
			ss.addsharefile(shf);
			//跳转
			response.sendRedirect("hou/shareSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
