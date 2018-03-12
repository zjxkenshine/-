package Query.service;

import java.util.List;

import Query.dao.QueryDao;
import Query.model.GoodsLateQuery;
import Query.model.GoodsQuery;
import Query.model.JobQuery;

public class QueryService {
	
	QueryDao qd=new QueryDao();
	
	public List<GoodsQuery> queryallgoodsquery() throws Exception{
		try{
			return qd.queryallgoodsquery();
		}catch(Exception e){
			throw new Exception("查询商品搜索失败，原因是："+e.getMessage());
		}
	}
	
	public int addgoodsquery(GoodsQuery gq) throws Exception{
		try{
			return qd.addgoodsquery(gq);
		}catch(Exception e){
			throw new Exception("添加商品搜索失败，原因是："+e.getMessage());
		}
	}
	
	public List<GoodsQuery> querygoodsquery(String id) throws Exception{
		try{
			return qd.querygoodsquery(id);
		}catch(Exception e){
			throw new Exception("查询商品搜索失败，原因是："+e.getMessage());
		}
	}
	public int getgoodsquerynum(int clientid,String typeid) throws Exception{
		try{
			return qd.getgoodsquerynum(clientid,typeid);
		}catch(Exception e){
			throw new Exception("查询商品搜索次数失败，原因是："+e.getMessage());
		}
	}
	
	public int updategoodsquerynum(int num,String typeid,int id) throws Exception{
		try{
			return qd.updategoodsquerynum(num,typeid,id);
		}catch(Exception e){
			throw new Exception("查询商品搜索数量失败，原因是："+e.getMessage());
		}
	}
	
	public List<GoodsLateQuery> queryallgoodslatequery() throws Exception{
		try{
			return qd.queryallgoodslatequery();
		}catch(Exception e){
			throw new Exception("查询商品最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public GoodsLateQuery querygoodslatequery(String id) throws Exception{      //搜索最早的那次搜索
		try{
			return qd.querygoodslatequery(id);
		}catch(Exception e){
			throw new Exception("查询商品最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public List<GoodsLateQuery> querygoodslatequery(int id) throws Exception{    //按QueryId搜索
		try{
			return qd.querygoodslatequery(id);
		}catch(Exception e){
			throw new Exception("查询商品最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public int getgoodslatequerynum(String id) throws Exception{           //最多三条
		try{
			return qd.getgoodslatequerynum(id);
		}catch(Exception e){
			throw new Exception("查询商品最近搜索总数失败，原因是："+e.getMessage());
		}
	}
	
	public int updategoodslatequery(GoodsLateQuery glq) throws Exception{
		try{
			return qd.updategoodslatequery(glq);
		}catch(Exception e){
			throw new Exception("更新最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public int addgoodslatequery(GoodsLateQuery glq) throws Exception{
		try{
			return qd.addgoodslatequery(glq);
		}catch(Exception e){
			throw new Exception("添加最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public List<JobQuery> queryalljobquery() throws Exception{
		try{
			return qd.queryalljobquery();
		}catch(Exception e){
			throw new Exception("查询兼职最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public JobQuery queryjobquery(String id) throws Exception{      //搜索最早的那次搜索
		try{
			return qd.queryjobquery(id);
		}catch(Exception e){
			throw new Exception("查询兼职最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public JobQuery querygoodslatequeryjobquery(int id) throws Exception{    //按QueryId搜索
		try{
			return qd.queryjobquery(id);
		}catch(Exception e){
			throw new Exception("查询兼职最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public int getjobquerynum(String id) throws Exception{           //最多三条
		try{
			return qd.getjobquerynum(id);
		}catch(Exception e){
			throw new Exception("查询兼职最近搜索总数失败，原因是："+e.getMessage());
		}
	}
	
	public int updatejobquery(JobQuery glq) throws Exception{
		try{
			return qd.updatejobquery(glq);
		}catch(Exception e){
			throw new Exception("更新兼职最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public int addjobquery(JobQuery glq) throws Exception{
		try{
			return qd.addjobquery(glq);
		}catch(Exception e){
			throw new Exception("添加兼职最近搜索失败，原因是："+e.getMessage());
		}
	}
	
	public GoodsLateQuery querygoodslastquery(String id) throws Exception{
		try{
			return qd.querygoodslastquery(id);
		}catch(Exception e){
			throw new Exception("获取最近搜索失败，原因是："+e.getMessage());
		}
	}

}
