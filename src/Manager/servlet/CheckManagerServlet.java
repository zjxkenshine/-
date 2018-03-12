package Manager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Manager.model.Manager;
import Manager.service.ManagerService;

import com.google.gson.Gson;

/**
 * Servlet implementation class CheckManagerServlet
 */
@WebServlet("/checkmanager.do")
public class CheckManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//管理员表验证
		try{
			//初始化
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
			ManagerService ms =new ManagerService();
			Map<String,String> map=new HashMap<String,String>();
			Gson gson = new Gson();
			
			//取值

			List<Manager> lm=ms.queryallmanager();
			String value=request.getParameter("param");
			String name=request.getParameter("name");
			String managername=request.getParameter("managername");
			String email=request.getParameter("email");
			

	//		System.out.println(value+name);
	//		System.out.println(lw);
			//验重
			if(value!=null&&lm.size()>0){
				for(int i=0;i<lm.size();i++){
					if(name.equals("managername")&&value.equals(lm.get(i).getManagerName())){
						if(!value.equals(managername)){
							map.put("info","该用户已存在");
							map.put("status","n");
							break;
						}
					}
					if(name.equals("e_mail")&&value.equals(lm.get(i).getE_mail())){
						if(!value.equals(email)){
							map.put("info","该邮箱已有人使用");
							map.put("status","n");
							break;
						}
					}
					if(i==lm.size()-1){
						map.put("info","");
						map.put("status","y");
					}
				}
			}else{
				map.put("info","");
				map.put("status","y");
			}
			
			
			//返回值
			String json=gson.toJson(map);
			out.print(json);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
	}

}
