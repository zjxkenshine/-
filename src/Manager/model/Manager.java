package Manager.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Manager implements Serializable{
	private int ManagerId;
	private int Status;
	private String ManagerName;
	private String Password;
	private String E_mail;
	private String RegisterTime;
	private String UpdateTime;
	private String DeleteStatus;
	private String Discripe;
	private int WorkerId;
	private String Picture;
	private int UseStatus;    //使用情况
	
	@Override
	public String toString() {
		return "Manager [ManagerId=" + ManagerId + ", Status=" + Status
				+ ", ManagerName=" + ManagerName + ", Password=" + Password
				+ ", E_mail=" + E_mail + ", RegisterTime=" + RegisterTime
				+ ", UpdateTime=" + UpdateTime + ", DeleteStatus="
				+ DeleteStatus + ", Discripe=" + Discripe + ", WorkerId="
				+ WorkerId + ", Picture=" + Picture + ", UseStatus="
				+ UseStatus + "]";
	}
	public int getUseStatus() {
		return UseStatus;
	}
	public void setUseStatus(int useStatus) {
		UseStatus = useStatus;
	}
	public String getPicture() {
		return Picture;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public int getManagerId() {
		return ManagerId;
	}
	public void setManagerId(int managerId) {
		ManagerId = managerId;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public String getManagerName() {
		return ManagerName;
	}
	public void setManagerName(String managerName) {
		ManagerName = managerName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getE_mail() {
		return E_mail;
	}
	public void setE_mail(String e_mail) {
		E_mail = e_mail;
	}
	public String getRegisterTime() {
		return RegisterTime;
	}
	public void setRegisterTime(String registerTime) {
		RegisterTime = registerTime;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public String getDeleteStatus() {
		return DeleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	public int getWorkerId() {
		return WorkerId;
	}
	public void setWorkerId(int workerId) {
		WorkerId = workerId;
	}
	
	

}
