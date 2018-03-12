package Job.service;

import java.util.List;

import Job.dao.JobDao;
import Job.model.Job;

public class JobService {
	
	JobDao jd=new JobDao();
	
	public List<Job> queryallJob() throws Exception{
		try{
			return jd.queryallJob();
		}catch(Exception e){
			throw new Exception("查询所有兼职信息失败，原因是："+e.getMessage());
		}
	}
	
	public Job queryjob(String id) throws Exception{
		try{
			return jd.queryjob(id);
		}catch(Exception e){
			throw new Exception("查询兼职信息失败，原因是："+e.getMessage());
		}
	}
	
	public int addjob(Job job) throws Exception{
		try{
			return jd.addjob(job);
		}catch(Exception e){
			throw new Exception("添加兼职信息失败，原因是："+e.getMessage());
		}
	}
	
	public int updatejob(Job job) throws Exception{
		try{
			return jd.updatejob(job);
		}catch(Exception e){
			throw new Exception("更新兼职信息失败，原因是："+e.getMessage());
		}
	}
	
	
	public int updatestatus(String status,String id) throws Exception{
		try{
			return jd.updatestatus(status,id);
		}catch(Exception e){
			throw new Exception("更新兼职状态失败，原因是："+e.getMessage());
		}
	}
	
	public int deletejob(String id) throws Exception{
		try{
			return jd.deletejob(id);
		}catch(Exception e){
			throw new Exception("删除兼职状态失败，原因是："+e.getMessage());
		}
	}

}
