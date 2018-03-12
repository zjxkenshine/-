package Worker.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

















import Page.model.PageBean;
import Worker.dao.WorkerDao;
import Worker.model.Worker;
import Worker.model.WorkerType;

import com.sun.swing.internal.plaf.metal.resources.metal;



public class WorkerService {
	WorkerDao wd = new WorkerDao();
	
	public int getWorkerCount() throws Exception{
		
		   try{ return wd.getWorkerTypeCount();
		   }catch(Exception e){
			   throw new Exception("查询总数失败，原因是："+e.getMessage());
		   }
	}
	
	public int getWorkerCount(Worker work) throws Exception{
		try{
			//判断work中的值并生成不同的SQL语句
			String sql="select count(*) as num from worker where 1=1";
			if(work.getWorkId()!=0){
				sql=sql+" and WorkerId like '%"+work.getWorkId()+"%'";
			}
			if(work.getWorkName()!=null&&!work.getWorkName().trim().equals("")){
				sql=sql+" and WorkerName like '%"+work.getWorkName()+"%'";
			}
			if(work.getWorkerType()!=0){
				sql=sql+" and WorkerType="+work.getWorkerType();
			}
			if(work.getDeleteStatus()!=null&&!work.getDeleteStatus().trim().equals("")){
				sql=sql+" and DeleteStatus="+work.getDeleteStatus();
			}
			if(work.getSex()!=null&&!work.getSex().trim().equals("")){
				sql=sql+" and Sex like '%"+work.getSex()+"%'";
			}
			if(work.getIdcard()!=null&&!work.getIdcard().trim().equals("")){
				sql=sql+" and Idcard like '%"+work.getIdcard()+"%'";
			}
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			if(work.getAddTime()!=null&&!work.getAddTime().trim().equals("")){
				String addtime[]=work.getAddTime().split(",");    //获取添加时间
				if(addtime.length==1){
					Date date=sf.parse(addtime[0]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}else if(addtime.length==2&&!addtime[0].equals("")){
					Date date1=sf.parse(addtime[0]);    
					Date date2=sf.parse(addtime[1]);
					if(date1.after(date2)){
						sql=sql+" and WorkTime>='"+sf.format(date2)+"' and WorkTime<='"+sf.format(date1)+"'";
					}else if(date1.equals(date2)) {
						sql=sql+" and WorkTime='"+sf.format(date1)+"'";
					}else {
						sql=sql+" and WorkTime>='"+sf.format(date1)+"' and WorkTime<='"+sf.format(date2)+"'";
					}
				}else{
					Date date=sf.parse(addtime[1]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}
			}
			if(work.getWorkTime()!=null&&!work.getWorkTime().equals("")){
				String addtime[]=work.getWorkTime().split(",");    //获取入职时间
				if(addtime.length==1){
					Date date=sf.parse(addtime[0]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}else if(addtime.length==2&&!addtime[0].equals("")){
					Date date1=sf.parse(addtime[0]);    
					Date date2=sf.parse(addtime[1]);
					if(date1.after(date2)){
						sql=sql+" and WorkTime>='"+sf.format(date2)+"' and WorkTime<='"+sf.format(date1)+"'";
					}else if(date1.equals(date2)) {
						sql=sql+" and WorkTime='"+sf.format(date1)+"'";
					}else {
						sql=sql+" and WorkTime>='"+sf.format(date1)+"' and WorkTime<='"+sf.format(date2)+"'";
					}
				}else{
					Date date=sf.parse(addtime[1]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}
			}
			if(work.getAge()!=null&&!work.getAge().trim().equals("")){
				String age[]=work.getAge().split(",");    //获取年龄
				if(age.length==1){
					sql=sql+" and Age="+age[0];
				}else if(age.length==2&&!age[0].trim().equals("")){
					int age1=Integer.parseInt(age[0]);   //解析年龄
					int age2=Integer.parseInt(age[1]);
					if(age1>age2){
						sql=sql+" and Age>="+age2+" and Age<="+age1;
					}else if(age1==age2){
						sql=sql+" and Age="+age1;
					}else{
						sql=sql+" and Age>="+age1+" and Age<="+age2;
					}
				}else {
					sql=sql+" and Age="+age[1];
				}
			}
			if(work.getTel()!=null&&!work.getTel().trim().equals("")){
				sql=sql+" and Tel like '%"+work.getTel()+"%'";
			}
		   try{
			   return wd.getWorkerCount(sql);
		   }catch(Exception e){
			   throw new Exception("查询员工数量失败，原因是："+e.getMessage());
		   }
		}catch(Exception e){
			throw new Exception("出现错误，原因是："+e.getMessage());
		}
	}
	
	public List<Worker> queryWorker(Worker work,PageBean page) throws Exception{
		try{
			//判断work中的值并生成不同的SQL语句
			String sql="select * from worker where 1=1";
			if(work.getWorkId()!=0){
				sql=sql+" and WorkerId like '%"+work.getWorkId()+"%'";
			}
			if(work.getWorkName()!=null&&!work.getWorkName().trim().equals("")){
				sql=sql+" and WorkerName like '%"+work.getWorkName()+"%'";
			}
			if(work.getWorkerType()!=0){
				sql=sql+" and WorkerType="+work.getWorkerType();
			}
			if(work.getDeleteStatus()!=null&&!work.getDeleteStatus().trim().equals("")){
				sql=sql+" and DeleteStatus="+work.getDeleteStatus();
			}
			if(work.getSex()!=null&&!work.getSex().trim().equals("")){
				sql=sql+" and Sex like '%"+work.getSex()+"%'";
			}
			if(work.getIdcard()!=null&&!work.getIdcard().trim().equals("")){
				sql=sql+" and Idcard like '%"+work.getIdcard()+"%'";
			}
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			if(work.getAddTime()!=null&&!work.getAddTime().trim().equals("")){
				String addtime[]=work.getAddTime().split(",");    //获取添加时间
				if(addtime.length==1){
					Date date=sf.parse(addtime[0]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}else if(addtime.length==2&&!addtime[0].equals("")){
					Date date1=sf.parse(addtime[0]);    
					Date date2=sf.parse(addtime[1]);
					if(date1.after(date2)){
						sql=sql+" and WorkTime>='"+sf.format(date2)+"' and WorkTime<='"+sf.format(date1)+"'";
					}else if(date1.equals(date2)) {
						sql=sql+" and WorkTime='"+sf.format(date1)+"'";
					}else {
						sql=sql+" and WorkTime>='"+sf.format(date1)+"' and WorkTime<='"+sf.format(date2)+"'";
					}
				}else{
					Date date=sf.parse(addtime[1]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}
			}
			if(work.getWorkTime()!=null&&!work.getWorkTime().equals("")){
				String addtime[]=work.getWorkTime().split(",");    //获取入职时间
				if(addtime.length==1){
					Date date=sf.parse(addtime[0]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}else if(addtime.length==2&&!addtime[0].equals("")){
					Date date1=sf.parse(addtime[0]);    
					Date date2=sf.parse(addtime[1]);
					if(date1.after(date2)){
						sql=sql+" and WorkTime>='"+sf.format(date2)+"' and WorkTime<='"+sf.format(date1)+"'";
					}else if(date1.equals(date2)) {
						sql=sql+" and WorkTime='"+sf.format(date1)+"'";
					}else {
						sql=sql+" and WorkTime>='"+sf.format(date1)+"' and WorkTime<='"+sf.format(date2)+"'";
					}
				}else{
					Date date=sf.parse(addtime[1]);     //解析时间
					sql=sql+" and WorkTime='"+sf.format(date)+"'";   //格式化时间
				}
			}
			if(work.getAge()!=null&&!work.getAge().trim().equals("")){
				String age[]=work.getAge().split(",");    //获取年龄
				if(age.length==1){
					sql=sql+" and Age="+age[0];
				}else if(age.length==2&&!age[0].trim().equals("")){
					int age1=Integer.parseInt(age[0]);   //解析年龄
					int age2=Integer.parseInt(age[1]);
					if(age1>age2){
						sql=sql+" and Age>="+age2+" and Age<="+age1;
					}else if(age1==age2){
						sql=sql+" and Age="+age1;
					}else{
						sql=sql+" and Age>="+age1+" and Age<="+age2;
					}
				}else {
					sql=sql+" and Age="+age[1];
				}
			}
			if(work.getTel()!=null&&!work.getTel().trim().equals("")){
				sql=sql+" and Tel like '%"+work.getTel()+"%'";
			}
		   return wd.queryWorker(sql,page);
		}catch(Exception e){
			throw new Exception("查询员工失败，原因是："+e.getMessage());
		}
	}
	
	public int getWorkerTypeCount() throws Exception{
		
		 try{
			   return wd.getWorkerTypeCount();
		   }catch(Exception e){
			   throw new Exception("查询职位数量失败，原因是："+e.getMessage());
		   }
	}
	
	public List<WorkerType> queryWorkerType(PageBean page) throws Exception{
		try{
			return wd.queryWorkerType(page);
		}catch(Exception e){
			throw new Exception("查询职位失败，原因是："+e.getMessage());
		}
	}
	
	public List<WorkerType> queryallworktype() throws Exception{
		try{
			return wd.queryallworktype();
		}catch(Exception e){
			throw new Exception("查询所有职位失败，原因是："+e.getMessage());
		}
	}
	
	public int addworkertype(WorkerType wt) throws Exception{
		try{
			   int i= wd.addworkertype(wt);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("添加职位失败");
			   }
			}catch(Exception e){
				throw new Exception("添加职位失败，原因是："+e.getMessage());
			}
	}
	
	public WorkerType queryworkertype(String id) throws Exception{
		try{
			return wd.queryworkertype(id);
		}catch(Exception e){
			throw new Exception("查询职位失败，原因是："+e.getMessage());
		}
	}
	
	public int updateworkertype(WorkerType wt) throws Exception{
		try{
		   int i= wd.updateworkertype(wt);
		   if(i>0){
			   return i;
		   }else{
			   throw new Exception("更新职位失败");
		   }
		}catch(Exception e){
			throw new Exception("更新职位失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteworkertype(String id) throws Exception{
		try{
			int i= wd.deleteworkertype(id);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("删除职位失败");
			   }
		}catch(Exception e){
			throw new Exception("删除职位失败，原因是："+e.getMessage());
		}
	}
	
	public List<Worker> queryAllWorker() throws Exception{
		try{
			return wd.queryAllWorker();
		}catch(Exception e){
			throw new Exception("查询员工失败，原因是："+e.getMessage());
		}
	}
	
	public int addWorker(Worker work) throws Exception{
		   try{
			   int i= wd.addWorker(work);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("添加员工失败");
			   }
		   }catch(Exception e){
			   throw new Exception("添加员工失败，原因是："+e.getMessage());
		   }
	}
	
	public int deleteWorker(String id) throws Exception{
		try{
		int i= wd.deleteWorker(id);
		   if(i>0){
			   return i;
		   }else{
			   throw new Exception("删除员工失败");
		   }
		}catch(Exception e){
			throw new Exception("删除员工失败，原因是："+e.getMessage());
		}
	}
	
	public List<Worker> queryWorker(String workerid) throws Exception{
		try{
			return wd.queryWorker(workerid);
		}catch(Exception e){
			throw new Exception("查询员工信息失败，原因是："+e.getMessage());
		}
	}
	
	public int updateWorker(Worker worker) throws Exception{
		 try{
			   int i= wd.updateWorker(worker);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("更新员工信息失败");
			   }
		   }catch(Exception e){
			   throw new Exception("更新员工信息失败，原因是："+e.getMessage());
		   }
	}
	
	public int changestatus(String status,String id) throws Exception{
		try{
			 int i= wd.changestatus(status,id);
			   if(i>0){
				   return i;
			   }else{
				   throw new Exception("更新员工状态失败");
			   }
		}catch(Exception e){
			 throw new Exception("更新员工状态失败，原因是："+e.getMessage());
		}
	}
	
	public Long countworker(int i) throws Exception{
		try{
			return wd.countworker(i);
		}catch(Exception e){
			 throw new Exception("查询职位人数失败，原因是："+e.getMessage());
		}
	}
	
	public int updateworkertype(int id) throws Exception{
		try{
			 int i= wd.updateworkertype(id);
			   
			 return i;
			 
		}catch(Exception e){
			 throw new Exception("更新员工状态失败，原因是："+e.getMessage());
		}
	}
	
	public int updateselfmessage(Worker worker) throws Exception{
		try{
			 int i= wd.updateselfmessage(worker);
			   
			 return i;
			 
		}catch(Exception e){
			 throw new Exception("更新员工状态失败，原因是："+e.getMessage());
		}
	}
	
	public int updateworkerpicture(String picaddress,String id) throws Exception{
		try{
			return wd.updateworkerpicture(picaddress, id);
		}catch(Exception e){
			throw new Exception("更新员工照片失败，原因是："+e.getMessage());
		}
	}
		
}
