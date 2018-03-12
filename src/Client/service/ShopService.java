package Client.service;

import java.util.List;

import Client.dao.ShopDao;
import Client.model.Shop;

public class ShopService {
	
	ShopDao sd=new ShopDao();
	
	public List<Shop> queryallshop() throws Exception{
		try{
			return sd.queryallshop();
		}catch(Exception e){
			throw new Exception("查询购物车失败，原因是："+e.getMessage());
		}
	}
	
	public int addshop(Shop sh) throws Exception{
		try{
			return sd.addshop(sh);
		}catch(Exception e){
			throw new Exception("添加购物车失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteshop(String id) throws Exception{
		try{
			return sd.deleteshop(id);
		}catch(Exception e){
			throw new Exception("删除购物车失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteshopbyclientid(int clientid) throws Exception{
		try{
			return sd.deleteshopbyclientid(clientid);
		}catch(Exception e){
			throw new Exception("删除购物车失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteshopbygoodsid(int goodsid) throws Exception{
		try{
			return sd.deleteshopbygoodsid(goodsid);
		}catch(Exception e){
			throw new Exception("删除购物车失败，原因是："+e.getMessage());
		}
	}

}
