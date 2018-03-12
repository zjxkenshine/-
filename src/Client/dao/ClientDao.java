package Client.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Client.model.Client;
import Page.model.PageBean;

public class ClientDao {
	

	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<Client> queryallclient(){
		String sql="select * from client";
		List<Map<String,Object>> lmap=DBUtil.list(sql);
		List<Client> lc=new ArrayList<Client>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Client cl=new Client();
				cl.setCity((String)lmap.get(i).get("City"));
				cl.setClientCode((String)lmap.get(i).get("ClientCode"));
				cl.setClientId((int)lmap.get(i).get("ClientId"));
				cl.setClientName((String)lmap.get(i).get("ClientName"));
				cl.setE_mail((String)lmap.get(i).get("E_mail"));
				cl.setIdcard((String)lmap.get(i).get("Idcard"));
				cl.setPicture((String)lmap.get(i).get("Picture"));
				cl.setProvince((String)lmap.get(i).get("Province"));
				cl.setRealName((String)lmap.get(i).get("RealName"));
				cl.setRegisterDay(sf.format((Date)lmap.get(i).get("RegisterDate")));
				cl.setRegisterTime(sd.format((Date)lmap.get(i).get("RegisterTime")));
				cl.setSchool((String)lmap.get(i).get("School"));
				cl.setStatus((String)lmap.get(i).get("Status"));
				cl.setTel((String)lmap.get(i).get("Tel"));
				cl.setUserStatus((String)lmap.get(i).get("UseStatus"));
				cl.setTruhCode((int)lmap.get(i).get("TruhCode"));
				cl.setPassWord((String)lmap.get(i).get("Password"));
				lc.add(cl);
			}
			return lc;
		}else{
			return null;
		}
	}
	
	public List<Client> queryclient(){
		String sql="select * from client where UseStatus=1";
		List<Map<String,Object>> lmap=DBUtil.list(sql);
		List<Client> lc=new ArrayList<Client>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Client cl=new Client();
				cl.setCity((String)lmap.get(i).get("City"));
				cl.setClientCode((String)lmap.get(i).get("ClientCode"));
				cl.setClientId((int)lmap.get(i).get("ClientId"));
				cl.setClientName((String)lmap.get(i).get("ClientName"));
				cl.setE_mail((String)lmap.get(i).get("E_mail"));
				cl.setIdcard((String)lmap.get(i).get("Idcard"));
				cl.setPicture((String)lmap.get(i).get("Picture"));
				cl.setProvince((String)lmap.get(i).get("Province"));
				cl.setRealName((String)lmap.get(i).get("RealName"));
				cl.setRegisterDay(sf.format((Date)lmap.get(i).get("RegisterDate")));
				cl.setRegisterTime(sd.format((Date)lmap.get(i).get("RegisterTime")));
				cl.setSchool((String)lmap.get(i).get("School"));
				cl.setStatus((String)lmap.get(i).get("Status"));
				cl.setTel((String)lmap.get(i).get("Tel"));
				cl.setUserStatus((String)lmap.get(i).get("UseStatus"));
				cl.setTruhCode((int)lmap.get(i).get("TruhCode"));
				cl.setPassWord((String)lmap.get(i).get("Password"));
				lc.add(cl);
			}
			return lc;
		}else{
			return null;
		}
	}
	
	public List<Client> queryclient(String sql,PageBean page){
		System.out.println(sql);
		String sql1 =sql+" limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		List<Map<String,Object>> lmap=DBUtil.list(sql1);
	//	System.out.println(lmap);
		List<Client> lc=new ArrayList<Client>();
		if(lmap!=null&&lmap.size()>0){
			for(int i=0;i<lmap.size();i++){
				Client cl=new Client();
				cl.setCity((String)lmap.get(i).get("City"));
				cl.setClientCode((String)lmap.get(i).get("ClientCode"));
				cl.setClientId((int)lmap.get(i).get("ClientId"));
				cl.setClientName((String)lmap.get(i).get("ClientName"));
				cl.setE_mail((String)lmap.get(i).get("E_mail"));
				cl.setIdcard((String)lmap.get(i).get("Idcard"));
				cl.setPicture((String)lmap.get(i).get("Picture"));
				cl.setProvince((String)lmap.get(i).get("Province"));
				cl.setRealName((String)lmap.get(i).get("RealName"));
				cl.setRegisterDay(sf.format((Date)lmap.get(i).get("RegisterDate")));
				cl.setRegisterTime(sd.format((Date)lmap.get(i).get("RegisterTime")));
				cl.setSchool((String)lmap.get(i).get("School"));
				cl.setStatus((String)lmap.get(i).get("Status"));
				cl.setTel((String)lmap.get(i).get("Tel"));
				cl.setUserStatus((String)lmap.get(i).get("UseStatus"));
				cl.setTruhCode((int)lmap.get(i).get("TruhCode"));
				cl.setPassWord((String)lmap.get(i).get("Password"));
				lc.add(cl);
			}
			
			return lc;
		}else{
			return null;
		}
	}
	
	public Client queryClient(String id){
		String sql="select * from client where ClientId=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,id);
		if(lmap!=null&&lmap.size()==1){
			Client cl=new Client();
			for(int i=0;i<lmap.size();i++){
				cl.setCity((String)lmap.get(i).get("City"));
				cl.setClientCode((String)lmap.get(i).get("ClientCode"));
				cl.setClientId((int)lmap.get(i).get("ClientId"));
				cl.setClientName((String)lmap.get(i).get("ClientName"));
				cl.setE_mail((String)lmap.get(i).get("E_mail"));
				cl.setIdcard((String)lmap.get(i).get("Idcard"));
				cl.setPicture((String)lmap.get(i).get("Picture"));
				cl.setProvince((String)lmap.get(i).get("Province"));
				cl.setRealName((String)lmap.get(i).get("RealName"));
				cl.setRegisterDay(sf.format((Date)lmap.get(i).get("RegisterDate")));
				cl.setRegisterTime(sd.format((Date)lmap.get(i).get("RegisterTime")));
				cl.setSchool((String)lmap.get(i).get("School"));
				cl.setStatus((String)lmap.get(i).get("Status"));
				cl.setTel((String)lmap.get(i).get("Tel"));
				cl.setUserStatus((String)lmap.get(i).get("UseStatus"));
				cl.setTruhCode((int)lmap.get(i).get("TruhCode"));
				cl.setPassWord((String)lmap.get(i).get("Password"));
			}
			return cl;
		}else{
			return null;
		}
	}
	
	public int getClientCount(String sql){
		  Map<String, Object> map=DBUtil.query(sql);
		  if(map!=null&&map.size()!=0){
			  return  Integer.parseInt(String.valueOf((Long)map.get("num")));
		  }else{
			  return 0;
		  }
		  
		}
	
	public int deleteClient(int id){
		String sql="delete from client where ClientId=?";
		int i=DBUtil.executeUpdate(sql, id);
		return i;
	}
	
	public int changeUseStatus(String Status,String id){
		String sql="update client set UseStatus=? where ClientId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{Status,Integer.parseInt(id)});
		return i;
	}
	
	public int addClient(Client client){
		String sql="insert into client(ClientCode,ClientName,RealName,Idcard,Tel,E_mail,Picture,Province,City,School,Status,RegisterTime,RegisterDate,UpdateTime,Password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql,new Object[]{client.getClientCode(),client.getClientName(),client.getRealName(),client.getIdcard(),client.getTel(),client.getE_mail(),client.getPicture(),client.getProvince(),client.getCity(),client.getSchool(),client.getStatus(),client.getRegisterTime(),client.getRegisterDay(),client.getUpdateTime(),client.getPassWord()});
		return i;
	}
	
	public int updateClient(Client client){
		String sql="update client set ClientName=?,RealName=?,Idcard=?,Tel=?,E_mail=?,Province=?,City=?,School=?,Status=?,UpdateTime=? where ClientId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{client.getClientName(),client.getRealName(),client.getIdcard(),client.getTel(),client.getE_mail(),client.getProvince(),client.getCity(),client.getSchool(),client.getStatus(),client.getUpdateTime(),client.getClientId()});
		return i;
	}
	
	public int updateClientPassword(String password,String id){
		String sql="update client set Password=? where ClientId=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{password,id});
		return i;
	}
	
	public Client queryClientbye_mail(String e_mail){
		String sql="select * from client where E_mail=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,e_mail);
		if(lmap!=null&&lmap.size()==1){
			Client cl=new Client();
			for(int i=0;i<lmap.size();i++){
				cl.setCity((String)lmap.get(i).get("City"));
				cl.setClientCode((String)lmap.get(i).get("ClientCode"));
				cl.setClientId((int)lmap.get(i).get("ClientId"));
				cl.setClientName((String)lmap.get(i).get("ClientName"));
				cl.setE_mail((String)lmap.get(i).get("E_mail"));
				cl.setIdcard((String)lmap.get(i).get("Idcard"));
				cl.setPicture((String)lmap.get(i).get("Picture"));
				cl.setProvince((String)lmap.get(i).get("Province"));
				cl.setRealName((String)lmap.get(i).get("RealName"));
				cl.setRegisterDay(sf.format((Date)lmap.get(i).get("RegisterDate")));
				cl.setRegisterTime(sd.format((Date)lmap.get(i).get("RegisterTime")));
				cl.setSchool((String)lmap.get(i).get("School"));
				cl.setStatus((String)lmap.get(i).get("Status"));
				cl.setTel((String)lmap.get(i).get("Tel"));
				cl.setUserStatus((String)lmap.get(i).get("UseStatus"));
				cl.setTruhCode((int)lmap.get(i).get("TruhCode"));
				cl.setPassWord((String)lmap.get(i).get("Password"));
			}
			return cl;
		}else{
			return null;
		}
	}

}
