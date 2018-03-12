package Job.service;

import java.util.List;

import Client.dao.CollectDao;
import Client.model.Collect;
import Job.dao.JobCollectDao;
import Job.model.JobCollect;

public class JobCollectService {
	
JobCollectDao cd=new JobCollectDao();
	
	public List<JobCollect> queryalljobcollect() throws Exception{
		try{
			return cd.queryalljobcollect();
		}catch(Exception e){
			throw new Exception("查询收藏信息失败，原因是："+e.getMessage());
		}
	}
	
	public int addjobcollect(JobCollect col) throws Exception{
		try{
			return cd.addjobcollect(col);
		}catch(Exception e){
			throw new Exception("添加收藏失败，原因是："+e.getMessage());
		}
	}
	
	public int deletejobcollect(String id) throws Exception{
		try{
			return cd.deletejobcollect(id);
		}catch(Exception e){
			throw new Exception("取消收藏失败，原因是："+e.getMessage());
		}
	}

}
