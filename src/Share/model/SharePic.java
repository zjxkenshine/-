package Share.model;

public class SharePic {
	
	private int SharePicId;
	private int ManagerId;
	private int DownloadNum;   //下载次数
	private String UploadTime;
	private String PicAddress; //图片地址
	private String Discripe;
	
	public int getSharePicId() {
		return SharePicId;
	}
	public void setSharePicId(int sharePicId) {
		SharePicId = sharePicId;
	}
	public int getManagerId() {
		return ManagerId;
	}
	public void setManagerId(int managerId) {
		ManagerId = managerId;
	}
	public int getDownloadNum() {
		return DownloadNum;
	}
	public void setDownloadNum(int downloadNum) {
		DownloadNum = downloadNum;
	}
	public String getUploadTime() {
		return UploadTime;
	}
	public void setUploadTime(String uploadTime) {
		UploadTime = uploadTime;
	}
	public String getPicAddress() {
		return PicAddress;
	}
	public void setPicAddress(String picAddress) {
		PicAddress = picAddress;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	@Override
	public String toString() {
		return "SharePic [SharePicId=" + SharePicId + ", ManagerId="
				+ ManagerId + ", DownloadNum=" + DownloadNum + ", UploadTime="
				+ UploadTime + ", PicAddress=" + PicAddress + ", Discripe="
				+ Discripe + "]";
	}

}
