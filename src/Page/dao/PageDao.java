package Page.dao;

import java.util.Map;

import Page.model.Page;
import util.DBUtil;

public class PageDao {
	
	public Page querypagesize(Page page){
		String sql = "select * from page where PageName=? and ManagerId=?";
		Map<String,Object> map =DBUtil.query(sql, new Object[]{page.getPageName(),page.getManagerId()});
	//	System.out.println(map);
		if(map.size()>0){
			Page p = new Page();
			p.setManagerId((int)map.get("ManagerId"));
			p.setPageId((int)map.get("PageId"));
			p.setPageName((String)map.get("PageName"));
			p.setPageSize((String)map.get("PageSize"));
			p.setNowPage((int)map.get("NowPage"));
			return p;
		}else{
			return null;
		}
	}
	
	public long querypage(Page page){
		String sql = "select count(*) as num from page where PageName=? and ManagerId=?";
		Map<String,Object> map =DBUtil.query(sql, new Object[]{page.getPageName(),page.getManagerId()});
	//	System.out.println(map);
		return (long)map.get("num");
	}
	
	public int updatepage(Page page){
		String sql="update page set PageSize=?,NowPage=? where PageName=? and ManagerId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{page.getPageSize(),page.getNowPage(),page.getPageName(),page.getManagerId()});
		return i;
	}
	
	public int addpage(Page page){
		String sql="insert into page(PageSize,PageName,ManagerId) values(?,?,?)";
		int i =DBUtil.executeUpdate(sql,new Object[]{page.getPageSize(),page.getPageName(),page.getManagerId()});
		return i;
	}
	
	public int updatenowpage(Page page){
		String sql="update page set NowPage=? where PageName=? and ManagerId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{page.getNowPage(),page.getPageName(),page.getManagerId()});
		return i;
	}
	
	public int deletepage(String managerid){
		String sql="delete from  page where ManagerId=?";
		int i =DBUtil.executeUpdate(sql,managerid);
		return i;
	}
	
	public int updatepagesize(int i2){
		String sql="update page set PageSize=5 where ManagerId=?";
		int i =DBUtil.executeUpdate(sql,i2);
		return i;
	}
}
