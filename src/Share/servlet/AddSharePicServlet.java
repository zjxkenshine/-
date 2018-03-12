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
import Share.model.SharePic;
import Share.service.ShareService;

/**
 * Servlet implementation class AddSharePicServlet
 */
@WebServlet("/addsharepic.do")
public class AddSharePicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSharePicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			//加载
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			//接值
			String picaddress =request.getParameter("pic");
			String discripe = request.getParameter("discripe");
			Manager ma=(Manager)request.getSession().getAttribute("user");
			int managerid=ma.getManagerId();
			System.out.println(managerid);
			//传值
			SharePic shp=new SharePic();
			shp.setManagerId(managerid);
			shp.setUploadTime(pulicTime);
			shp.setPicAddress(picaddress);
			shp.setDiscripe(discripe);
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
			mo.setDiscripe("分享了张图片");
			os.addmanageroperation(mo);
			
			ss.addsharepic(shp);
			
			//跳转
			response.sendRedirect("hou/shareSuccess.jsp");
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
