package Operation.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Operation.model.ManagerOperation;
import Page.model.PageBean;

public class OperationDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public int addmanageroperation(ManagerOperation mOperation){
		String sql="insert into manageroperation(OperationType,ManagerId,OperatList,OperationTime,OperationDay,Discripe) values(?,?,?,?,?,?)";
		int i = DBUtil.executeUpdate(sql,new Object[]{mOperation.getOperationType(),mOperation.getManagerId(),mOperation.getOperatList(),mOperation.getOperationTime(),mOperation.getOperationDay(),mOperation.getDiscripe()});
		return i;
	}
	
	public int deletemanageroperation(String ManagerId){
		String sql="delete from manageroperation where ManagerId=?";
		int i=DBUtil.executeUpdate(sql, ManagerId);
		return i;
	}
	
	public List<ManagerOperation> queryallmanageroperation(){
		String sql="select * from manageroperation";
		List<Map<String,Object>> lm=DBUtil.list(sql);
		List<ManagerOperation> lmo=new ArrayList<ManagerOperation>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				ManagerOperation mo=new ManagerOperation();
				mo.setOperationType((String)lm.get(i).get("OperationType"));
				mo.setDiscripe((String)lm.get(i).get("Discripe"));
				mo.setManagerId((int)lm.get(i).get("ManagerId"));
				mo.setOperationId((int)lm.get(i).get("OperationId"));
				mo.setOperationDay(sf.format((Date)lm.get(i).get("OperationDay")));
				mo.setOperationTime(sd.format((Date)lm.get(i).get("OperationTime")));
				mo.setOperatList((String)lm.get(i).get("OperatList"));
				lmo.add(mo);
			}
			return lmo;
		}else{
			return null;
		}
	}
	
	public List<ManagerOperation> querymanageroperation(String sql,PageBean page){
		String sql1=sql+" order by OperationId desc limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql1);
		List<Map<String,Object>> lm=DBUtil.list(sql1);
		List<ManagerOperation> lmo=new ArrayList<ManagerOperation>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				ManagerOperation mo=new ManagerOperation();
				mo.setOperationType((String)lm.get(i).get("OperationType"));
				mo.setDiscripe((String)lm.get(i).get("Discripe"));
				mo.setManagerId((int)lm.get(i).get("ManagerId"));
				mo.setOperationId((int)lm.get(i).get("OperationId"));
				mo.setOperationDay(sf.format((Date)lm.get(i).get("OperationDay")));
				mo.setOperationTime(sd.format((Date)lm.get(i).get("OperationTime")));
				mo.setOperatList((String)lm.get(i).get("OperatList"));
				lmo.add(mo);
			}
			return lmo;
		}else{
			return null;
		}
	}
	
	public int getManagerOperationCount(String sql){
		Map<String,Object> map=DBUtil.query(sql);
		return Integer.parseInt(String.valueOf((long)map.get("num")));
	}
	
	public List<ManagerOperation> querydenglu(int managerid){
		String sql="select * from manageroperation where ManagerId=? and OperationType='登录' order by OperationId desc limit 0,5";
		List<Map<String,Object>> lm= DBUtil.list(sql,managerid);
		List<ManagerOperation> lmo=new ArrayList<ManagerOperation>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				ManagerOperation mo=new ManagerOperation();
				mo.setOperationType((String)lm.get(i).get("OperationType"));
				mo.setDiscripe((String)lm.get(i).get("Discripe"));
				mo.setManagerId((int)lm.get(i).get("ManagerId"));
				mo.setOperationId((int)lm.get(i).get("OperationId"));
				mo.setOperationDay(sf.format((Date)lm.get(i).get("OperationDay")));
				mo.setOperationTime(sd.format((Date)lm.get(i).get("OperationTime")));
				mo.setOperatList((String)lm.get(i).get("OperatList"));
				lmo.add(mo);
			}
			return lmo;
		}else{
			return null;
		}
	}
	
	

}
