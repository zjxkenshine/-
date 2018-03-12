package Manager.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import Manager.dao.ManagerDao;
import Manager.model.Manager;
import Manager.model.ManagerStatus;
import Page.model.PageBean;

public class ManagerService {
	ManagerDao md=new ManagerDao();
	
	public Map<String,Object> querymanager(String managername) throws Exception{
		try{
		//	System.out.println(md.querymanager(managername));
			return md.querymanager(managername);
			
		}catch(Exception e){
			throw new Exception("查询管理员失败，原因是："+e.getMessage());
		}
	}
	
	public Manager managerquery(String managername) throws Exception{
		try{
			//System.out.println(md.managerquery(managername));
			return md.managerquery(managername);
		}catch(Exception e){
			throw new Exception("查询管理员失败，原因是："+e.getMessage());
		}
	}
	
	public int getStatusCount() throws Exception{
		
		   try{
			   return md.getStatusCount();
		   }catch(Exception e){
			   throw new Exception("查询权限总数失败，原因是："+e.getMessage());
		   }
	}
	
	public int getManagerCount() throws Exception{
		
		   try{
			   return md.getManagerCount();
		   }catch (Exception e){
			   throw new Exception("查询管理员总数失败，原因是："+e.getMessage());
		   }
	}
	
	public int getStatusCount(String key) throws Exception{
		if(!key.equals("")){
			 try{
				   return md.getStatusCount(key);
			   }catch(Exception e){
				   throw new Exception("查询权限总数失败，原因是："+e.getMessage());
			   }
		}else{
			try{
				   return md.getStatusCount();
			   }catch(Exception e){
				   throw new Exception("查询权限总数失败，原因是："+e.getMessage());
			   }
		}
	}
	
	public List<ManagerStatus> querystatus(PageBean page) throws Exception{
		try{
			return md.querystatus(page);
		}catch(Exception e){
			throw new Exception("查询权限失败，原因是："+e.getMessage());
		}
		
	}
	
	public List<ManagerStatus> queryallstatus() throws Exception{
		try{
			return md.queryallmanagerstatus();
		}catch(Exception e){
			throw new Exception("查询权限失败，原因是："+e.getMessage());
		}
	}
	
	public int addstatus(ManagerStatus status) throws Exception{
		try{
			int i=md.addstatus(status);
			if(i>0){
				return i;
			}else {
				throw new Exception("添加权限失败");
			}
		}catch(Exception e){
			throw new Exception("添加权限失败，原因是："+e.getMessage());
		}
	}
	
	public ManagerStatus querystatus(String id) throws Exception{
		try{
			return md.querystatus(id);
		}catch(Exception e){
			throw new Exception("查询权限失败，原因是："+e.getMessage());
		}
	}
	
