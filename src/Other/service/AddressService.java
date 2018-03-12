package Other.service;

import java.util.List;

import Other.dao.AddressDao;
import Other.model.Address;

public class AddressService {
	
	AddressDao ad=new AddressDao();
	
	public List<Address> queryalladdress() throws Exception{
		try{
			return ad.queryalladdress();
		}catch(Exception e){
			throw new Exception("查询地址失败，原因是："+e.getMessage());
		}
	}
	
	public List<Address> queryaddressbyclientid(int id) throws Exception{
		try{
			return ad.queryaddressbyclientid(id);
		}catch(Exception e){
			throw new Exception("查询地址失败，原因是："+e.getMessage());
		}
	}
	
	public int addaddress(Address add) throws Exception{
		try{
			return ad.addaddress(add);
		}catch(Exception e){
			throw new Exception("添加地址失败，原因是："+e.getMessage());
		}
	}
	
	public int updateaddress(Address add) throws Exception{
		try{
			return ad.updateaddress(add);
		}catch(Exception e){
			throw new Exception("更新地址失败，原因是："+e.getMessage());
		}
	}
	
	public int deleteaddress(String id) throws Exception{
		try{
			return ad.deleteaddress(id);
		}catch(Exception e){
			throw new Exception("删除地址失败，原因是："+e.getMessage());
		}
	}
	
	public Address queryaddress(int id) throws Exception{
		try{
			return ad.queryaddress(id);
		}catch(Exception e){
			throw new Exception("查询地址失败，原因是："+e.getMessage());
		}
	}

}
