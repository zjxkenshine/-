package Order.service;

import java.util.List;

import Order.dao.OrderDao;
import Order.model.Order;
import Order.model.OrderStatus;

public class OrderService {
	
	OrderDao od=new OrderDao();
	
	public List<Order> queryallorder() throws Exception{
		try{
			return od.queryallorder();
		}catch(Exception e){
			throw new Exception("查询所有订单失败，原因是："+e.getMessage());
		}
	}
	
	public Order queryorderbyorderid(String id) throws Exception{
		try{
			return od.queryorderbyorderid(id);
		}catch(Exception e){
			throw new Exception("查询订单失败，原因是："+e.getMessage());
		}
	}
	
	public int updateorderstatus(String status,String id) throws Exception{
		try{
			return od.updateorderstatus(status,id);
		}catch(Exception e){
			throw new Exception("更新订单状态失败，原因是："+e.getMessage());
		}
	}
	
	public int addorder(Order ord) throws Exception{
		try{
			return od.addorder(ord);
		}catch(Exception e){
			throw new Exception("添加订单失败，原因是："+e.getMessage());
		}
	}
	
	public int updatefinishtime(String finishtime,String id) throws Exception{
		try{
			return od.updatefinishtime(finishtime,id);
		}catch(Exception e){
			throw new Exception("更新完成时间失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteorder(String id) throws Exception{
		try{
			return od.deleteorder(id);
		}catch(Exception e){
			throw new Exception("删除订单失败，原因是："+e.getMessage());
		}
	}
	
	public Order queryorderbygoodsid(String id) throws Exception{
		try{
			return od.queryorderbygoodsid(id);
		}catch(Exception e){
			throw new Exception("查询订单失败，原因是："+e.getMessage());
		}
	}
	public List<OrderStatus> queryallstatus() throws Exception{
		try{
			return od.queryallstatus();
		}catch(Exception e){
			throw new Exception("查询订单状态列表失败，原因是："+e.getMessage());
		}
	}
	
	public List<Order> queryorderbybuyclient(int i) throws Exception{
		try{
			return od.queryorderbybuyclient(i);
		}catch(Exception e){
			throw new Exception("查询订单列表失败，原因是："+e.getMessage());
		}
	}
	
	public List<Order> queryorderbysaleclient(int id) throws Exception{
		try{
			return od.queryorderbysaleclient(id);
		}catch(Exception e){
			throw new Exception("查询订单列表失败，原因是："+e.getMessage());
		}
	}

}
