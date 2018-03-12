package Qian_Message.service;

import java.util.List;

import Qian_Message.dao.QianMessageDao;
import Qian_Message.model.QianMessage;

public class QianMessageService {
	
	QianMessageDao qmd=new QianMessageDao();
	
	public List<QianMessage> queryallqianmessage() throws Exception{
		try{
			return qmd.queryallqianmessage();
		}catch(Exception e){
			throw new Exception("查询所有前台消息失败，原因是："+e.getMessage());
		}
	}
	
	public QianMessage queryqianmessagebyname(String name) throws Exception{
		try{
			return qmd.queryqianmessagebyname(name);
		}catch(Exception e){
			throw new Exception("查询前台消息失败，原因是："+e.getMessage());
		}
	}
	
	public QianMessage queryqianmessagebyid(String id) throws Exception{
		try{
			return qmd.queryqianmessagebyid(id);
		}catch(Exception e){
			throw new Exception("查询前台消息失败，原因是："+e.getMessage());
		}
	}
	
	public int updateqianmessagebyname(String name) throws Exception{
		try{
			return qmd.updateqianmessagebyname(name);
		}catch(Exception e){
			throw new Exception("查询前台消息失败，原因是："+e.getMessage());
		}
	}
	
	public int updateqianmessagebyid(String id) throws Exception{
		try{
			return qmd.updateqianmessagebyid(id);
		}catch(Exception e){
			throw new Exception("查询前台消息失败，原因是："+e.getMessage());
		}
	}

}
