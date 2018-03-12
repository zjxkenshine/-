package Share.model;



public class ShareFile {
	private int ShareFileId;
	private int ManagerId;
	private int DownloadNum;   //下载次数
	private String UploadTime;
	private String FileAddress; //文件地址
	private String Discripe;
	
	
	
	
	public int getShareFileId() {
		return ShareFileId;
	}
	public void setShareFileId(int shareFileId) {
		ShareFileId = shareFileId;
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
	public String getFileAddress() {
		return FileAddress;
	}
	public void setFileAddress(String fileAddress) {
		FileAddress = fileAddress;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	@Override
	public String toString() {
		return "ShareFile [ShareFileId=" + ShareFileId + ", ManagerId="
				+ ManagerId + ", DownloadNum=" + DownloadNum + ", UploadTime="
				+ UploadTime + ", FileAddress=" + FileAddress + ", Discripe="
				+ Discripe + "]";
	}
	
	

}
