package Job.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Client.model.Collect;
import Job.model.JobCollect;

public class JobCollectDao {
	
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<JobCollect> queryalljobcollect(){
		String sql="select * from jobcollect";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		System.out.println(lmap);
		List<JobCollect> lc=new ArrayList<JobCollect>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				JobCollect col=new JobCollect();
				col.setClientId((int)lmap.get(i).get("ClientId"));
				col.setCollectId((int)lmap.get(i).get("CollectId"));
				col.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				col.setJobId((int)lmap.get(i).get("JobId"));
				lc.add(col);
			}
			return lc;
		}else{
			return null;
		}
	}
	
	public int addjobcollect(JobCollect col){
		String sql="insert into jobcollect(ClientId,JobId,AddTime) values(?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{col.getClientId(),col.getJobId(),col.getAddTime()});
		return i;
	}
	
	public int deletejobcollect(String id){
		String sql="delete from jobcollect where CollectId=?";
		int i=DBUtil.executeUpdate(sql, id);
		return i;
	}

}
