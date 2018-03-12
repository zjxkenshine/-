package Client.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Client.model.Collect;

public class CollectDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Collect> queryallcollect(){
		String sql="select * from collect";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		List<Collect> lc=new ArrayList<Collect>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Collect col=new Collect();
				col.setClientId((int)lmap.get(i).get("ClientId"));
				col.setCollectId((int)lmap.get(i).get("CollectId"));
				col.setCollectTime(sd.format((Date)lmap.get(i).get("CollectTime")));
				col.setGoodsId((int)lmap.get(i).get("GoodsId"));
				lc.add(col);
			}
			return lc;
		}else{
			return null;
		}
	}
	
	public List<Collect> querycollectbyclientid(int id){
		String sql="select * from collect where ClientId=?";
		List<Map<String,Object>> lmap =DBUtil.list(sql,id);
		List<Collect> lc=new ArrayList<Collect>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Collect col=new Collect();
				col.setClientId((int)lmap.get(i).get("ClientId"));
				col.setCollectId((int)lmap.get(i).get("CollectId"));
				col.setCollectTime(sd.format((Date)lmap.get(i).get("CollectTime")));
				col.setGoodsId((int)lmap.get(i).get("GoodsId"));
				lc.add(col);
			}
			return lc;
		}else{
			return null;
		}
	}
	
	public int addcollect(Collect col){
		String sql="insert into collect(ClientId,GoodsId,CollectTime) values(?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{col.getClientId(),col.getGoodsId(),col.getCollectTime()});
		return i;
	}
	
	public int deletecollect(String id){
		String sql="delete from collect where CollectId=?";
		int i=DBUtil.executeUpdate(sql, id);
		return i;
	}
}
