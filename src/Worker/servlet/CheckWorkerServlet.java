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

import Worker.model.Worker;
import Worker.service.WorkerService;

import com.google.gson.Gson;

/**
 * Servlet implementation class CheckWorkerServlet
 */
@WebServlet("/checkworker.do")
public class CheckWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckWorkerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//员工表单验证
		try{
			//初始化
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
			WorkerService ws=new WorkerService();
			Map<String,String> map=new HashMap<String,String>();
			Gson gson = new Gson();
			
			//取值
			List<Worker> lw= ws.queryAllWorker();
			String value=request.getParameter("param");
			String name=request.getParameter("name");
			String workername=request.getParameter("workername");
			String idcard=request.getParameter("idcard");
			String tel=request.getParameter("tel");
			
			System.out.println(workername+idcard+tel);
			
	//		System.out.println(value+name);
	//		System.out.println(lw);
			//验重
			if(value!=null&&lw.size()>0){
				for(int i=0;i<lw.size();i++){
					if(name.equals("workername")&&value.equals(lw.get(i).getWorkName())){
						if(!value.equals(workername)){
							map.put("info","该员工已存在");
							map.put("status","n");
							break;
						}
					}
					if(name.equals("idcard")&&value.equals(lw.get(i).getIdcard())){
						if(!value.equals(idcard)){
							map.put("info","该身份证号已有人使用");
							map.put("status","n");
							break;
						}
					}
					if(name.equals("tel")&&value.equals(lw.get(i).getTel())){
						if(!value.equals(tel)){
							map.put("info","该手机号码已有人使用");
							map.put("status","n");
							break;
						}
					}
					if(i==lw.size()-1){
						map.put("info","");
						map.put("status","y");
					}
				}
			}else{
				map.put("info","");
				map.put("status","y");
			}
			if(name.equals("age")){
				int age=Integer.parseInt(value);
	//			System.out.println(age);
				if(age>100||age<20){
					map.put("info","年龄应该在20-100岁之间");
					map.put("status","n");
				}else{
					map.put("info","");
					map.put("status","y");
				}
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
