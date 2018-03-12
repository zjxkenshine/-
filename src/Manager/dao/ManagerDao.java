package Manager.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import Manager.model.Manager;
import Manager.model.ManagerStatus;
import Page.model.PageBean;
import util.DBUtil;

public class ManagerDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

	public Map<String,Object> querymanager(String managername){
		String sql = "select * from Manager where ManagerName=?";
		List<Map<String,Object>> map =DBUtil.list(sql,managername);
		if(map.size()==1){
//			System.out.println(map);
			return map.get(0);
		}else {
			return null;
		}
	}
	
	public Manager managerquery(String managername){
		Manager ma = new Manager();
		String sql = "select * from Manager where ManagerName=?";
		Map<String,Object> map = DBUtil.query(sql,managername);
		ma.setE_mail((String)map.get("E_mail"));
		ma.setManagerId((int)map.get("ManagerId"));
		ma.setManagerName((String)map.get("ManagerName"));
		ma.setPassword((String)map.get("Password"));
		ma.setRegisterTime(sf.format((Date)map.get("RegisterTime")));
		ma.setStatus((int)map.get("Status"));
		ma.setUpdateTime(sf.format((Date)map.get("UpdateTime")));
		ma.setDeleteStatus((String)map.get("DeleteStatus"));
		ma.setDiscripe((String)map.get("Discripe"));
		ma.setWorkerId((int)map.get("WorkerId"));
		ma.setPicture((String)map.get("Picture"));
		ma.setUseStatus((int)map.get("UseStatus"));
		return ma;
	}
	
	public int getStatusCount(){
		  String sql="select count(*) as num from managerstatus";
    	  Map<String, Object> map=DBUtil.query(sql);
    	  if(map!=null&&map.size()!=0){
    		  return  Integer.parseInt(map.get("num").toString());
    	  }else{
    		  return 0;
    	  }
    	  
	}
	
	public int getManagerCount(){
		  String sql="select count(*) as num from manager";
  	  Map<String, Object> map=DBUtil.query(sql);
  	  if(map!=null&&map.size()!=0){
  		  return  Integer.parseInt(map.get("num").toString());
  	  }else{
  		  return 0;
  	  }
  	  
	}
	
	public int getStatusCount(String key){
		  String sql="select count(*) as num from managerstatus where ManagerStatusId=? or ManagerStatusName like '%"+key+"%'";
  	  Map<String, Object> map=DBUtil.query(sql,new Object[]{key});
  	  if(map!=null&&map.size()!=0){
  		  return  Integer.parseInt(map.get("num").toString());
  	  }else{
  		  return 0;
  	  }
  	  
	}
	
	public List<ManagerStatus> querystatus(PageBean page){
		
		List<ManagerStatus> lm =new ArrayList<ManagerStatus>();
		String sql ="select * from managerstatus  limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		if(lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				ManagerStatus ms = new ManagerStatus();
				ms.setManagerStatusId((int)lmap.get(i).get("ManagerStatusId"));
				ms.setDiscription((String)lmap.get(i).get("Discription"));
				ms.setManagerStatusName((String)lmap.get(i).get("ManagerStatusName"));
				ms.setNumber((String)lmap.get(i).get("Number"));
				ms.setAddTime((String)lmap.get(i).get("AddTime"));
				ms.setStatusType((String)lmap.get(i).get("StatusType"));
			//	System.out.println(ms);
				lm.add(ms);
			}
			return lm;
		}else {
			return null;
		}
		
	}
	
	public List<ManagerStatus> queryallmanagerstatus(){
		List<ManagerStatus> lm =new ArrayList<ManagerStatus>();
		String sql ="select * from managerstatus";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		if(lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				ManagerStatus ms = new ManagerStatus();
				ms.setManagerStatusId((int)lmap.get(i).get("ManagerStatusId"));
				ms.setDiscription((String)lmap.get(i).get("Discription"));
				ms.setManagerStatusName((String)lmap.get(i).get("ManagerStatusName"));
				ms.setNumber((String)lmap.get(i).get("Number"));
				ms.setAddTime((String)lmap.get(i).get("AddTime"));
				ms.setStatusType((String)lmap.get(i).get("StatusType"));
			//	System.out.println(ms);
				lm.add(ms);
			}
			return lm;
		}else {
			return null;
		}
	}
	
	public int addstatus(ManagerStatus status){
		String sql="insert into managerstatus(ManagerStatusName,StatusType,Discription,AddTime,Number) values(?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql,new Object[]{status.getManagerStatusName(),status.getStatusType(),status.getDiscription(),status.getAddTime(),status.getNumber()});
		return i;
	}
	
	public ManagerStatus querystatus(String id){
		String sql ="select * from managerstatus where ManagerStatusId=?";
		List<Map<String,Object>> map=DBUtil.list(sql, id);
		if(map.size()==1){
			ManagerStatus ms=new ManagerStatus();
			ms.setManagerStatusId((int)map.get(0).get("ManagerStatusId"));
			ms.setManagerStatusName((String)map.get(0).get("ManagerStatusName"));
			ms.setNumber((String)map.get(0).get("Number"));
			ms.setDiscription((String)map.get(0).get("Discription"));
			ms.setAddTime((String)map.get(0).get("AddTime"));
			ms.setStatusType((String)map.get(0).get("StatusType"));
			return ms;
		}else {
			return null;
		}
	}
	
	public int updateStatus(ManagerStatus msStatus){
		System.out.println(msStatus);
		String sql ="update managerstatus set ManagerStatusName=?,Discription=?,StatusType=? where ManagerStatusId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{msStatus.getManagerStatusName(),msStatus.getDiscription(),msStatus.getStatusType(),msStatus.getManagerStatusId()});
		return i;
	}
	
	public int deleteStatus(int id){
		String sql="delete from managerstatus where ManagerStatusId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public List<ManagerStatus> querystatus(String key,PageBean page){
		String sql="select * from managerstatus where ManagerStatusId=? or ManagerStatusName like '%"+key+"%' limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		List<Map<String,Object>> lm =DBUtil.list(sql, new Object[]{key});
		List<ManagerStatus> lma=new ArrayList<ManagerStatus>();
		if(lm.size()>0){
			for(int i=0;i<lm.size();i++){
					ManagerStatus ms=new ManagerStatus();
					ms.setManagerStatusId((int)lm.get(i).get("ManagerStatusId"));
					ms.setManagerStatusName((String)lm.get(i).get("ManagerStatusName"));
					ms.setNumber((String)lm.get(i).get("Number"));
					ms.setDiscription((String)lm.get(i).get("Discription"));
					ms.setAddTime((String)lm.get(i).get("AddTime"));
					ms.setStatusType((String)lm.get(i).get("StatusType"));
					lma.add(ms);
			}
			return lma;
		}else {
			return null;
		}
	}
	
	public List<Manager> queryManager(String sql,PageBean page){
		
		List<Manager> lm =new ArrayList<Manager>();
		String sql1 =sql+" limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql1);
		List<Map<String,Object>> map =DBUtil.list(sql1);
		if(map.size()>0){
			for(int i=0;i<map.size();i++){
				Manager ma = new Manager();
				ma.setE_mail((String)map.get(i).get("E_mail"));
				ma.setManagerId((int)map.get(i).get("ManagerId"));
				ma.setManagerName((String)map.get(i).get("ManagerName"));
				ma.setPassword((String)map.get(i).get("Password"));
				ma.setRegisterTime(sf.format((Date)map.get(i).get("RegisterTime")));
				ma.setStatus((int)map.get(i).get("Status"));
				ma.setUpdateTime(sf.format((Date)map.get(i).get("UpdateTime")));
				ma.setDeleteStatus((String)map.get(i).get("DeleteStatus"));
				ma.setDiscripe((String)map.get(i).get("Discripe"));
				ma.setWorkerId((int)map.get(i).get("WorkerId"));
				ma.setPicture((String)map.get(i).get("Picture"));
				ma.setUseStatus((int)map.get(i).get("UseStatus"));
	//			System.out.println(ma);
				lm.add(ma);
			}
			return lm;
		}else {
			return null;
		}
		
	}
	
	public List<Manager> queryManager(String sql){
		
		List<Manager> lm =new ArrayList<Manager>();
		System.out.println(sql);
		List<Map<String,Object>> map =DBUtil.list(sql);
		if(map.size()>0){
			for(int i=0;i<map.size();i++){
				Manager ma = new Manager();
				ma.setE_mail((String)map.get(i).get("E_mail"));
				ma.setManagerId((int)map.get(i).get("ManagerId"));
				ma.setManagerName((String)map.get(i).get("ManagerName"));
				ma.setPassword((String)map.get(i).get("Password"));
				ma.setRegisterTime(sf.format((Date)map.get(i).get("RegisterTime")));
				ma.setStatus((int)map.get(i).get("Status"));
				ma.setUpdateTime(sf.format((Date)map.get(i).get("UpdateTime")));
				ma.setDeleteStatus((String)map.get(i).get("DeleteStatus"));
				ma.setDiscripe((String)map.get(i).get("Discripe"));
				ma.setWorkerId((int)map.get(i).get("WorkerId"));
				ma.setPicture((String)map.get(i).get("Picture"));
				ma.setUseStatus((int)map.get(i).get("UseStatus"));
	//			System.out.println(ma);
				lm.add(ma);
			}
			return lm;
		}else {
			return null;
		}
		
	}
	
	public int getManagerCount(String sql){
	  Map<String, Object> map=DBUtil.query(sql);
	  if(map!=null&&map.size()!=0){
		  return  Integer.parseInt(map.get("num").toString());
	  }else{
		  return 0;
	  }
	  
	}
	
	public List<Manager> queryallmanager(){

		List<Manager> lm =new ArrayList<Manager>();
		String sql="select * from manager";
		List<Map<String,Object>> map =DBUtil.list(sql);
		if(map.size()>0){
			for(int i=0;i<map.size();i++){
				Manager ma = new Manager();
				ma.setE_mail((String)map.get(i).get("E_mail"));
				ma.setManagerId((int)map.get(i).get("ManagerId"));
				ma.setManagerName((String)map.get(i).get("ManagerName"));
				ma.setPassword((String)map.get(i).get("Password"));
				ma.setRegisterTime(sf.format((Date)map.get(i).get("RegisterTime")));
				ma.setStatus((int)map.get(i).get("Status"));
				ma.setUpdateTime(sf.format((Date)map.get(i).get("UpdateTime")));
				ma.setDeleteStatus((String)map.get(i).get("DeleteStatus"));
				ma.setDiscripe((String)map.get(i).get("Discripe"));
				ma.setWorkerId((int)map.get(i).get("WorkerId"));
				ma.setPicture((String)map.get(i).get("Picture"));
				ma.setUseStatus((int)map.get(i).get("UseStatus"));
	//			System.out.println(ma);
				lm.add(ma);
			}
			return lm;
		}else {
			return null;
		}
	}
	
	public int addmanager(Manager manager){
		String sql="insert into manager(ManagerName,WorkerId,Password,Status,E_mail,Discripe,DeleteStatus,RegisterTime,UpdateTime,Picture) values(?,?,?,?,?,?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql,new Object[]{manager.getManagerName(),manager.getWorkerId(),manager.getPassword(),manager.getStatus(),manager.getE_mail(),manager.getDiscripe(),manager.getDeleteStatus(),manager.getRegisterTime(),manager.getUpdateTime(),manager.getPicture()});
		return i;
	}
	
	public int changemanagerstatus(String id,String status){
		String sql="update manager set DeleteStatus=? where ManagerId=?";
	//	System.out.println(sql);
		int i=DBUtil.executeUpdate(sql,new Object[]{status,id});
		return i;
	}

	public int deletemanager(String  id){
		String sql="delete from manager where ManagerId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public List<Manager> queryallmanager(String id){
		List<Manager> lm =new ArrayList<Manager>();
		String sql="select * from manager where ManagerId=?";
		List<Map<String,Object>> map =DBUtil.list(sql,id);
		if(map.size()>0){
			for(int i=0;i<map.size();i++){
				Manager ma = new Manager();
				ma.setE_mail((String)map.get(i).get("E_mail"));
				ma.setManagerId((int)map.get(i).get("ManagerId"));
				ma.setManagerName((String)map.get(i).get("ManagerName"));
				ma.setPassword((String)map.get(i).get("Password"));
				ma.setRegisterTime(sf.format((Date)map.get(i).get("RegisterTime")));
				ma.setStatus((int)map.get(i).get("Status"));
				ma.setUpdateTime(sf.format((Date)map.get(i).get("UpdateTime")));
				ma.setDeleteStatus((String)map.get(i).get("DeleteStatus"));
				ma.setDiscripe((String)map.get(i).get("Discripe"));
				ma.setWorkerId((int)map.get(i).get("WorkerId"));
				ma.setPicture((String)map.get(i).get("Picture"));
				ma.setUseStatus((int)map.get(i).get("UseStatus"));
	//			System.out.println(ma);
				lm.add(ma);
			}
			return lm;
		}else {
			return null;
		}
	}
	
	public int updatemanager(Manager manager){
		String sql ="update manager set ManagerName=?,WorkerId=?,Status=?,E_mail=?,Discripe=?,DeleteStatus=?,UpdateTime=? where ManagerId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{manager.getManagerName(),manager.getWorkerId(),manager.getStatus(),manager.getE_mail(),manager.getDiscripe(),manager.getDeleteStatus(),manager.getUpdateTime(),manager.getManagerId()});
		return i;
	}
	
	public int updatemanagerstatus1(Manager manager){
		String sql ="update manager set Status=0 where Status=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{manager.getStatus()});
		return i;
	}
	
	public int updatemanagerstatus2(String workerid){
		String sql ="update manager set DeleteStatus='0' where WorkerId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{workerid});
		return i;
	}
	
	public int updatemanagerstatus3(String workerid){
		String sql ="update manager set DeleteStatus='1' where WorkerId=?";
		int i =DBUtil.executeUpdate(sql,new Object[]{workerid});
		return i;
	}
	
	public int deletemanagerworkerid(String workerid){
		String sql="delete from manager where WorkerId=?";
		int i=DBUtil.executeUpdate(sql,workerid);
		return i;
	}
	
	public int updatenumber(ManagerStatus ms){
		String sql="update managerstatus set Number=? where ManagerStatusId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{ms.getNumber(),ms.getManagerStatusId()});
		return i;
	}
	
	public Long countmanager(int i){
		String sql="select count(*) as num from manager where Status=?";
		Map<String,Object> map=DBUtil.query(sql, i);
		return (Long) map.get("num");
	}
	
	public int updateselfpassword(String password,int ManagerId){
		String sql="update manager set Password=? where ManagerId=?";
		int i =DBUtil.executeUpdate(sql, new Object[]{password,ManagerId});
		return i;
	}
	
	public int updateselmessage(Manager manager){
		String sql="update manager set ManagerName=?,Discripe=?,E_mail=?,UpdateTime=? where ManagerId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{manager.getManagerName(),manager.getDiscripe(),manager.getE_mail(),manager.getUpdateTime(),manager.getManagerId()});
		return i;
	}
	
	public int updateUseStatus1(int id){
		String sql="update manager set UserStatus=1 where ManagerId=?";
		int i =DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public int updateUseStatus2(int id){
		String sql="update manager set UserStatus=0 where ManagerId=?";
		int i =DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public int uploadmanagerpicture(String managerpic,String managerid){
		String sql="update manager set Picture=? where ManagerId=?";
		int i =DBUtil.executeUpdate(sql, new Object[]{managerpic,managerid});
		return i;
	}
	
}
