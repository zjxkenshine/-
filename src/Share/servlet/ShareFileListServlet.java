package Share.servlet;

import java.io.IOException;
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
import Page.model.Page;
import Page.model.PageBean;
import Page.service.PageService;
import Share.model.ShareFile;
import Share.service.ShareService;

/**
 * Servlet implementation class ShareFileListServlet
 */
@WebServlet("/sharefilelist.do")
public class ShareFileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareFileListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//共享文件列表
		try{
			//接收查询传过来的值
			@SuppressWarnings("unchecked")
			Map<String,String> map=(Map<String, String>)request.getSession().getAttribute("sharefilequery");
			//System.out.println(map);
			ShareFile shf=new ShareFile();
			if(map!=null){
				String managerid=map.get("managerid"); 
				String sharefileid=map.get("sharefileid");
				String uploadtime1=map.get("uploadtime1");
				String uploadtime2=map.get("uploadtime2");
				
				//判定传值
				if(managerid!=null&&!managerid.trim().equals("")){
					shf.setManagerId(Integer.parseInt(managerid));
				}
				if(sharefileid!=null&&!sharefileid.trim().equals("")){
					shf.setShareFileId(Integer.parseInt(sharefileid));
				}
				if(uploadtime2!=null&&!uploadtime2.equals("")){
					uploadtime1=uploadtime1+","+uploadtime2;
				}
				shf.setUploadTime(uploadtime1);
				
			}
			
			//获取页数，页面
			PageService ps = new PageService();
			PageBean page=new PageBean();
			Page pa=new Page();
			pa.setPageName("文件共享表");
			Manager ma = (Manager)request.getSession().getAttribute("user");
			pa.setManagerId(ma.getManagerId());
			//System.out.println(pa);
			Page pb = ps.querypagesize(pa);
			//获取flag
			String flag=(String) request.getSession().getAttribute("flag");
			System.out.println(flag);
			if(pb!=null){
				page.setPageSize(Integer.parseInt((String)pb.getPageSize()));
				if(flag.equals("0")){
					int nowpage=pb.getNowPage();
					System.out.println(nowpage);
					page.setNowPage(nowpage);
				}
			}else{              //否则加表
				ps.addpage(pa);
			}	
			if(flag.equals("1")){
				if(request.getParameter("nowPage")!=null){
					try{
						page.setNowPage(Integer.parseInt(request.getParameter("nowPage")));//得到当前第几页 
			    		System.out.println("nowpage==="+request.getParameter("nowPage"));
					}catch(Exception e){
					}	
		    	}
			}
			ShareService ss=new ShareService();
			
			page.setTotalcount(ss.getsharefilecount(shf));//得到用户 ——总数量
    		page.setTotalpage(ss.getsharefilecount(shf)%page.getPageSize()==0?ss.getsharefilecount(shf)/page.getPageSize():ss.getsharefilecount(shf)/page.getPageSize()+1);//总页数
    		
    		if(page.getTotalpage()<page.getNowPage()){
    			page.setNowPage(page.getTotalpage());
    		}
    		if(page.getNowPage()<=0){
    			page.setNowPage(1);
    		}
    		
//    		System.out.println(page.getTotalcount());
//    		System.out.println(page.getTotalpage());
//    		System.out.println(page.getPageSize());
    		
    		//查询map
    		List<ShareFile> lsh=ss.querysharefile(shf, page);
    		

    		//获取管理员信息,用户名
    		ManagerService ms1= new ManagerService();
    		List<Manager> lmList = ms1.queryallmanager();
    		Map<Integer,String> managername=new HashMap<Integer,String>();
    		if(lmList!=null){
    			for(int i=0;i<lmList.size();i++){
    				managername.put(lmList.get(i).getManagerId(),lmList.get(i).getManagerName());
    			}
    		}
    		
    		//接值跳转
    		request.getSession().setAttribute("flag","1");
    		request.setAttribute("sharefilelist",lsh);
    		request.setAttribute("managername",managername);
    		request.setAttribute("page", page);
			request.getRequestDispatcher("hou/shareFileList.jsp").forward(request, response);
		}catch(Exception e){
			request.setAttribute("message",e.getMessage());	
			request.getRequestDispatcher("hou/error.jsp").forward(request, response);
		}
		
	}

}
