package Qian_Message.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Qian_Message.model.QianMessage;

public class QianMessageDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<QianMessage> queryallqianmessage(){
		String sql="select * from qianmessage";
		List<Map<String,Object>> lmap=DBUtil.list(sql);
		List<QianMessage> lq=new ArrayList<QianMessage>();
		if(lmap.size()>0&&lmap!=null){
			for(int i=0;i<lmap.size();i++){
				QianMessage qian=new QianMessage();
				qian.setMessageId((int)lmap.get(i).get("MessageId"));
				qian.setMessageName((String)lmap.get(i).get("MessageName"));
				qian.setMessageValue((String)lmap.get(i).get("MessageValue"));
				qian.setUpdateTime(sd.format((Date)lmap.get(i).get("UpdateTime")));
				lq.add(qian);
			}
			return lq;
		}else{
			return null;
		}
		
	}
	
	
	public QianMessage queryqianmessagebyname(String name){
		String sql="select * from qianmessage where MessageName=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,name);

		if(lmap.size()==1&&lmap!=null){
			QianMessage qian=new QianMessage();
			for(int i=0;i<lmap.size();i++){
				
				qian.setMessageId((int)lmap.get(i).get("MessageId"));
				qian.setMessageName((String)lmap.get(i).get("MessageName"));
				qian.setMessageValue((String)lmap.get(i).get("MessageValue"));
				qian.setUpdateTime(sd.format((Date)lmap.get(i).get("UpdateTime")));
				
			}
			return qian;
		}else{
			return null;
		}
		
	}
	
	public QianMessage queryqianmessagebyid(String id){
		String sql="select * from qianmessage where MessageId=?";
		List<Map<String,Object>> lmap=DBUtil.list(sql,id);

		if(lmap.size()==1&&lmap!=null){
			QianMessage qian=new QianMessage();
			for(int i=0;i<lmap.size();i++){
				
				qian.setMessageId((int)lmap.get(i).get("MessageId"));
				qian.setMessageName((String)lmap.get(i).get("MessageName"));
				qian.setMessageValue((String)lmap.get(i).get("MessageValue"));
				qian.setUpdateTime(sd.format((Date)lmap.get(i).get("UpdateTime")));
				
			}
			return qian;
		}else{
			return null;
		}
		
	}
	
	
	public int updateqianmessagebyname(String name){
		String sql="select * from qianmessage set MessageValue=? where MassageName=?";
		int i=DBUtil.executeUpdate(sql,name);
		return i;
	}
	
	public int updateqianmessagebyid(String name){
		String sql="select * from qianmessage set MessageValue=? where MassageId=?";
		int i=DBUtil.executeUpdate(sql,name);
		return i;
	}

}
