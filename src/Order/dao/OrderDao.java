package Order.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Order.model.Order;
import Order.model.OrderStatus;

public class OrderDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Order> queryallorder(){
		String sql = "select * from ordered";
		List<Map<String,Object>> lmap = DBUtil.list(sql);
		List<Order> lo=new ArrayList<Order>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Order ord=new Order();
				ord.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				ord.setBuyClientId((int)lmap.get(i).get("BuyClientId"));
				ord.setExpressCode((String)lmap.get(i).get("ExpressCode"));
				if(lmap.get(i).get("FinishTime")!=null){
					ord.setFinishTime(sd.format((Date)lmap.get(i).get("FinishTime")));
				}
				ord.setDiscripe((String)lmap.get(i).get("Discripe"));
				ord.setGoodsId((int)lmap.get(i).get("GoodsId"));
				ord.setSaleClientId((int)lmap.get(i).get("SaleClientId"));
				ord.setStatus((String)lmap.get(i).get("Status"));
				ord.setGoodsName((String)lmap.get(i).get("GoodsName"));
				ord.setOrderId((int)lmap.get(i).get("OrderId"));
				lo.add(ord);
			}
			return lo;
		}else{
			return null;
		}
	}
	
	
	public List<Order> queryorderbybuyclient(int id){
		String sql = "select * from ordered where BuyClientId=?";
		List<Map<String,Object>> lmap = DBUtil.list(sql,id);
		List<Order> lo=new ArrayList<Order>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Order ord=new Order();
				ord.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				ord.setBuyClientId((int)lmap.get(i).get("BuyClientId"));
				ord.setExpressCode((String)lmap.get(i).get("ExpressCode"));
				if(lmap.get(i).get("FinishTime")!=null){
					ord.setFinishTime(sd.format((Date)lmap.get(i).get("FinishTime")));
				}
				ord.setDiscripe((String)lmap.get(i).get("Discripe"));
				ord.setGoodsId((int)lmap.get(i).get("GoodsId"));
				ord.setSaleClientId((int)lmap.get(i).get("SaleClientId"));
				ord.setStatus((String)lmap.get(i).get("Status"));
				ord.setGoodsName((String)lmap.get(i).get("GoodsName"));
				ord.setOrderId((int)lmap.get(i).get("OrderId"));
				lo.add(ord);
			}
			return lo;
		}else{
			return null;
		}
	}
	
	public List<Order> queryorderbysaleclient(int id){
		String sql = "select * from ordered where SaleClientId=?";
		List<Map<String,Object>> lmap = DBUtil.list(sql,id);
		List<Order> lo=new ArrayList<Order>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Order ord=new Order();
				ord.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				ord.setBuyClientId((int)lmap.get(i).get("BuyClientId"));
				ord.setExpressCode((String)lmap.get(i).get("ExpressCode"));
				if(lmap.get(i).get("FinishTime")!=null){
					ord.setFinishTime(sd.format((Date)lmap.get(i).get("FinishTime")));
				}
				ord.setDiscripe((String)lmap.get(i).get("Discripe"));
				ord.setGoodsId((int)lmap.get(i).get("GoodsId"));
				ord.setSaleClientId((int)lmap.get(i).get("SaleClientId"));
				ord.setStatus((String)lmap.get(i).get("Status"));
				ord.setGoodsName((String)lmap.get(i).get("GoodsName"));
				ord.setOrderId((int)lmap.get(i).get("OrderId"));
				lo.add(ord);
			}
			return lo;
		}else{
			return null;
		}
	}
	
	public Order queryorderbyorderid(String id){
		String sql = "select * from ordered where OrderId=?";
		List<Map<String,Object>> lmap = DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			Order ord=new Order();
			for(int i=0;i<lmap.size();i++){
				
				ord.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				ord.setBuyClientId((int)lmap.get(i).get("BuyClientId"));
				ord.setExpressCode((String)lmap.get(i).get("ExpressCode"));
				if(lmap.get(i).get("FinishTime")!=null){
					ord.setFinishTime(sd.format((Date)lmap.get(i).get("FinishTime")));
				}
				ord.setDiscripe((String)lmap.get(i).get("Discripe"));
				ord.setGoodsId((int)lmap.get(i).get("GoodsId"));
				ord.setSaleClientId((int)lmap.get(i).get("SaleClientId"));
				ord.setStatus((String)lmap.get(i).get("Status"));
				ord.setGoodsName((String)lmap.get(i).get("GoodsName"));
				ord.setOrderId((int)lmap.get(i).get("OrderId"));
			
			}
			return ord;
		}else{
			return null;
		}
	}
	
	public Order queryorderbygoodsid(String id){
		String sql = "select * from ordered where GoodsId=?";
		List<Map<String,Object>> lmap = DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			Order ord=new Order();
			for(int i=0;i<lmap.size();i++){
				
				ord.setAddTime(sd.format((Date)lmap.get(i).get("AddTime")));
				ord.setBuyClientId((int)lmap.get(i).get("BuyClientId"));
				ord.setExpressCode((String)lmap.get(i).get("ExpressCode"));
				if(lmap.get(i).get("FinishTime")!=null){
					ord.setFinishTime(sd.format((Date)lmap.get(i).get("FinishTime")));
				}
				ord.setDiscripe((String)lmap.get(i).get("Discripe"));
				ord.setGoodsId((int)lmap.get(i).get("GoodsId"));
				ord.setSaleClientId((int)lmap.get(i).get("SaleClientId"));
				ord.setStatus((String)lmap.get(i).get("Status"));
				ord.setGoodsName((String)lmap.get(i).get("GoodsName"));
				ord.setOrderId((int)lmap.get(i).get("OrderId"));
			
			}
			return ord;
		}else{
			return null;
		}
	}
	
	public int updateorderstatus(String status,String id){
		String sql="update ordered set Status=? where OrderId=?";
		int i=DBUtil.executeUpdate(sql, new Object[]{status,id});
		return i;
	}
	
	public int addorder(Order ord){
		String sql="insert into ordered(OrderId,GoodsId,GoodsName,SaleClientId,BuyClientId,ExpressCode,AddTime,Discripe) values(?,?,?,?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{ord.getOrderId(),ord.getGoodsId(),ord.getGoodsName(),ord.getSaleClientId(),ord.getBuyClientId(),ord.getExpressCode(),ord.getAddTime(),ord.getDiscripe()});
		return i;
	}
	
	public int updatefinishtime(String finishtime,String id){
		String sql="update ordered set FinishTime=? where OrderId=?";
		int i=DBUtil.executeUpdate(sql, new Object[]{finishtime,id});
		return i;
	}
	
	public int deleteorder(String id){
		String sql="delete from ordered where OrderId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public List<OrderStatus> queryallstatus(){
		String sql="select * from orderstatus";
		List<Map<String,Object>> lmap = DBUtil.list(sql);
		List<OrderStatus> los=new ArrayList<OrderStatus>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				OrderStatus os=new OrderStatus();
				os.setOrderStatusId((int)lmap.get(i).get("OrderStatusId"));
				os.setOrderStatusName((String)lmap.get(i).get("OrderStatusName"));
				los.add(os);
			}
			return los;
		}else{
			return null;
		}
	}

}
