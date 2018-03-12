package Goods.dao;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Goods.model.Goods;
import Goods.model.GoodsType;
import Page.model.PageBean;

public class GoodsDao {

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Goods> queryallgoods1(){
		String sql="select * from goods";
		List<Map<String,Object>> lmap=DBUtil.list(sql);
		List<Goods> lg=new ArrayList<Goods>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Goods goods = new Goods();
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				lg.add(goods);
			}
			return lg;
		}else{
			return null;
		}
	}
	
	public List<Goods> queryallgoods(){                           //在售上架
		String sql="select * from goods where Status=? and SellStatus=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,new Object[]{"1","1"});
		List<Goods> lg=new ArrayList<Goods>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Goods goods = new Goods();
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				lg.add(goods);
			}
			return lg;
		}else{
			return null;
		}
	}
	
	public List<GoodsType> queryalltype(){
		String sql="select * from goodstype";
		List<Map<String,Object>> lmap=DBUtil.list(sql);
		List<GoodsType> lgt = new ArrayList<GoodsType>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				GoodsType goods = new GoodsType();
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				goods.setTypeName((String)lmap.get(i).get("TypeName"));
				lgt.add(goods);
			}
			return lgt;
		}else{
			return null;
		}
	}
	
	public List<Goods> querygoods(String sql,PageBean page){
		String sql1=sql+" limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		List<Map<String,Object>> lmap=DBUtil.list(sql1);
		List<Goods> lg=new ArrayList<Goods>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Goods goods = new Goods();
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				lg.add(goods);
			}
			return lg;
		}else{
			return null;
		}
	}
	
	public List<Goods> querygoodsbystring(String querystring){
		String sql1="select * from goods where GoodsName like '%"+querystring+"%' and Status='1' and SellStatus='1'";
		List<Map<String,Object>> lmap=DBUtil.list(sql1);
		List<Goods> lg=new ArrayList<Goods>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Goods goods = new Goods();
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				lg.add(goods);
			}
			return lg;
		}else{
			return null;
		}
	}
	
	public List<Goods> querygoodsbyclientid(int id){
		String sql1="select * from goods where ClientId=? and Status='1' and SellStatus='1'";
		List<Map<String,Object>> lmap=DBUtil.list(sql1,id);
		List<Goods> lg=new ArrayList<Goods>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Goods goods = new Goods();
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				lg.add(goods);
			}
			return lg;
		}else{
			return null;
		}
	}
	
	public List<Goods> querygoodsbytype(String type){
		String sql1="select * from goods where TypeId=? and Status='1' and SellStatus='1'";
		List<Map<String,Object>> lmap=DBUtil.list(sql1,type);
		List<Goods> lg=new ArrayList<Goods>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Goods goods = new Goods();
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
				lg.add(goods);
			}
			return lg;
		}else{
			return null;
		}
	}
	
	public Goods querygoods(String id){
		String sql="select * from goods where GoodsId=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,id);
	
		if(lmap!=null&&lmap.size()==1){
			Goods goods = new Goods();
			for(int i=0;i<lmap.size();i++){
				
				goods.setAddDay(sf.format((Date)lmap.get(i).get("AddDay")));
				goods.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				goods.setClientId((int)lmap.get(i).get("ClientId"));
				goods.setColletNum((int)lmap.get(i).get("ColletNum"));
				goods.setDiscripe((String)lmap.get(i).get("Discripe"));
				goods.setGoodsId((int)lmap.get(i).get("GoodsId"));
				goods.setGoodsName((String)lmap.get(i).get("GoodsName"));
				goods.setLocation((String)lmap.get(i).get("Location"));
				goods.setNumber((int)lmap.get(i).get("Number"));
				goods.setPicture((String)lmap.get(i).get("Picture"));
				goods.setPrice((String)lmap.get(i).get("Price"));
				goods.setSellStatus((String)lmap.get(i).get("SellStatus"));
				goods.setStatus((String)lmap.get(i).get("Status"));
				goods.setTypeId((int)lmap.get(i).get("TypeId"));
			}
			return goods;
		}else{
			return null;
		}
	}
	
	public int updatestatus(String status,String id){
		String sql="update goods set Status=? where GoodsId=?";
		int i =DBUtil.executeUpdate(sql, new Object[]{status,id});
		return i;
	}
	
	public int updatesellstatus(String status,String id){
		String sql="update goods set SellStatus=? where GoodsId=?";
		int i =DBUtil.executeUpdate(sql, new Object[]{status,id});
		return i;
	}
	
	public int deletegoods(String id){
		String sql="delete from goods where GoodsId=?";
		int i =DBUtil.executeUpdate(sql, new Object[]{id});
		return i;
	}
	
	public int addgoods(Goods go){
		String sql="insert into goods(GoodsName,TypeId,ClientId,Price,AddTime,AddDay,Discripe,Picture,Location) values(?,?,?,?,?,?,?,?,?)";
		int i =DBUtil.executeUpdate(sql, new Object[]{go.getGoodsName(),go.getTypeId(),go.getClientId(),go.getPrice(),go.getAddTime(),go.getAddDay(),go.getDiscripe(),go.getPicture(),go.getLocation()});
		return i;
	}
	
	public int updategoods(Goods go){
		String sql ="update goods set GoodsName=?,TypeId=?,ClientId=?,Price=?,Discripe=?,Picture=?,Location=? where GoodsId=?";
		int i=DBUtil.executeUpdate(sql, new Object[]{go.getGoodsName(),go.getTypeId(),go.getClientId(),go.getPrice(),go.getDiscripe(),go.getPicture(),go.getLocation(),go.getGoodsId()});
		return i;
	}
	

	

}
