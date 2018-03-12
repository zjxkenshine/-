package Message.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import Message.model.Message;
import Message.model.Notice;
import Message.model.WebMessage;
import Message.model.WebPic;
import Page.model.PageBean;
import util.DBUtil;

public class MessageDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<WebMessage> getWebMessage(){
		String sql = "select * from webmessage";
		List<WebMessage> lw=new LinkedList<WebMessage>();
		List<Map<String,Object>> lmList=DBUtil.list(sql);
		if(lmList.size()>0){
			for(int i=0;i<lmList.size();i++){
				WebMessage wm = new WebMessage();
				wm.setWebMessageId((int)lmList.get(i).get("WebMessageId"));
				wm.setWebMessageName((String)lmList.get(i).get("MessageName"));
				wm.setWebMessageValue((String)lmList.get(i).get("MessageValue"));
				lw.add(wm);
			}
			return lw;
			
		}else {
			return null;
		}
	}
	
	public int clearwebmessage(){
		try{
			String sql ="delete from webmessage";
			int i=DBUtil.executeUpdate(sql);
			return i;
		}	
		catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	public int addwebmessage(String name,String value){
		String sql="insert into webmessage(MessageName,MessageValue) values(?,?)";
		int i =DBUtil.executeUpdate(sql,new Object[]{name,value});
		return i;
	}
	
	public int addMessage(Message msg){
		String sql="insert into message(FromManagerId,ToManagerId,SendTime,ReadStatus,FromStatus,ToStatus,Status,Title,Discripe,FileAddress,SendDay) values(?,?,?,?,?,?,?,?,?,?,?)";
		int i =DBUtil.executeUpdate(sql, new Object[]{msg.getFromManagerId(),msg.getToManagerId(),msg.getSendTime(),msg.getReadStatus(),msg.getFromStatus(),msg.getToStatus(),msg.getStatus(),msg.getTitle(),msg.getDiscripe(),msg.getFileAddress(),msg.getSendDay()});
		return i;
	}
	
	public List<Message> querymessage(String sql,PageBean page){
		System.out.println(page.getNowPage());
		String sql1=sql+" order by MessageId desc limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql1);
		List<Map<String,Object>> lm=DBUtil.list(sql1);
		List<Message> lms = new ArrayList<Message>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				Message msg = new Message();
				msg.setDiscripe((String)lm.get(i).get("Discripe"));
				msg.setFileAddress((String)lm.get(i).get("FileAddress"));
				msg.setFromManagerId((int)lm.get(i).get("FromManagerId"));
				msg.setFromStatus((int)lm.get(i).get("FromStatus"));
				msg.setMessageId((int)lm.get(i).get("MessageId"));
				msg.setReadStatus((int)lm.get(i).get("ReadStatus"));
				msg.setSendDay(sf.format((Date)lm.get(i).get("SendDay")));
				msg.setSendTime(sd.format((Date)lm.get(i).get("SendTime")));
				msg.setTitle((String)lm.get(i).get("Title"));
				msg.setStatus((int)lm.get(i).get("Status"));
				msg.setToManagerId((int)lm.get(i).get("ToManagerId"));
				msg.setToStatus((int)lm.get(i).get("ToStatus"));
				lms.add(msg);
			}
			return lms;
		}else{
			return null;
		}
	}
	
	public int getmessagecount(String sql){
			Map<String,Object> map=DBUtil.query(sql);
			return Integer.parseInt(String.valueOf((long)map.get("num")));
	}
	
	public List<Message> queryallmessage(){
		String sql1 = "select * from message";
		List<Map<String,Object>> lm=DBUtil.list(sql1);
		List<Message> lms = new ArrayList<Message>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				Message msg = new Message();
				msg.setDiscripe((String)lm.get(i).get("Discripe"));
				msg.setFileAddress((String)lm.get(i).get("FileAddress"));
				msg.setFromManagerId((int)lm.get(i).get("FromManagerId"));
				msg.setFromStatus((int)lm.get(i).get("FromStatus"));
				msg.setMessageId((int)lm.get(i).get("MessageId"));
				msg.setReadStatus((int)lm.get(i).get("ReadStatus"));
				msg.setSendDay(sf.format((Date)lm.get(i).get("SendDay")));
				msg.setSendTime(sd.format((Date)lm.get(i).get("SendTime")));
				msg.setTitle((String)lm.get(i).get("Title"));
				msg.setStatus((int)lm.get(i).get("Status"));
				msg.setToManagerId((int)lm.get(i).get("ToManagerId"));
				msg.setToStatus((int)lm.get(i).get("ToStatus"));
				lms.add(msg);
			}
			return lms;
		}else{
			return null;
		}
	}
	
	public int changereadstatus(String id,String status){
		String sql = "update message set ReadStatus=? where MessageId=?";
		int i = DBUtil.executeUpdate(sql, new Object[]{status,id});
		return i;
	}
	
	public int updatedeletestatus(int from,int to,String id){
		String sql ="update message set FromStatus=?,ToStatus=? where MessageId=?";
		int i = DBUtil.executeUpdate(sql, new Object[]{from,to,id});
		return i;
	}
	
	public Message querymessage(String id){
		String sql="select * from message where MessageId=?";
		List<Map<String,Object>> lm=DBUtil.list(sql,id);
		Message msg = new Message();
		if(lm!=null&&lm.size()==1){
			for(int i=0;i<lm.size();i++){
				
				msg.setDiscripe((String)lm.get(i).get("Discripe"));
				msg.setFileAddress((String)lm.get(i).get("FileAddress"));
				msg.setFromManagerId((int)lm.get(i).get("FromManagerId"));
				msg.setFromStatus((int)lm.get(i).get("FromStatus"));
				msg.setMessageId((int)lm.get(i).get("MessageId"));
				msg.setReadStatus((int)lm.get(i).get("ReadStatus"));
				msg.setSendDay(sf.format((Date)lm.get(i).get("SendDay")));
				msg.setSendTime(sd.format((Date)lm.get(i).get("SendTime")));
				msg.setTitle((String)lm.get(i).get("Title"));
				msg.setStatus((int)lm.get(i).get("Status"));
				msg.setToManagerId((int)lm.get(i).get("ToManagerId"));
				msg.setToStatus((int)lm.get(i).get("ToStatus"));
	
			}
			return msg ;
		}else{
			return null;
		}
	}
	
	public int querynotreadnum(String id){
	//	System.out.println(id);
		String sql = "select count(*) as num from message where ToManagerId=? and ToStatus=1 and ReadStatus=1";
		Map<String, Object> map=DBUtil.query(sql,id);
		return Integer.parseInt(String.valueOf((long)map.get("num")));
	}
	
	public int uploadwebpic(String webpic,String id){
		String sql="update webpic set WebPicture=? where WebPicId=? ";
		int i =DBUtil.executeUpdate(sql, new Object[]{webpic,id});
		return i;
	}
	
	public WebPic querywebpic(){
		String sql="select * from webpic where WebPicId=1 ";
		Map<String,Object> map=DBUtil.query(sql);
		WebPic wp=new WebPic();
		wp.setWebPicId((int)map.get("WebPicId"));
		wp.setWebPicture((String)map.get("WebPicture"));
		return wp;
	}
	
	public int cleanmessage(){
		String sql="delete from message where ToStatus=? and FromStatus=?";
		int i=DBUtil.executeUpdate(sql,new Object[]{0,0});
		return i;
	}
	
	public String querynotice(){
		String sql="select * from notice where NoticeId=1";
		Map<String,Object> map=DBUtil.query(sql);
		return (String) map.get("Discripe");
	}
	
	public int updatenotice(String discripe){
		String sql="update notice set Discripe=? where NoticeId=1";
		int i=DBUtil.executeUpdate(sql,discripe);
		return i;
	}

}
