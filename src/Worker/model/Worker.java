package Worker.model;

public class Worker {
	private int WorkId;
	private String WorkName;
	private int WorkerType;
	private String Idcard;
	private String Tel;
	private String Age;
	private String Discripe;
	private String Sex;
	private String AddTime;
	private String UpdateTime;    //添加时间
	private String Picture;
	private String DeleteStatus;  //在职，离职
	private String WorkTime;      //入职时间
	@Override
	public String toString() {
		return "Worker [WorkId=" + WorkId + ", WorkName=" + WorkName
				+ ", WorkerType=" + WorkerType + ", Idcard=" + Idcard
				+ ", Tel=" + Tel + ", Age=" + Age + ", Discripe=" + Discripe
				+ ", Sex=" + Sex + ", AddTime=" + AddTime + ", UpdateTime="
				+ UpdateTime + ", Picture=" + Picture + ", DeleteStatus="
				+ DeleteStatus + ", WorkTime=" + WorkTime + "]";
	}
	public String getWorkTime() {
		return WorkTime;
	}
	public void setWorkTime(String workTime) {
		WorkTime = workTime;
	}

	
	public String getPicture() {
		return Picture;
	}
	public String getDeleteStatus() {
		return DeleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public int getWorkId() {
		return WorkId;
	}
	public void setWorkId(int workId) {
		WorkId = workId;
	}
	public String getWorkName() {
		return WorkName;
	}
	public void setWorkName(String workName) {
		WorkName = workName;
	}
	public int getWorkerType() {
		return WorkerType;
	}
	public void setWorkerType(int workerType) {
		WorkerType = workerType;
	}
	public String getIdcard() {
		return Idcard;
	}
	public void setIdcard(String idcard) {
		Idcard = idcard;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}
	public String getAge() {
		return Age;
	}
	public void setAge(String age) {
		Age = age;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	

}
