package Qian_Shop.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Client.model.Client;
import Client.service.ClientService;
import Other.service.ClientAddressService;

/**
 * Servlet implementation class UpdateClientServlet
 */
@WebServlet("/updateclient.go")
public class UpdateClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Date nowTime =new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pulicTime = sf.format(nowTime);
			
			ClientAddressService cas=new ClientAddressService();
			//取值
			String clientid=request.getParameter("clientid");
			String clientname=request.getParameter("clientname");
			String e_mail=request.getParameter("e_mail");
			String realname=request.getParameter("realname");
			String idcard=request.getParameter("idcard");
			String tel=request.getParameter("tel");
			String province=request.getParameter("province");
			String city=request.getParameter("city");
			String school=request.getParameter("school");
			
			//存值
			Client cl=new Client();
			cl.setClientId(Integer.parseInt(clientid));
			cl.setClientName(clientname);
			cl.setE_mail(e_mail);
			cl.setIdcard(idcard);
			cl.setTel(tel);
			cl.setRealName(realname);
			cl.setProvince(cas.queryprovincename(province));
			cl.setCity(cas.querycityname(city));
			cl.setSchool(cas.queryschoolname(school));
			cl.setStatus("1");
			cl.setUpdateTime(pulicTime);
			
			ClientService cs=new ClientService();
			cs.upldateclient(cl);
			
			response.sendRedirect("hou/updateSuccess.jsp");
			
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
