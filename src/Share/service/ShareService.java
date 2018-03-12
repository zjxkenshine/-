package Share.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Page.model.PageBean;
import Share.dao.ShareDao;
import Share.model.ShareFile;
import Share.model.SharePic;

public class ShareService {
	
	ShareDao sd=new ShareDao();
	
	public List<ShareFile> queryallsharefile() throws Exception{
		try{
				return sd.queryallsharefile();
				
			}catch(Exception e){
				throw new Exception("查询共享文件失败，原因是："+e.getMessage());
			}
	}
	
	public List<SharePic> queryallsharepic() throws Exception{
		try{
				return sd.queryallsharepic();
				
			}catch(Exception e){
				throw new Exception("查询共享图片失败，原因是："+e.getMessage());
			}
	}
	
	public int getsharefilecount(ShareFile shf) throws Exception{
		try{
			String sql="select count(*) as num from sharefile where 1=1";
			if(shf.getManagerId()!=0){
				sql = sql+" and ManagerId="+shf.getManagerId();
			}
			if(shf.getShareFileId()!=0){
				sql=sql+" and ShareFileId="+shf.getShareFileId();
			}
			 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(shf.getUploadTime()!=null&&!shf.getUploadTime().trim().equals("")){
					String addtime[]=shf.getUploadTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and UploadTime>='"+sf.format(date2)+"' and UploadTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and UploadTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and UploadTime>='"+sf.format(date1)+"' and UploadTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				return sd.getsharecount(sql);
		}catch(Exception e){
			throw new Exception("查询共享文件数量失败，原因是："+e.getMessage());
		}
	}
	
	public int getsharepiccount(SharePic shp) throws Exception{
		try{
			String sql="select count(*) as num from sharepic where 1=1";
			if(shp.getManagerId()!=0){
				sql = sql+" and ManagerId="+shp.getManagerId();
			}
			if(shp.getSharePicId()!=0){
				sql=sql+" and SharePicId="+shp.getSharePicId();
			}
			 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(shp.getUploadTime()!=null&&!shp.getUploadTime().trim().equals("")){
					String addtime[]=shp.getUploadTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and UploadTime>='"+sf.format(date2)+"' and UploadTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and UploadTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and UploadTime>='"+sf.format(date1)+"' and UploadTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				return sd.getsharecount(sql);
		}catch(Exception e){
			throw new Exception("查询共享图片数量失败，原因是："+e.getMessage());
		}
	}
	
	
	public List<ShareFile> querysharefile(ShareFile shf,PageBean page) throws Exception{
		try{
			String sql="select * from sharefile where 1=1";
			if(shf.getManagerId()!=0){
				sql = sql+" and ManagerId="+shf.getManagerId();
			}
			if(shf.getShareFileId()!=0){
				sql=sql+" and ShareFileId="+shf.getShareFileId();
			}
			 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(shf.getUploadTime()!=null&&!shf.getUploadTime().trim().equals("")){
					String addtime[]=shf.getUploadTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and UploadTime>='"+sf.format(date2)+"' and UploadTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and UploadTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and UploadTime>='"+sf.format(date1)+"' and UploadTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				return sd.querysharefile(sql, page);
		}catch(Exception e){
			throw new Exception("查询共享文件失败，原因是："+e.getMessage());
		}
	}
	
	public List<SharePic> querysharepic(SharePic shp,PageBean page) throws Exception{
		try{
			String sql="select *  from sharepic where 1=1";
			if(shp.getManagerId()!=0){
				sql = sql+" and ManagerId="+shp.getManagerId();
			}
			if(shp.getSharePicId()!=0){
				sql=sql+" and SharePicId="+shp.getSharePicId();
			}
			 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				if(shp.getUploadTime()!=null&&!shp.getUploadTime().trim().equals("")){
					String addtime[]=shp.getUploadTime().split(",");    //获取添加时间
					if(addtime.length==1){
						Date date=sf.parse(addtime[0]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}else if(addtime.length==2&&!addtime[0].equals("")){
						Date date1=sf.parse(addtime[0]);    
						Date date2=sf.parse(addtime[1]);
						if(date1.after(date2)){
							sql=sql+" and UploadTime>='"+sf.format(date2)+"' and UploadTime<='"+sf.format(date1)+"'";
						}else if(date1.equals(date2)) {
							sql=sql+" and UploadTime='"+sf.format(date1)+"'";
						}else {
							sql=sql+" and UploadTime>='"+sf.format(date1)+"' and UploadTime<='"+sf.format(date2)+"'";
						}
					}else{
						Date date=sf.parse(addtime[1]);     //解析时间
						sql=sql+" and UploadTime='"+sf.format(date)+"'";   //格式化时间
					}
				}
				return sd.querysharepic(sql, page);
		}catch(Exception e){
			throw new Exception("查询共享图片失败，原因是："+e.getMessage());
		}
	}
	
	public int addsharefile(ShareFile shf) throws Exception{
		try{
			return sd.addsharefile(shf);
		}catch(Exception e){
			throw new Exception("添加共享文件失败，原因是："+e.getMessage());
		}
	}
	
	public int addsharepic(SharePic shp) throws Exception{
		try{
			return sd.addsharepic(shp);
		}catch(Exception e){
			throw new Exception("添加共享图片失败，原因是："+e.getMessage());
		}
	}
	
	public int deletesharefile(String id) throws Exception{
		try{
			return sd.deletesharefile(id);
		}catch(Exception e){
			throw new Exception("删除共享文件失败，原因是："+e.getMessage());
		}
	}
	
	public int deletesharepic(String id) throws Exception{
		try{
			return sd.deletesharepic(id);
		}catch(Exception e){
			throw new Exception("删除共享图片失败，原因是："+e.getMessage());
		}
	}

}
