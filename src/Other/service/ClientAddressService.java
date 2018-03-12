package Other.service;

import java.util.List;

import Other.dao.ClientAddressDao;
import Other.model.City;
import Other.model.Province;
import Other.model.School;

public class ClientAddressService {
	
	ClientAddressDao cad=new ClientAddressDao();
	
	public List<Province> queryallprovince() throws Exception{
		try{
			return cad.queryallprovince();
		}catch(Exception e){
			throw new Exception("获取省份失败，原因是："+e.getMessage());
		}
	}
	
	public List<City> queryallcity(String id) throws Exception{
		try{
			return cad.queryallcity(id);
		}catch(Exception e){
			throw new Exception("获取城市失败，原因是："+e.getMessage());
		}
	}
	
	public List<School> queryallschool(String id) throws Exception{
		try{
			return cad.queryallschool(id);
		}catch(Exception e){
			throw new Exception("获取学校失败，原因是："+e.getMessage());
		}
	}
	
	public String queryprovincename(String id) throws Exception{
		try{
			return cad.queryprovincename(id);
		}catch(Exception e){
			throw new Exception("获取省份失败，原因是："+e.getMessage());
		}
	}
	
	public String querycityname(String id) throws Exception{
		try{
			return cad.querycitylname(id);
		}catch(Exception e){
			throw new Exception("获取学校失败，原因是："+e.getMessage());
		}
	}
	
	public String queryschoolname(String id) throws Exception{
		try{
			return cad.queryschoolname(id);
		}catch(Exception e){
			throw new Exception("获取城市失败，原因是："+e.getMessage());
		}
	}
}
