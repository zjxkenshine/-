package Client.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Client.dao.ClientDao;
import Client.model.Client;
import Page.model.PageBean;

public class ClientService {
	
	ClientDao cd=new ClientDao();
	
	public List<Client> queryallclient() throws Exception{
		try{
				return cd.queryallclient();
				
			}catch(Exception e){
				throw new Exception("查询所有用户失败，原因是："+e.getMessage());
			}
	}
	
	public Client queryclient(String id) throws Exception{
		try{
				return cd.queryClient(id);
				
			}catch(Exception e){
				throw new Exception("查询用户失败，原因是："+e.getMessage());
			}
	}
	
	public int addclient(Client client) throws Exception{
		try{
				return cd.addClient(client);
				
			}catch(Exception e){
				throw new Exception("添加用户失败，原因是："+e.getMessage());
			}
	}
	
	public List<Client> queryclient() throws Exception{
		try{
			return cd.queryclient();
			
		}catch(Exception e){
			throw new Exception("查询用户失败，原因是："+e.getMessage());
		}
	}
	
	public int upldateclient(Client client) throws Exception{
		try{
				return cd.updateClient(client);
				
			}catch(Exception e){
				throw new Exception("更新用户失败，原因是："+e.getMessage());
			}
	}
	
	public int upldateclientpassword(String password,String id) throws Exception{
		try{
				return cd.updateClientPassword(password, id);
				
			}catch(Exception e){
				throw new Exception("更新用户密码失败，原因是："+e.getMessage());
			}
	}
	
	public int deleteclient(int id) throws Exception{
		try{
				return cd.deleteClient(id);
				
			}catch(Exception e){
				throw new Exception("更新用户失败，原因是："+e.getMessage());
			}
	}
	
	public int changeuserstatus(String Status,String id) throws Exception{
		try{
				return cd.changeUseStatus(Status, id);
				
			}catch(Exception e){
				throw new Exception("更新用户账号状态失败，原因是："+e.getMessage());
			}
	}
	
	public int getClientCount(Client client) throws Exception{
		try{
				String sql="select count(*) as num from client where 1=1";
				  if(client.getClientId()!=0){
					   sql=sql+" and ClientId="+client.getClientId();
				   }
				   if(client.getClientName()!=null&&!client.getClientName().equals("")){
					   sql=sql+" and ClientName() like '%"+client.getClientName()+"%'";
				   }
				   if(client.getClientCode()!=null&&!client.getClientCode().equals("")){
					   sql=sql+" and ClientCode like '%"+client.getClientCode()+"%'";
				   }
				   if(client.getE_mail()!=null&&!client.getE_mail().equals("")){
					   sql=sql+" and E_mail like '%"+client.getE_mail()+"%'";
				   }
				   if(client.getRealName()!=null&&!client.getRealName().equals("")){
					   sql=sql+" and RealName like '%"+client.getRealName()+"%'";
				   }
				   if(client.getSchool()!=null&&!client.getSchool().equals("")){
					   sql=sql+" and School like '%"+client.getSchool()+"%'";
				   }
				   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					if(client.getRegisterTime()!=null&&!client.getRegisterTime().trim().equals("")){
						String addtime[]=client.getRegisterTime().split(",");    //获取添加时间
						if(addtime.length==1){
							Date date=sf.parse(addtime[0]);     //解析时间
							sql=sql+" and RegisterDay='"+sf.format(date)+"'";   //格式化时间
						}else if(addtime.length==2&&!addtime[0].equals("")){
							Date date1=sf.parse(addtime[0]);    
							Date date2=sf.parse(addtime[1]);
							if(date1.after(date2)){
								sql=sql+" and RegisterTime>='"+sf.format(date2)+"' and RegisterTime<='"+sf.format(date1)+"'";
							}else if(date1.equals(date2)) {
								sql=sql+" and RegisterDay='"+sf.format(date1)+"'";
							}else {
								sql=sql+" and RegisterTime>='"+sf.format(date1)+"' and RegisterTime<='"+sf.format(date2)+"'";
							}
						}else{
							Date date=sf.parse(addtime[1]);     //解析时间
							sql=sql+" and RegisterDay='"+sf.format(date)+"'";   //格式化时间
						}
					}
					return cd.getClientCount(sql);
				
			}catch(Exception e){
				throw new Exception("查询用户总数失败，原因是："+e.getMessage());
			}
	}
	
	public List<Client> queryclient(Client client,PageBean page) throws Exception{
		try{
				String sql="select * from client where 1=1";
				  if(client.getClientId()!=0){
					   sql=sql+" and ClientId="+client.getClientId();
				   }
				   if(client.getClientName()!=null&&!client.getClientName().equals("")){
					   sql=sql+" and ClientName() like '%"+client.getClientName()+"%'";
				   }
				   if(client.getClientCode()!=null&&!client.getClientCode().equals("")){
					   sql=sql+" and ClientCode like '%"+client.getClientCode()+"%'";
				   }
				   if(client.getE_mail()!=null&&!client.getE_mail().equals("")){
					   sql=sql+" and E_mail like '%"+client.getE_mail()+"%'";
				   }
				   if(client.getRealName()!=null&&!client.getRealName().equals("")){
					   sql=sql+" and RealName like '%"+client.getRealName()+"%'";
				   }
				   if(client.getSchool()!=null&&!client.getSchool().equals("")){
					   sql=sql+" and School like '%"+client.getSchool()+"%'";
				   }
				   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					if(client.getRegisterTime()!=null&&!client.getRegisterTime().trim().equals("")){
						String addtime[]=client.getRegisterTime().split(",");    //获取添加时间
						if(addtime.length==1){
							Date date=sf.parse(addtime[0]);     //解析时间
							sql=sql+" and RegisterDay='"+sf.format(date)+"'";   //格式化时间
						}else if(addtime.length==2&&!addtime[0].equals("")){
							Date date1=sf.parse(addtime[0]);    
							Date date2=sf.parse(addtime[1]);
							if(date1.after(date2)){
								sql=sql+" and RegisterTime>='"+sf.format(date2)+"' and RegisterTime<='"+sf.format(date1)+"'";
							}else if(date1.equals(date2)) {
								sql=sql+" and RegisterDay='"+sf.format(date1)+"'";
							}else {
								sql=sql+" and RegisterTime>='"+sf.format(date1)+"' and RegisterTime<='"+sf.format(date2)+"'";
							}
						}else{
							Date date=sf.parse(addtime[1]);     //解析时间
							sql=sql+" and RegisterDay='"+sf.format(date)+"'";   //格式化时间
						}
					}
					return cd.queryclient(sql, page);
				
			}catch(Exception e){
				throw new Exception("查询用户123失败，原因是："+e.getMessage());
			}
	}
	
	public Client queryClientbye_mail(String e_mail) throws Exception{
		try{
			return cd.queryClientbye_mail(e_mail);
		}catch(Exception e){
			throw new Exception("更新用户账号状态失败，原因是："+e.getMessage());
		}
	}


}
