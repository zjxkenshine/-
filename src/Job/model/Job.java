package Job.model;

public class Job {
	
	private int JobId;
	private String JobName;
	private String WorkPlace;
	private String WorkTime;
	private int CilentId;
	private String AddTime;
	private String Discripe;
	private int NeedNum;
	private String Picture;
	private int Status;
	private String Tel;
	@Override
	public String toString() {
		return "Job [JobId=" + JobId + ", JobName=" + JobName + ", WorkPlace="
				+ WorkPlace + ", WorkTime=" + WorkTime + ", CilentId="
				+ CilentId + ", AddTime=" + AddTime + ", Discripe=" + Discripe
				+ ", NeedNum=" + NeedNum + ", Picture=" + Picture + ", Status="
				+ Status + ", Tel=" + Tel + "]";
	}
	public int getJobId() {
		return JobId;
	}
	public void setJobId(int jobId) {
		JobId = jobId;
	}
	public String getJobName() {
		return JobName;
	}
	public void setJobName(String jobName) {
		JobName = jobName;
	}
	public String getWorkPlace() {
		return WorkPlace;
	}
	public void setWorkPlace(String workPlace) {
		WorkPlace = workPlace;
	}
	public String getWorkTime() {
		return WorkTime;
	}
	public void setWorkTime(String workTime) {
		WorkTime = workTime;
	}
	public int getCilentId() {
		return CilentId;
	}
	public void setCilentId(int cilentId) {
		CilentId = cilentId;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	public int getNeedNum() {
		return NeedNum;
	}
	public void setNeedNum(int needNum) {
		NeedNum = needNum;
	}
	public String getPicture() {
		return Picture;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}

}
