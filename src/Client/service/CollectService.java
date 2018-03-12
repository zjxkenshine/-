package Client.service;

import java.util.List;

import Client.dao.CollectDao;
import Client.model.Collect;

public class CollectService {
	
	CollectDao cd=new CollectDao();
	
	public List<Collect> queryallcollect() throws Exception{
		try{
			return cd.queryallcollect();
		}catch(Exception e){
			throw new Exception("查询收藏信息失败，原因是："+e.getMessage());
		}
	}
	
	public int addcollect(Collect col) throws Exception{
		try{
			return cd.addcollect(col);
		}catch(Exception e){
			throw new Exception("添加收藏失败，原因是："+e.getMessage());
		}
	}
	
	public int deletecollect(String id) throws Exception{
		try{
			return cd.deletecollect(id);
		}catch(Exception e){
			throw new Exception("取消收藏失败，原因是："+e.getMessage());
		}
	}
	
	public List<Collect> querycollectbyclientid(int id) throws Exception{
		try{
			return cd.querycollectbyclientid(id);
		}catch(Exception e){
			throw new Exception("查询收藏信息失败，原因是："+e.getMessage());
		}
	}

}
