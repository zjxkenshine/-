package Share.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import Page.model.PageBean;
import Share.model.ShareFile;
import Share.model.SharePic;

public class ShareDao {
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public List<ShareFile> queryallsharefile(){
		String sql = "select * from sharefile";
		List<Map<String,Object>> lm=DBUtil.list(sql);
		List<ShareFile> lsf=new ArrayList<ShareFile>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				ShareFile shf=new ShareFile();
				shf.setDiscripe((String)lm.get(i).get("Discripe"));
				shf.setDownloadNum((int)lm.get(i).get("DownloadNum"));
				shf.setFileAddress((String)lm.get(i).get("FileAddress"));
				shf.setShareFileId((int)lm.get(i).get("ShareFileId"));
				shf.setUploadTime(sf.format((Date)lm.get(i).get("UploadTime")));
				shf.setManagerId((int)lm.get(i).get("ManagerId"));
				lsf.add(shf);
			}
			return lsf;
		}else{
			return null;
		}
		
	}
	
	public List<SharePic> queryallsharepic(){
		String sql = "select * from sharepic";
		List<Map<String,Object>> lm=DBUtil.list(sql);
		List<SharePic> lsp=new ArrayList<SharePic>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				SharePic shp=new SharePic();
				shp.setDiscripe((String)lm.get(i).get("Discripe"));
				shp.setDownloadNum((int)lm.get(i).get("DownloadNum"));
				shp.setPicAddress((String)lm.get(i).get("PicAddress"));
				shp.setSharePicId((int)lm.get(i).get("SharePicId"));
				shp.setUploadTime(sf.format((Date)lm.get(i).get("UploadTime")));
				shp.setManagerId((int)lm.get(i).get("ManagerId"));
				lsp.add(shp);
			}
			return lsp;
		}else{
			return null;
		}
		
	}
	
	public int getsharecount(String sql){
		  Map<String, Object> map=DBUtil.query(sql);
		  if(map!=null&&map.size()!=0){
			  return  Integer.parseInt(map.get("num").toString());
		  }else{
			  return 0;
		  }
		  
	}
	
	public List<ShareFile> querysharefile(String sql,PageBean page){
		String sql1 =sql+" limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql1);
		List<Map<String,Object>> lm =DBUtil.list(sql1);
		List<ShareFile> lsf=new ArrayList<ShareFile>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				ShareFile shf=new ShareFile();
				shf.setDiscripe((String)lm.get(i).get("Discripe"));
				shf.setDownloadNum((int)lm.get(i).get("DownloadNum"));
				shf.setFileAddress((String)lm.get(i).get("FileAddress"));
				shf.setShareFileId((int)lm.get(i).get("ShareFileId"));
				shf.setUploadTime(sf.format((Date)lm.get(i).get("UploadTime")));
				shf.setManagerId((int)lm.get(i).get("ManagerId"));
				lsf.add(shf);
			}
			return lsf;
		}else{
			return null;
		}
	}
	
	public List<SharePic> querysharepic(String sql,PageBean page){
		String sql1 =sql+" limit "+(page.getNowPage()-1)*page.getPageSize()+","+page.getPageSize();
		System.out.println(sql1);
		List<Map<String,Object>> lm =DBUtil.list(sql1);
		List<SharePic> lsp=new ArrayList<SharePic>();
		if(lm!=null&&lm.size()>0){
			for(int i=0;i<lm.size();i++){
				SharePic shp=new SharePic();
				shp.setDiscripe((String)lm.get(i).get("Discripe"));
				shp.setDownloadNum((int)lm.get(i).get("DownloadNum"));
				shp.setPicAddress((String)lm.get(i).get("PicAddress"));
				shp.setSharePicId((int)lm.get(i).get("SharePicId"));
				shp.setUploadTime(sf.format((Date)lm.get(i).get("UploadTime")));
				shp.setManagerId((int)lm.get(i).get("ManagerId"));
				lsp.add(shp);
			}
			return lsp;
		}else{
			return null;
		}
	}
	
	public int addsharefile(ShareFile shf){
		String sql="insert into sharefile(ManagerId,DownloadNum,UploadTime,FileAddress,Discripe) values(?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{shf.getManagerId(),shf.getDownloadNum(),shf.getUploadTime(),shf.getFileAddress(),shf.getDiscripe()});
		return i;
	}
	
	public int addsharepic(SharePic shp){
		String sql="insert into sharepic(ManagerId,DownloadNum,UploadTime,PicAddress,Discripe) values(?,?,?,?,?)";
		int i=DBUtil.executeUpdate(sql, new Object[]{shp.getManagerId(),shp.getDownloadNum(),shp.getUploadTime(),shp.getPicAddress(),shp.getDiscripe()});
		return i;
	}
	
	public int deletesharefile(String id){
		String sql="delete from sharefile where ShareFileId=?";
		int i = DBUtil.executeUpdate(sql,id);
		return i;
	}
	
	public int deletesharepic(String id){
		String sql="delete from sharepic where SharePicId=?";
		int i = DBUtil.executeUpdate(sql,id);
		return i;
	}

}
