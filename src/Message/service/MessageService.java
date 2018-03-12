package Message.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Message.dao.MessageDao;
import Message.model.Message;
import Message.model.WebMessage;
import Message.model.WebPic;
import Page.model.PageBean;

public class MessageService {
	MessageDao md = new MessageDao();
	
	public List<WebMessage> getWebMessage() throws Exception{
		try{
			return md.getWebMessage();
		}catch(Exception e){
			throw new Exception("查询网站信息失败，原因是："+e.getMessage());
		}
	}
	
	public void updatewebmessage(String [] a,String[] b) throws Exception{
		try{
			md.clearwebmessage();
			for(int i=0;i<a.length;i++){
				if(a[i]!=""&&b[i]!=""){
					 md.addwebmessage(a[i],b[i]);
				}
				
				System.out.println(a[i]+"+"+b[i]);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			throw new Exception("更新网站信息失败，原因是："+e.getMessage());
		}
	}
	
	public int getMyMessageCount(Message msg) throws Exception{
		   try{
			//   System.out.println(msg);
			   //判断拼接字符串
			   String sql="select count(*) as num from message where 1=1";
			   if(msg.getFromManagerId()!=0&&msg.getToManagerId()!=0){
				   sql=sql+" and FromManagerId="+msg.getFromManagerId()+" and FromStatus=1 or ToManagerId="+msg.getToManagerId()+" and ToStatus=1";
			   }else if(msg.getFromManagerId()!=0){            //已发送
				   sql=sql+" and FromManagerId="+msg.getFromManagerId()+" and FromStatus=1";
			   }else if(msg.getToManagerId()!=0&&msg.getReadStatus()==0){             //已读
				   sql=sql+" and ToManagerId="+msg.getToManagerId()+" and ToStatus=1 and ReadStatus=0";
			   }else if (msg.getToManagerId()!=0&&msg.getReadStatus()==1) {        //未读
				   sql=sql+" and ToManagerId="+msg.getToManagerId()+" and ToStatus=1 and ReadStatus=1";
			   }else if(msg.getToManagerId()!=0&&msg.getReadStatus()==2){  			//收到的邮件
				   sql=sql+" and ToManagerId="+msg.getToManagerId()+" and ToStatus=1";
			   }
			   
			   
			   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(msg.getSendTime()!=null&&!msg.getSendTime().trim().equals("")){
					String addtime[]=msg.getSendTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and SendDay='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and SendTime>='"+sf.format(date2)+"' and SendTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and SendDay='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and SendTime>='"+sf.format(date1)+"' and SendTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and SendDay='"+sf.format(date)+"'";   //格式化时间
					}
				}
				
				//查询反值
				return md.getmessagecount(sql);
				
		   }catch (Exception e){
			   throw new Exception("查询邮件总数失败，原因是："+e.getMessage());
		   }
	}
	
	public List<Message> queryMessage(Message msg,PageBean page) throws Exception{
		 try{
			 
		//	 System.out.println(msg);
			 
			   //判断拼接字符串
			   String sql="select * from message where 1=1";
			   if(msg.getFromManagerId()!=0&&msg.getToManagerId()!=0){
				   sql=sql+" and FromManagerId="+msg.getFromManagerId()+" and FromStatus=1 or ToManagerId="+msg.getToManagerId()+" and ToStatus=1";
			   }else if(msg.getFromManagerId()!=0){            //已发送
				   sql=sql+" and FromManagerId="+msg.getFromManagerId()+" and FromStatus=1";
			   }else if(msg.getToManagerId()!=0&&msg.getReadStatus()==0){             //已读
				   sql=sql+" and ToManagerId="+msg.getToManagerId()+" and ToStatus=1 and ReadStatus=0";
			   }else if (msg.getToManagerId()!=0&&msg.getReadStatus()==1) {        //未读
				   sql=sql+" and ToManagerId="+msg.getToManagerId()+" and ToStatus=1 and ReadStatus=1";
			   }else if(msg.getToManagerId()!=0&&msg.getReadStatus()==2){  			//收到的邮件
				   sql=sql+" and ToManagerId="+msg.getToManagerId()+" and ToStatus=1";
			   }
			   
			   
			   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(msg.getSendTime()!=null&&!msg.getSendTime().trim().equals("")){
					String addtime[]=msg.getSendTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and SendDay='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and SendTime>='"+sf.format(date2)+"' and SendTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and SendDay='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and SendTime>='"+sf.format(date1)+"' and SendTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and SendDay='"+sf.format(date)+"'";   //格式化时间
					}
				}
				
				//查询反值
				return md.querymessage(sql, page);
				
		   }catch (Exception e){
			   throw new Exception("查询相关邮件失败，原因是："+e.getMessage());
		   }
	}
	
	public int addmessage(Message msg) throws Exception{
		try{
			int i = md.addMessage(msg);
			return i;
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("发送邮件失败，原因是："+e.getMessage());
		}
	}
	
	public int changereadstatus(String id,String status) throws Exception{
		try{
			int i = md.changereadstatus(id,status);
			return i;
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("修改邮件状态失败，原因是："+e.getMessage());
		}
	}
	
	public int updatedeletestatus(int from,int to,String id) throws Exception{
		try{
			return md.updatedeletestatus(from,to,id);
		}catch(Exception e){
			throw new Exception("删除邮件失败，原因是："+e.getMessage());
		}
	}
	
	public List<Message> queryallmessage() throws Exception{
		try{
			return md.queryallmessage();
		}catch(Exception e){
			throw new Exception("查询所有邮件失败，原因是："+e.getMessage());
		}
	}
	
	public Message querymessage(String id) throws Exception{
		try{
			return md.querymessage(id);
		}catch(Exception e){
			throw new Exception("查询邮件失败，原因是："+e.getMessage());
		}
	}
	
	public int querynotreadnum(String id) throws Exception{
		try{
			return md.querynotreadnum(id);
		}catch(Exception e){
			throw new Exception("查询未读邮件数量失败，原因是："+e.getMessage());
		}
	}
	
	public int uploadwebpic(String webpic,String webpicid) throws Exception{
		try{
			return md.uploadwebpic(webpic, webpicid);
		}catch(Exception e){
			throw new Exception("上传照片失败，原因是："+e.getMessage());
		}
	}
	
	public WebPic queryWebpic() throws Exception{
		try{
			return md.querywebpic();
		}catch(Exception e){
			throw new Exception("查询照片失败，原因是："+e.getMessage());
		}
	}
	
	public int cleanmessage() throws Exception{
		try{
			return md.cleanmessage();
		}catch(Exception e){
			throw new Exception("清理邮件失败，原因是："+e.getMessage());
		}
	}
	
	public String querynotice() throws Exception{
		try{
			return md.querynotice();
		}catch(Exception e){
			throw new Exception("查询公告失败，原因是："+e.getMessage());
		}
	}
	
	public int updatenotice(String discripe) throws Exception{
		try{
			return md.updatenotice(discripe);
		}catch(Exception e){
			throw new Exception("更新公告失败，原因是："+e.getMessage());
		}
	}
}