	public int updateStatus(ManagerStatus msStatus) throws Exception{
		try{
			int i = md.updateStatus(msStatus);
			if(i==1){
				return i;
			}else {
				throw new Exception("修改权限失败");
			}
		}catch(Exception e){
			throw new Exception("修改权限失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteStatus(int id) throws Exception{
		try{
			int i = md.deleteStatus(id);
			if(i==1){
				return i;
			}else {
				throw new Exception("修改权限失败");
			}
		}catch(Exception e){
			throw new Exception("修改权限失败，原因是："+e.getMessage());
		}
	}
	
	public List<ManagerStatus> querystatus(String key,PageBean page) throws Exception{
		try{
			if(key!=""){
				return md.querystatus(key,page);
			}else {
				return md.querystatus(page);
			}
		}catch(Exception e){
			throw new Exception("查询权限失败，原因是："+e.getMessage());
		}
	}
	
	
	public int getManagerCount(Manager manager) throws Exception{
		   try{
			   //判断拼接字符串
			   String sql="select count(*) as num from manager where 1=1";
			   if(manager.getManagerId()!=0){
				   sql=sql+" and ManagerId="+manager.getManagerId();
			   }
			   if(manager.getManagerName()!=null&&!manager.getManagerName().equals("")){
				   sql=sql+" and ManagerName like '%"+manager.getManagerName()+"%'";
			   }
			   if(manager.getE_mail()!=null&&!manager.getE_mail().equals("")){
				   sql=sql+" and E_mail like '%"+manager.getE_mail()+"%'";
			   }
			   if(manager.getStatus()!=0&&manager.getStatus()!=2058924627){
				   sql=sql+" and Status ="+manager.getStatus();
			   }
			   if(manager.getStatus()==2058924627){
				   sql=sql+" and Status=0";
			   }
			   if(manager.getWorkerId()!=0){
				   sql=sql+" and WorkerId ="+manager.getWorkerId();
			   }
			   if(manager.getDeleteStatus()!=null&&!manager.getDeleteStatus().equals("")){
				   sql=sql+" and DeleteStatus='"+manager.getDeleteStatus()+"'";
			   }
			   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(manager.getRegisterTime()!=null&&!manager.getRegisterTime().trim().equals("")){
					String addtime[]=manager.getRegisterTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and RegisterTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and RegisterTime>='"+sf.format(date2)+"' and RegisterTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and RegisterTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and RegisterTime>='"+sf.format(date1)+"' and RegisterTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and RegisterTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				
				//查询反值
				return md.getManagerCount(sql);
				
		   }catch (Exception e){
			   throw new Exception("查询管理员总数失败，原因是："+e.getMessage());
		   }
	}
	
	public List<Manager> queryManager(Manager manager,PageBean page) throws Exception{
		try{
			  //判断拼接字符串
			   String sql="select * from manager where 1=1";
			   if(manager.getManagerId()!=0){
				   sql=sql+" and ManagerId="+manager.getManagerId();
			   }
			   if(manager.getManagerName()!=null&&!manager.getManagerName().equals("")){
				   sql=sql+" and ManagerName like '%"+manager.getManagerName()+"%'";
			   }
			   if(manager.getE_mail()!=null&&!manager.getE_mail().equals("")){
				   sql=sql+" and E_mail like '%"+manager.getE_mail()+"%'";
			   }
			   if(manager.getStatus()!=0&&manager.getStatus()!=2058924627){
				   sql=sql+" and Status ="+manager.getStatus();
			   }
			   if(manager.getStatus()==2058924627){
				   sql=sql+" and Status=0";
			   }
			   if(manager.getWorkerId()!=0){
				   sql=sql+" and WorkerId ="+manager.getWorkerId();
			   }
			   if(manager.getDeleteStatus()!=null&&!manager.getDeleteStatus().equals("")){
				   sql=sql+" and DeleteStatus='"+manager.getDeleteStatus()+"'";
			   }
			   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(manager.getRegisterTime()!=null&&!manager.getRegisterTime().trim().equals("")){
					String addtime[]=manager.getRegisterTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and RegisterTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and RegisterTime>='"+sf.format(date2)+"' and RegisterTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and RegisterTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and RegisterTime>='"+sf.format(date1)+"' and RegisterTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and RegisterTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				
				//查询并反值
				return md.queryManager(sql, page);
		}catch(Exception e){
			throw new Exception("查询管理员失败，原因是："+e.getMessage());
		}
		
	}
	
	public List<Manager> queryManager(Manager manager) throws Exception{
		try{
			  //判断拼接字符串
			   String sql="select * from manager where 1=1";
			   if(manager.getManagerId()!=0){
				   sql=sql+" and ManagerId="+manager.getManagerId();
			   }
			   if(manager.getManagerName()!=null&&!manager.getManagerName().equals("")){
				   sql=sql+" and ManagerName like '%"+manager.getManagerName()+"%'";
			   }
			   if(manager.getE_mail()!=null&&!manager.getE_mail().equals("")){
				   sql=sql+" and E_mail like '%"+manager.getE_mail()+"%'";
			   }
			   if(manager.getStatus()!=0&&manager.getStatus()!=2058924627){
				   sql=sql+" and Status ="+manager.getStatus();
			   }
			   if(manager.getStatus()==2058924627){
				   sql=sql+" and Status=0";
			   }
			   if(manager.getWorkerId()!=0){
				   sql=sql+" and WorkerId ="+manager.getWorkerId();
			   }
			   if(manager.getDeleteStatus()!=null&&!manager.getDeleteStatus().equals("")){
				   sql=sql+" and DeleteStatus='"+manager.getDeleteStatus()+"'";
			   }
			   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(manager.getRegisterTime()!=null&&!manager.getRegisterTime().trim().equals("")){
					String addtime[]=manager.getRegisterTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and RegisterTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and RegisterTime>='"+sf.format(date2)+"' and RegisterTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and RegisterTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and RegisterTime>='"+sf.format(date1)+"' and RegisterTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				
				//查询并反值
				return md.queryManager(sql);
		}catch(Exception e){
			throw new Exception("查询管理员失败，原因是："+e.getMessage());
		}
		
	}
	
	public List<Manager> queryallmanager() throws Exception{
		try{
			return md.queryallmanager();
		}catch(Exception e){
			throw new Exception("查询所有管理员失败，原因是："+e.getMessage());
		}
	}
	
	public int addmanager(Manager manager) throws Exception{
		try{
			int i=md.addmanager(manager);
			if(i>0){
				return i;
			}else {
				throw new Exception("添加管理员失败");
			}
		}catch(Exception e){
			throw new Exception("添加管理员失败，原因是："+e.getMessage());
		}
	}
	
	public int changemanagerstatus(String id,String status) throws Exception{
		try{
			 int i= md.changemanagerstatus(id,status);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("更新管理员状态失败");
			   }
		}catch(Exception e){
			 throw new Exception("更新管理员状态失败，原因是："+e.getMessage());
		}
	}
	
	public int deletemanager(String  id) throws Exception{
		try{
			 int i= md.deletemanager(id);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("删除管理员失败");
			   }
		}catch(Exception e){
			 throw new Exception("删除管理员失败，原因是："+e.getMessage());
		}
		
	}
	
	public List<Manager> queryallmanager(String id) throws Exception{
		try{
			return md.queryallmanager(id);
		}catch(Exception e){
			 throw new Exception("查询管理员失败，原因是："+e.getMessage());
		}
	}
	
	public int updatemanager(Manager manager) throws Exception{
		try{
			 int i= md.updatemanager(manager);
			   
				   return i;
			   
		}catch(Exception e){
			 throw new Exception("更新管理员失败，原因是："+e.getMessage());
		}
	}
	
	public int updatemanagerstatus1(Manager manager) throws Exception{
		try{
			 int i= md.updatemanagerstatus1(manager);
			   
				   return i;
			  
		}catch(Exception e){
			 throw new Exception("更新管理员状态失败，原因是："+e.getMessage());
		}
	}
	
	public int updatemanagerstatus2(String id) throws Exception{
		try{
			 int i= md.updatemanagerstatus2(id);
			  
				   return i;
			  
		}catch(Exception e){
			 throw new Exception("更新管理员状态失败，原因是："+e.getMessage());
		}
	}
	
	public int updatemanagerstatus3(String id) throws Exception{
		try{
			 int i= md.updatemanagerstatus3(id);
			  
				   return i;
			   
		}catch(Exception e){
			 throw new Exception("更新管理员状态失败，原因是："+e.getMessage());
		}
	}
	
	public int deletemanagerworkerid(String workerid) throws Exception{
		try{
			 int i= md.deletemanagerworkerid(workerid);
			  
			return i;
			  
		}catch(Exception e){
			 throw new Exception("删除管理员失败，原因是："+e.getMessage());
		}
	}
	
	public int updatenumber(ManagerStatus ms) throws Exception{
		try{
			 int i= md.updatenumber(ms);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("修改权限数量失败");
			   }
		}catch(Exception e){
			 throw new Exception("修改权限数量失败，原因是："+e.getMessage());
		}
	}
	
	public Long countmanager(int i) throws Exception{
		try{
			return md.countmanager(i);
		}catch(Exception e){
			 throw new Exception("查询权限数量失败，原因是："+e.getMessage());
		}
	}
	
	public int updateselfpassword(String password,int ManagerId) throws Exception{
		try{
			return md.updateselfpassword(password,ManagerId);
		}catch(Exception e){
			 throw new Exception("修改密码失败，原因是："+e.getMessage());
		}
	}
	
	public int updateselfmessage(Manager manager) throws Exception{
		try{
			return md.updateselmessage(manager);
		}catch(Exception e){
			 throw new Exception("修改密码失败，原因是："+e.getMessage());
		}
	}
	
	public int uploadmanagerpicture(String managerpic,String managerid) throws Exception{
		try{
			return md.uploadmanagerpicture(managerpic, managerid);
		}catch(Exception e){
			throw new Exception("修改密码失败，原因是："+e.getMessage());
		}
	}
	
}
