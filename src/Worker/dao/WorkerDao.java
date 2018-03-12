package Worker.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import Manager.model.Manager;
import Page.model.PageBean;
import Worker.model.Worker;
import Worker.model.WorkerType;
import util.DBUtil;

public class WorkerDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	public int getWorkerTypeCount(){
		String sql="select count(*) as num from workertype";
  	  	Map<String, Object> map=DBUtil.query(sql);
  	  	if(map!=null&&map.size()!=0){
  	  		return  Integer.parseInt(map.get("num").toString());
  	  	}else{
  	  		return 0;
  	  	}	
	}
	
	public List<WorkerType> queryWorkerType(PageBean page){
			List<WorkerType> lw =new ArrayList<WorkerType>();
			String sql ="select * from workertype limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
			List<Map<String,Object>> lmap =DBUtil.list(sql);
			if(lmap.size()>0){
			//	System.out.println(lmap.size());
				for(int i=0;i<lmap.size();i++){
					WorkerType wt = new WorkerType();
					wt.setDiscripe((String)lmap.get(i).get("Discripe"));
					wt.setWorkerTypeId((int)lmap.get(i).get("WorkerTypeId"));
					wt.setWorkerTypeName((String)lmap.get(i).get("WorkerTypeName"));
					wt.setAddTime(sf.format((Date)lmap.get(i).get("AddTime")));
					wt.setNumber((String)lmap.get(i).get("Number"));
					wt.setStatus((String)lmap.get(i).get("Status"));
				//	System.out.println(ms);
					lw.add(wt);
				}
	//			System.out.println(lmap.size());
				return lw;
			}else {
				return null;
			}
	}
	
	public List<WorkerType> queryallworktype(){
		String sql = "select * from workertype";
		List<Map<String, Object>> lm=DBUtil.list(sql);
		List<WorkerType> lw = new ArrayList<WorkerType>();
		if(lm.size()>0){
			for(int i=0;i<lm.size();i++){
				WorkerType wt=new WorkerType();
				wt.setDiscripe((String)lm.get(i).get("Discripe"));
				wt.setWorkerTypeId((int)lm.get(i).get("WorkerTypeId"));
				wt.setWorkerTypeName((String)lm.get(i).get("WorkerTypeName"));
				wt.setAddTime(sf.format((Date)lm.get(i).get("AddTime")));
				wt.setNumber((String)lm.get(i).get("Number"));
				wt.setStatus((String)lm.get(i).get("Status"));
				lw.add(wt);
			}
			return lw;
		}else{
			return null;
		}
	}
	
	public int addworkertype(WorkerType wt){
		String sql="insert into workertype(WorkerTypeName,Discripe,Status,AddTime,Number) values(?,?,?,?,?)";
		int i =DBUtil.executeUpdate(sql,new Object[]{wt.getWorkerTypeName(),wt.getDiscripe(),wt.getStatus(),wt.getAddTime(),wt.getNumber()});
		return i;
	}
	
	public int updateworkertype(WorkerType wt){
		String sql="update workertype set WorkerTypeName=?,Discripe=? where WorkerTypeId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{wt.getWorkerTypeName(),wt.getDiscripe(),wt.getWorkerTypeId()});
		return i;
	}
	
	public int deleteworkertype(String id){
		String sql="delete from workertype where WorkerTypeId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public WorkerType queryworkertype(String id){
		String sql = "select * from workertype where WorkerTypeId=?";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		if(lmap.size()==1){
		//	System.out.println(lmap.size());
			WorkerType wt = new WorkerType();
			for(int i=0;i<lmap.size();i++){
				wt.setDiscripe((String)lmap.get(i).get("Discripe"));
				wt.setWorkerTypeId((int)lmap.get(i).get("WorkerTypeId"));
				wt.setWorkerTypeName((String)lmap.get(i).get("WorkerTypeName"));
				wt.setAddTime(sf.format((Date)lmap.get(i).get("AddTime")));
				wt.setNumber((String)lmap.get(i).get("Number"));
				wt.setStatus((String)lmap.get(i).get("Status"));
			//	System.out.println(ms);
			}
//			System.out.println(lmap.size());
			return wt;
		}else {
			return null;
		}
	}
	
	public int getWorkerCount(String sql){
		System.out.println(sql);
  	  	Map<String, Object> map=DBUtil.query(sql);
  	  	if(map!=null&&map.size()!=0){
  	  		return  Integer.parseInt(map.get("num").toString());
  	  	}else{
  	  		return 0;
  	  	}	
	}
	
	public List<Worker> queryWorker(String sql,PageBean page){
		String sql1=sql+" limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql1);
		List<Map<String,Object>> lm=DBUtil.list(sql1);
		List<Worker> lw=new ArrayList<Worker>();
		//System.out.println(lm);
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				Worker work =new Worker();
				work.setAddTime(sf.format((Date)lm.get(i).get("AddTime")));
				work.setAge(String.valueOf(lm.get(i).get("Age")));
				work.setDeleteStatus((String)lm.get(i).get("DeleteStatus"));
				work.setDiscripe((String)lm.get(i).get("Discripe"));
				work.setIdcard((String)lm.get(i).get("Idcard"));
				work.setPicture((String)lm.get(i).get("Picture"));
				work.setSex((String)lm.get(i).get("Sex"));
				work.setTel((String)lm.get(i).get("Tel"));
				work.setUpdateTime(sf.format((Date)lm.get(i).get("UpdateTime")));
				work.setWorkerType((int)lm.get(i).get("WorkerType"));
				work.setWorkId((int)lm.get(i).get("WorkerId"));
				work.setWorkName((String)lm.get(i).get("WorkerName"));
				work.setWorkTime(sf.format((Date)lm.get(i).get("WorkTime")));
				lw.add(work);
			}
			return lw;
		}else {
			return null;
		}
	}
	
	public List<Worker> queryAllWorker(){
		String sql="select * from worker";
		List<Map<String,Object>> lm=DBUtil.list(sql);
		List<Worker> lw=new ArrayList<Worker>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				Worker work =new Worker();
				work.setAddTime(sf.format((Date)lm.get(i).get("AddTime")));
				work.setAge(String.valueOf(lm.get(i).get("Age")));
				work.setDeleteStatus((String)lm.get(i).get("DeleteStatus"));
				work.setDiscripe((String)lm.get(i).get("Discripe"));
				work.setIdcard((String)lm.get(i).get("Idcard"));
				work.setPicture((String)lm.get(i).get("Picture"));
				work.setSex((String)lm.get(i).get("Sex"));
				work.setTel((String)lm.get(i).get("Tel"));
				work.setUpdateTime(sf.format((Date)lm.get(i).get("UpdateTime")));
				work.setWorkerType((int)lm.get(i).get("WorkerType"));
				work.setWorkId((int)lm.get(i).get("WorkerId"));
				work.setWorkName((String)lm.get(i).get("WorkerName"));
				work.setWorkTime(sf.format((Date)lm.get(i).get("WorkTime")));
				lw.add(work);
			}
			return lw;
		}else {
			return null;
		}
	}
	
	public int addWorker(Worker work){
		String sql="insert into Worker(WorkerName,WorkerType,Idcard,Tel,Age,Discripe,Picture,Sex,AddTime,UpdateTime,DeleteStatus,WorkTime) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int i = DBUtil.executeUpdate(sql,new Object[]{work.getWorkName(),work.getWorkerType(),work.getIdcard(),work.getTel(),work.getAge(),work.getDiscripe(),work.getPicture(),work.getSex(),work.getAddTime(),work.getUpdateTime(),work.getDeleteStatus(),work.getWorkTime()});
		return i;
	}
	
	public int deleteWorker(String id){
		String sql="delete from worker where WorkerId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public List<Worker> queryWorker(String id){
		String sql="select * from worker where WorkerId=?";
		List<Map<String,Object>> lm=DBUtil.list(sql,id);
		List<Worker> lw=new ArrayList<Worker>();
		if(lm!=null&&lm.size()==1){
			for(int i=0;i<lm.size();i++){
				Worker work =new Worker();
				work.setAddTime(sf.format((Date)lm.get(i).get("AddTime")));
				work.setAge(String.valueOf(lm.get(i).get("Age")));
				work.setDeleteStatus((String)lm.get(i).get("DeleteStatus"));
				work.setDiscripe((String)lm.get(i).get("Discripe"));
				work.setIdcard((String)lm.get(i).get("Idcard"));
				work.setPicture((String)lm.get(i).get("Picture"));
				work.setSex((String)lm.get(i).get("Sex"));
				work.setTel((String)lm.get(i).get("Tel"));
				work.setUpdateTime(sf.format((Date)lm.get(i).get("UpdateTime")));
				work.setWorkerType((int)lm.get(i).get("WorkerType"));
				work.setWorkId((int)lm.get(i).get("WorkerId"));
				work.setWorkName((String)lm.get(i).get("WorkerName"));
				work.setWorkTime(sf.format((Date)lm.get(i).get("WorkTime")));
				lw.add(work);
			}
			return lw;
		}else {
			return null;
		}
	}
	
	public int updateWorker(Worker work){
		String sql="update worker set WorkerName=?,WorkerType=?,Idcard=?,Tel=?,Age=?,Discripe=?,Picture=?,Sex=?,UpdateTime=?,DeleteStatus=?,WorkTime=? where WorkerId=?";
		int i = DBUtil.executeUpdate(sql,new Object[]{work.getWorkName(),work.getWorkerType(),work.getIdcard(),work.getTel(),work.getAge(),work.getDiscripe(),work.getPicture(),work.getSex(),work.getUpdateTime(),work.getDeleteStatus(),work.getWorkTime(),work.getWorkId()});
		return i;
	}
	
	public int changestatus(String status,String id){
	//	System.out.println(status+id);
		String sql="update worker set DeleteStatus=? where WorkerId=?";
	//	System.out.println(sql);
		int i=DBUtil.executeUpdate(sql,new Object[]{status,id});
		return i;
	}
	
	public int updateworkertype(int workerid){
		String sql ="update worker set WorkerType=0 where WorkerType=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{workerid});
		return i;
	}
	
	public Long countworker(int i){
		String sql="select count(*) as num from worker where WorkerType=?";
		Map<String,Object> map=DBUtil.query(sql, i);
		return (Long) map.get("num");
	}

	public int updateselfmessage(Worker worker) {
		// TODO Auto-generated method stub
		String sql="update worker set WorkerName=?,Sex=?,Age=?,UpdateTime=?,Idcard=?,Tel=?,Discripe=?,WorkTime=? where WorkerId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{worker.getWorkName(),worker.getSex(),worker.getAge(),worker.getUpdateTime(),worker.getIdcard(),worker.getTel(),worker.getDiscripe(),worker.getWorkTime(),worker.getWorkId()});
		return i;
	}
	
	public int updateworkerpicture(String picaddress,String id){
		String sql="update worker set Picture=? where WorkerId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{picaddress,id});
		return i;
	}
}
