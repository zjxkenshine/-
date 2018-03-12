package Goods.service;

import java.util.List;

import Goods.dao.GoodsDao;
import Goods.model.Goods;
import Goods.model.GoodsType;

public class GoodsService {
	
	GoodsDao dd=new GoodsDao();
	
	public List<Goods> queryallgoods() throws Exception{
		try{
			return dd.queryallgoods();
		}catch(Exception e){
			throw new Exception("查询商品失败，原因是："+e.getMessage());
		}
	}
	
	public int deletegoods(String id) throws Exception{
		try{
			return dd.deletegoods(id);
		}catch(Exception e){
			throw new Exception("删除商品失败，原因是："+e.getMessage());
		}
	}
	
	public int updategoods(Goods go) throws Exception{
		try{
			return dd.updategoods(go);
		}catch(Exception e){
			throw new Exception("修改商品失败，原因是："+e.getMessage());
		}
	}
	
	public int updatesellstatus(String status,String id) throws Exception{
		try{
			return dd.updatesellstatus(status, id);
		}catch(Exception e){
			throw new Exception("修改商品状态失败，原因是："+e.getMessage());
		}
	}
	
	public int updatestatus(String status,String id) throws Exception{
		try{
			return dd.updatestatus(status, id);
		}catch(Exception e){
			throw new Exception("修改商品失败，原因是："+e.getMessage());
		}
	}
	
	public int addgoods(Goods goods) throws Exception{
		try{
			return dd.addgoods(goods);
		}catch(Exception e){
			throw new Exception("添加商品失败，原因是："+e.getMessage());
		}
	}
	
	public List<GoodsType> queryalltype() throws Exception{
		try{
			return dd.queryalltype();
		}catch(Exception e){
			throw new Exception("查询所有分类失败，原因是："+e.getMessage());
		}
	}
	
	public Goods querygoods(String id) throws Exception{
		try{
			return dd.querygoods(id);
		}catch(Exception e){
			throw new Exception("查询商品失败，原因是："+e.getMessage());
		}
	}
	
	public List<Goods> querygoodsbytype(String type) throws Exception{
		try{
			return dd.querygoodsbytype(type);
		}catch(Exception e){
			throw new Exception("查询商品失败，原因是："+e.getMessage());
		}
	}
	
	public List<Goods> querygoodsbystring(String querystring) throws Exception{
		try{
			return dd.querygoodsbystring(querystring);
		}catch(Exception e){
			throw new Exception("查询商品失败，原因是："+e.getMessage());
		}
	}
	
	public List<Goods> querygoodsbyclientid(int id) throws Exception{
		try{
			return dd.querygoodsbyclientid(id);
		}catch(Exception e){
			throw new Exception("查询商品失败，原因是："+e.getMessage());
		}
	}
	
	public List<Goods> queryallgoods1() throws Exception{
		try{
			return dd.queryallgoods1();
		}catch(Exception e){
			throw new Exception("查询商品失败，原因是："+e.getMessage());
		}
	}

}
