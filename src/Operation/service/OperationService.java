package Operation.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Operation.dao.OperationDao;
import Operation.model.ManagerOperation;
import Page.model.PageBean;

public class OperationService {
	
	OperationDao od=new OperationDao();
	
	public int addmanageroperation(ManagerOperation mOperation) throws Exception{
		try{
			int i=od.addmanageroperation(mOperation);
			if(i>0){
				return i;
			}else {
				throw new Exception("添加日志失败");
			}
		}catch(Exception e){
			throw new Exception("添加日志失败，原因是："+e.getMessage());
		}
	}
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	public int getManagerOperationCount(ManagerOperation mo) throws Exception{
		try{
			String sql="select count(*) as num from manageroperation where 1=1";
			
			if(mo.getManagerId()!=0){
				sql=sql+" and ManagerId="+mo.getManagerId();
			}
			
			if(mo.getOperationType()!=null&&!mo.getOperationType().equals("")){
				sql=sql+" and OperationType='"+mo.getOperationType()+"'";
			}
			
			if(mo.getOperatList()!=null&&!mo.getOperatList().equals("")){
				sql=sql+" and OperatList='"+mo.getOperatList()+"'";
			}
			
			if(mo.getOperationTime()!=null&&!mo.getOperationTime().trim().equals("")){
				String addtime[]=mo.getOperationTime().split(",");    //获取添加时间
				System.out.println(mo.getOperationTime());
				if(addtime.length==1){
					Date date=sf.parse(addtime[0]);     //解析时间
					sql=sql+" and OperationDay='"+sf.format(date)+"'";   //格式化时间
				}else if(addtime.length==2&&!addtime[0].equals("")){
					Date date1=sf.parse(addtime[0]);    
					Date date2=sf.parse(addtime[1]);
					if(date1.after(date2)){
						sql=sql+" and OperationTime>='"+sf.format(date2)+"' and OperationTime<='"+sf.format(date1)+"'";
					}else if(date1.equals(date2)) {
						sql=sql+" and OperationDay='"+sf.format(date1)+"'";
					}else {
						sql=sql+" and OperationTime>='"+sf.format(date1)+"' and OperationTime<='"+sf.format(date2)+"'";
					}
				}else{
					Date date=sf.parse(addtime[1]);     //解析时间
					sql=sql+" and OperationDay='"+sf.format(date)+"'";   //格式化时间
				}
			}
			
			return od.getManagerOperationCount(sql);
		 }catch (Exception e){
			   throw new Exception("查询管理员日志总数失败，原因是："+e.getMessage());
		 }
	}
	
	public List<ManagerOperation> querymanageroperation(ManagerOperation mo,PageBean page) throws Exception{
		try{
			String sql="select * from manageroperation where 1=1";
			
			if(mo.getManagerId()!=0){
				sql=sql+" and ManagerId="+mo.getManagerId();
			}
			
			if(mo.getOperationType()!=null&&!mo.getOperationType().equals("")){
				sql=sql+" and OperationType='"+mo.getOperationType()+"'";
			}
			
			if(mo.getOperatList()!=null&&!mo.getOperatList().equals("")){
				sql=sql+" and OperatList='"+mo.getOperatList()+"'";
			}
			
			if(mo.getOperationTime()!=null&&!mo.getOperationTime().trim().equals("")){
				String addtime[]=mo.getOperationTime().split(",");    //获取添加时间
				if(addtime.length==1){
					Date date=sf.parse(addtime[0]);     //解析时间
					sql=sql+" and OperationDay='"+sf.format(date)+"'";   //格式化时间
				}else if(addtime.length==2&&!addtime[0].equals("")){
					Date date1=sf.parse(addtime[0]);    
					Date date2=sf.parse(addtime[1]);
					if(date1.after(date2)){
						sql=sql+" and OperationTime>='"+sf.format(date2)+"' and OperationTime<='"+sf.format(date1)+"'";
					}else if(date1.equals(date2)) {
						sql=sql+" and OperationDay='"+sf.format(date1)+"'";
					}else {
						sql=sql+" and OperationTime>='"+sf.format(date1)+"' and OperationTime<='"+sf.format(date2)+"'";
					}
				}else{
					Date date=sf.parse(addtime[1]);     //解析时间
					sql=sql+" and OperationDay='"+sf.format(date)+"'";   //格式化时间
				}
			}
			
			return od.querymanageroperation(sql, page);
		 }catch (Exception e){
			   throw new Exception("查询管理员日志失败，原因是："+e.getMessage());
		 }
	}
	
	public List<ManagerOperation> queryallmanageroperation() throws Exception{
		try{
			return od.queryallmanageroperation();
		}catch(Exception e){
			throw new Exception("查询所有日志失败，原因是："+e.getMessage());
		}
	}
	
	public List<ManagerOperation> querydenglu(int managerid) throws Exception{
		try{
			return od.querydenglu(managerid);
		}catch(Exception e){
			throw new Exception("查询日志失败，原因是："+e.getMessage());
		}
	}

}
