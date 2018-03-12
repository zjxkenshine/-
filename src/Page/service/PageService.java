package Page.service;

import Page.dao.PageDao;
import Page.model.Page;

public class PageService {

	PageDao pd = new PageDao();
	
	public Page querypagesize(Page page) throws Exception{
		try{
			return pd.querypagesize(page);
		}catch(Exception e){
			throw new Exception("查询页面信息失败，原因是："+e.getMessage());
		}
	}
	
	public long querypage(Page page) throws Exception{
		try{
			return pd.querypage(page);
		}catch(Exception e){
			throw new Exception("查询页面信息是否存在失败，原因是："+e.getMessage());
		}
	}
	
	public int updatepage(Page page) throws Exception{
		try{
			int i=pd.updatepage(page);
			if(i==1){
				return i;
			}else {
				throw new Exception("更新页面信息失败");
			}
		}catch(Exception e){
			throw new Exception("更新页面信息失败，原因是："+e.getMessage());
		}
	}
	
	public int addpage(Page page) throws Exception{
		try{
			int i=pd.addpage(page);
			if(i==1){
				return i;
			}else {
				throw new Exception("添加页面信息失败");
			}
		}catch(Exception e){
			throw new Exception("添加页面信息失败，原因是："+e.getMessage());
		}
	}
	
	public int updatenowpage(Page page) throws Exception{
		try{
			int i=pd.updatenowpage(page);
			if(i==1){
				return i;
			}else {
				throw new Exception("更新当前页信息失败");
			}
		}catch(Exception e){
			throw new Exception("更新当前页面信息失败，原因是："+e.getMessage());
		}
	}
	
	public int deletepage(String managerid) throws Exception{
		try{
			return pd.deletepage(managerid);
		}catch(Exception e){
			throw new Exception("删除页面信息失败，原因是："+e.getMessage());
		}
	}
	
	public int updatepagesize(int i) throws Exception{
		try{
			return pd.updatepagesize(i);
		}catch(Exception e){
			throw new Exception("清理页面信息失败，原因是："+e.getMessage());
		}
	}
}
