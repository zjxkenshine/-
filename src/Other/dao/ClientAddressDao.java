package Other.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Other.model.City;
import Other.model.Province;
import Other.model.School;

public class ClientAddressDao {
	
	public List<Province> queryallprovince(){
		String sql="select * from province_info";
		List<Map<String,Object>> lmap=DBUtil.list(sql);
		List<Province> lp=new ArrayList<Province>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Province pro=new Province();
				pro.setProId((int)lmap.get(i).get("pr_id"));
				pro.setProName((String)lmap.get(i).get("pr_province"));
				lp.add(pro);
			}
			return lp;
		}else {
			return null;
		}
	}
	
	public List<City> queryallcity(String id){
		String sql="select * from city_info where ci_province=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,id);
		List<City> lc=new ArrayList<City>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				City ci=new City();
				ci.setCityId((int)lmap.get(i).get("ci_id"));
				ci.setCityName((String)lmap.get(i).get("ci_city"));
				lc.add(ci);
			}
			return lc;
		}else {
			return null;
		}
	}
	
	public List<School> queryallschool(String id){
		String sql="select * from shool_info where sh_city=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,id);
		List<School> ls=new ArrayList<School>();
		if(lmap!=null&&lmap.size()>0){
			//System.out.println(lmap);
			for(int i=0;i<lmap.size();i++){
				School sh=new School();
				sh.setSchoolId((int)lmap.get(i).get("sh_id"));
				sh.setSchoolName((String)lmap.get(i).get("sh_shool"));
				ls.add(sh);
			}
			return ls;
		}else {
			return null;
		}
	}
	
	
	public String queryprovincename(String id){
		String sql="select * from province_info where pr_id=?";
		Map<String,Object> map=DBUtil.query(sql,id);
		return (String)map.get("pr_province");
	}
	
	public String queryschoolname(String id){
		String sql="select * from shool_info where sh_id=?";
		Map<String,Object> map=DBUtil.query(sql,id);
		return (String)map.get("sh_shool");
	}
	
	public String querycitylname(String id){
		String sql="select * from city_info where ci_id=?";
		Map<String,Object> map=DBUtil.query(sql,id);
		return (String)map.get("ci_city");
	}

}
