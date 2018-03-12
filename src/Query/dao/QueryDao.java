package Query.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.model.JobQuery;

public class QueryDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<GoodsQuery> queryallgoodsquery(){
		String sql="select * from goodsquery";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		System.out.println(lmap);
		List<GoodsQuery> lgq=new ArrayList<GoodsQuery>();
		
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				GoodsQuery gq=new GoodsQuery();
				gq.setClient((int)lmap.get(i).get("ClientId"));
				gq.setGoodsTypeId((int)lmap.get(i).get("GoodsTypeId"));
				gq.setQueryId((int)lmap.get(i).get("QueryId"));
				gq.setQueryNum((int)lmap.get(i).get("QueryNum"));
				lgq.add(gq);
			}
			System.out.println(lgq);
			return lgq;
		}else{
			return null;
		}
	}
	
	public int addgoodsquery(GoodsQuery gq){
		String sql="insert into goodsquery(GoodsTypeId,ClientId,QueryNum) values(?,?,1)";
		int i=DBUtil.executeUpdate(sql, new Object[]{gq.getGoodsTypeId(),gq.getClient()});
		return i;
	}
	
	public List<GoodsQuery> querygoodsquery(String id){
		String sql="select * from goodsquery where ClientId=? order by QueryNum desc limit 0,4";
		List<Map<String,Object>> lmap =DBUtil.list(sql,Integer.parseInt(id));
		List<GoodsQuery> lgq=new ArrayList<GoodsQuery>();
		
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				GoodsQuery gq=new GoodsQuery();
				gq.setClient((int)lmap.get(i).get("ClientId"));
				gq.setGoodsTypeId((int)lmap.get(i).get("GoodsTypeId"));
				gq.setQueryId((int)lmap.get(i).get("QueryId"));
				gq.setQueryNum((int)lmap.get(i).get("QueryNum"));
				lgq.add(gq);
			}
			System.out.println(lgq);
			return lgq;
		}else{
			return null;
		}
	}
	
	public int getgoodsquerynum(int clientid,String typeid){
		String sql="select * from goodsquery where ClientId=? and GoodsTypeId=?";
		Map<String,Object> map=DBUtil.query(sql,new Object[]{clientid,typeid});
		return map.get("QueryNum")!=null?(int)map.get("QueryNum"):0;	
	}
	
	public int updategoodsquerynum(int num,String typeid,int id){
		String sql="update goodsquery set QueryNum=? where GoodsTypeId=? and ClientId=?";
		int i=DBUtil.executeUpdate(sql, new Object[]{num,typeid,id});
		return i;		
	}
	
	public List<GoodsLateQuery> queryallgoodslatequery(){
		String sql="select * from goodslatequery";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		System.out.println(lmap);
		List<GoodsLateQuery> lglq=new ArrayList<GoodsLateQuery>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				GoodsLateQuery glq=new GoodsLateQuery();
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				lglq.add(glq);
			}
			
			return lglq;
		}else{
			return null;
		}
	}
	
	public GoodsLateQuery querygoodslatequery(String id){
		String sql="select * from goodslatequery where ClientId=? order by AddTime limit 0,1";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			GoodsLateQuery glq=new GoodsLateQuery();
			for(int i=0;i<lmap.size();i++){
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
			}
			return glq;
		}else{
			return null;
		}		
	}
	
	public GoodsLateQuery querygoodslastquery(String id){
		String sql="select * from goodslatequery where ClientId=? order by AddTime desc limit 0,1";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			GoodsLateQuery glq=new GoodsLateQuery();
			for(int i=0;i<lmap.size();i++){
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
			}
			return glq;
		}else{
			return null;
		}		
	}
	
	public List<GoodsLateQuery> querygoodslatequery(int id){
		String sql="select * from goodslatequery where ClientId=?";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		List<GoodsLateQuery> lglq=new ArrayList<GoodsLateQuery>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				GoodsLateQuery glq=new GoodsLateQuery();
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				lglq.add(glq);
			}
			
			return lglq;
		}else{
			return null;
		}
	}
	
	public int getgoodslatequerynum(String id){
		String sql="select count(*) as num from goodslatequery where ClientId=?";
		Map<String,Object> map =DBUtil.query(sql,id);
		return Integer.parseInt(String.valueOf((long)map.get("num")));
	}
	
	public int updategoodslatequery(GoodsLateQuery glq){
		String sql="update goodslatequery set QueryString=?,ClientId=?,AddTime=? where QueryId=?";
		int i=DBUtil.executeUpdate(sql, new Object[]{glq.getQueryString(),glq.getClientId(),glq.getAddTime(),glq.getQueryId()});
		return i;
	}
	
	public int addgoodslatequery(GoodsLateQuery glq){
		String sql="insert into goodslatequery(ClientId,QueryString,AddTime) values(?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{glq.getClientId(),glq.getQueryString(),glq.getAddTime()});
		return i;
	}
	
	public List<JobQuery> queryalljobquery(){
		String sql="select * from jobquery";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		System.out.println(lmap);
		List<JobQuery> lglq=new ArrayList<JobQuery>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				JobQuery glq=new JobQuery();
				System.out.println("执行到此");
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
			
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				lglq.add(glq);
			}
		
			return lglq;
		}else{
			return null;
		}
	}
	
	public JobQuery queryjobquery(String id){
		String sql="select * from jobquery where ClientId=? order by AddTime limit 0,1";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			JobQuery glq=new JobQuery();
			for(int i=0;i<lmap.size();i++){
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime((String)lmap.get(i).get("AddTime"));
			}
			return glq;
		}else{
			return null;
		}		
	}
	
	public JobQuery queryjobquery(int id){
		String sql="select * from jobquery where QueryId=?";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			JobQuery glq=new JobQuery();
			for(int i=0;i<lmap.size();i++){
				glq.setClientId((int)lmap.get(i).get("ClientId"));
				glq.setQueryString((String)lmap.get(i).get("QueryString"));
				glq.setQueryId((int)lmap.get(i).get("QueryId"));
				glq.setAddTime((String)lmap.get(i).get("AddTime"));
			}
			return glq;
		}else{
			return null;
		}		
	}
	
	public int getjobquerynum(String id){
		String sql="select count(*) as num from jobquery where ClientId=?";
		Map<String,Object> map =DBUtil.query(sql,id);
		return Integer.parseInt(String.valueOf((long)map.get("num")));
	}
	
	public int updatejobquery(JobQuery glq){
		String sql="update jobquery set QueryString=?,ClientId=?,AddTime=? where QueryId=?";
		int i=DBUtil.executeUpdate(sql, new Object[]{glq.getQueryString(),glq.getClientId(),glq.getAddTime(),glq.getQueryId()});
		return i;
	}
	
	public int addjobquery(JobQuery glq){
		String sql="insert into jobquery(ClientId,QueryString,AddTime) values(?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{glq.getClientId(),glq.getQueryString(),glq.getAddTime()});
		return i;
	}

}
