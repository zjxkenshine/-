package Other.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import util.DBUtil;
import Other.model.Address;

public class AddressDao {
	
	public List<Address> queryalladdress(){
		String sql="select * from address";
		List<Map<String,Object>> lmp=DBUtil.list(sql);
		List<Address> lad=new ArrayList<Address>();
		if(lmp!=null&&lmp.size()>0){
			for(int i=0;i<lmp.size();i++){
				Address ad=new Address();
				ad.setAddressId((int)lmp.get(i).get("AddressId"));
				ad.setAddress((String)lmp.get(i).get("Address"));
				ad.setName((String)lmp.get(i).get("Name"));
				ad.setClientId((int)lmp.get(i).get("ClientId"));
				lad.add(ad);
			}
			return lad;
		}else{
			return null;
		}
	}
	
	public List<Address> queryaddressbyclientid(int id){
		String sql="select * from address where ClientId=?";
		List<Map<String,Object>> lmp=DBUtil.list(sql,id);
		List<Address> lad=new ArrayList<Address>();
		if(lmp!=null&&lmp.size()>0){
			for(int i=0;i<lmp.size();i++){
				Address ad=new Address();
				ad.setAddressId((int)lmp.get(i).get("AddressId"));
				ad.setAddress((String)lmp.get(i).get("Address"));
				ad.setName((String)lmp.get(i).get("Name"));
				ad.setClientId((int)lmp.get(i).get("ClientId"));
				lad.add(ad);
			}
			return lad;
		}else{
			return null;
		}
	}
	
	public Address queryaddress(int id){
		String sql="select * from address where AddressId=?";
		List<Map<String,Object>> lmp=DBUtil.list(sql,id);
		
		if(lmp!=null&&lmp.size()==1){
			Address ad=new Address();
			for(int i=0;i<lmp.size();i++){
				ad.setName((String)lmp.get(i).get("Name"));
				ad.setAddressId((int)lmp.get(i).get("AddressId"));
				ad.setAddress((String)lmp.get(i).get("Address"));
				ad.setClientId((int)lmp.get(i).get("ClientId"));
			}
			return ad;
		}else{
			return null;
		}
	}
	
	public int addaddress(Address add){
		String sql="insert into address(ClientId,Address,Name) values(?,?,?)";
		int i=DBUtil.executeUpdate(sql,new Object[]{add.getClientId(),add.getAddress(),add.getName()});
		return i;
	}
	
	public int updateaddress(Address add){
		String sql="update address set ClientId=?,Address=?,Name=? where AddressId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{add.getClientId(),add.getAddress(),add.getName(),add.getAddressId()});
		return i;
	}
	
	public int deleteaddress(String id){
		String sql="delete from address where addressId=?";
		int i=DBUtil.executeUpdate(sql,id);
		return i;
	}
	
}
