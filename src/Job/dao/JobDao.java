package Job.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Job.model.Job;

public class JobDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Job> queryallJob(){
		String sql="select * from parttimejob";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		List<Job> lj=new ArrayList<Job>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Job job=new Job();
				job.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				job.setCilentId((int)lmap.get(i).get("CilentId"));
				job.setDiscripe((String)lmap.get(i).get("Discripe"));
				job.setJobId((int)lmap.get(i).get("JobId"));
				job.setJobName((String)lmap.get(i).get("JobName"));
				job.setNeedNum((int)lmap.get(i).get("NeedNum"));
				job.setPicture((String)lmap.get(i).get("Picture"));
				job.setStatus((int)lmap.get(i).get("Status"));
				job.setTel((String)lmap.get(i).get("Tel"));
				job.setWorkPlace((String)lmap.get(i).get("WorkPlace"));
				job.setWorkTime((String)lmap.get(i).get("WorkTime"));
				lj.add(job);
			}
			return lj;
		}else {
			return null;
		}
	} 
	
	public Job queryjob(String id){
		String sql="select * from parttimejob where JobId=?";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			Job job=new Job();
			for(int i=0;i<lmap.size();i++){
				
				job.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				job.setCilentId((int)lmap.get(i).get("CilentId"));
				job.setDiscripe((String)lmap.get(i).get("Discripe"));
				job.setJobId((int)lmap.get(i).get("JobId"));
				job.setJobName((String)lmap.get(i).get("JobName"));
				job.setNeedNum((int)lmap.get(i).get("NeedNum"));
				job.setPicture((String)lmap.get(i).get("Picture"));
				job.setStatus((int)lmap.get(i).get("Status"));
				job.setTel((String)lmap.get(i).get("Tel"));
				job.setWorkPlace((String)lmap.get(i).get("WorkPlace"));
				job.setWorkTime((String)lmap.get(i).get("WorkTime"));
			}
			return job;
		}else {
			return null;
		}
	}
	
	public int addjob(Job job){
		String sql="insert into parttimejob(AddTime,CilentId,Discripe,JobName,NeedNum,Picture,Tel,WorkPlace,WorkTime) values(?,?,?,?,?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql,new Object[]{job.getAddTime(),job.getCilentId(),job.getDiscripe(),job.getJobName(),job.getNeedNum(),job.getPicture(),job.getTel(),job.getWorkPlace(),job.getWorkTime()});
		return i;
	}
	
	public int updatejob(Job job){
		String sql="update parttimejob set AddTime=?,CilentId=?,Discripe=?,JobNam?,NeedNum=?,Picture=?,Tel=?,WorkPlace=?,WorkTime=? where JobId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{job.getAddTime(),job.getCilentId(),job.getDiscripe(),job.getJobName(),job.getNeedNum(),job.getPicture(),job.getTel(),job.getWorkPlace(),job.getWorkTime(),job.getJobId()});
		return i;
	}
	
	public int updatestatus(String status,String id){
		String sql="update parttimejob set Status=? where JobId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{status,id});
		return i;
	}
	
	public int deletejob(String id){
		String sql="delete from parttimejob where JobId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}

}
