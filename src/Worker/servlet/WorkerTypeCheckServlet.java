package Worker.servlet;

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

import Manager.model.ManagerStatus;
import Manager.service.ManagerService;
import Worker.model.WorkerType;
import Worker.service.WorkerService;

import com.google.gson.Gson;
import com.sun.xml.internal.ws.addressing.WsaActionUtil;

/**
 * Servlet implementation class WorkerTypeCheckServlet
 */
@WebServlet("/workertypecheck.do")
public class WorkerTypeCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkerTypeCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//职位验重
		System.out.println("执行职位验重");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		WorkerService ws=new WorkerService();
		Gson gson = new Gson();
		Map<String,String> map=new HashMap<String,String>();
		
		try {
			String name=request.getParameter("workertypename");
			String workername=request.getParameter("param");
	//		System.out.println(name);
			List<WorkerType> lw=ws.queryallworktype();
			if(lw!=null&&lw.size()>0){
				for(int i=0;i<lw.size();i++){
					if(workername.equals(lw.get(i).getWorkerTypeName())&&!workername.equals(name)){
						map.put("info","该职位已存在");
						map.put("status","n");
						break;
					}else if(i==lw.size()-1){
						map.put("info","");
						map.put("status","y");
					}
				}
				
			}else {
				map.put("info","");
				map.put("status","y");
			}
		
			String json=gson.toJson(map);
			out.print(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
		
    	
		
	}

}
