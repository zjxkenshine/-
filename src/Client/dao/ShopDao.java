package Client.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Client.model.Collect;
import Client.model.Shop;

public class ShopDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Shop> queryallshop(){
		String sql="select * from shop";
		List<Map<String,Object>> lmap =DBUtil.list(sql);
		List<Shop> lc=new ArrayList<Shop>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Shop sh=new Shop();
				sh.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				sh.setClientId((int)lmap.get(i).get("ClientId"));
				sh.setGoodsId((int)lmap.get(i).get("GoodsId"));
				sh.setShopId((int)lmap.get(i).get("ShopId"));
				lc.add(sh);
			}
			return lc;
		}else{
			return null;
		}
	}
	
	public int addshop(Shop sh){
		String sql="insert into shop(GoodsId,ClientId,AddTime) values(?,?,?)";
		int i=DBUtil.executeUpdate(sql,new Object[]{sh.getGoodsId(),sh.getClientId(),sh.getAddTime()});
		return i;
	}
	
	public int deleteshop(String id){
		String sql="delete from shop where ShopId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public int deleteshopbyclientid(int clientid){
		String sql="delete from shop where ClientId=?";
		int i=DBUtil.executeUpdate(sql,clientid);
		return i;
	}
	
	public int deleteshopbygoodsid(int goodsid){
		String sql="delete from shop where GoodsId=?";
		int i=DBUtil.executeUpdate(sql,goodsid);
		return i;
	}

}
