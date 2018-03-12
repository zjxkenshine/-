package Manager.model;

public class ManagerStatus {
	
	private int ManagerStatusId;
	private String ManagerStatusName;
	private String StatusType;
	private String Discription;
	private String AddTime;
	private String Number;
	@Override
	public String toString() {
		return "ManagerStatus [ManagerStatusId=" + ManagerStatusId
				+ ", ManagerStatusName=" + ManagerStatusName + ", StatusType="
				+ StatusType + ", Discription=" + Discription + ", AddTime="
				+ AddTime + ", Number=" + Number + "]";
	}
	public int getManagerStatusId() {
		return ManagerStatusId;
	}
	public void setManagerStatusId(int managerStatusId) {
		ManagerStatusId = managerStatusId;
	}
	public String getManagerStatusName() {
		return ManagerStatusName;
	}
	public void setManagerStatusName(String managerStatusName) {
		ManagerStatusName = managerStatusName;
	}
	public String getStatusType() {
		return StatusType;
	}
	public void setStatusType(String statusType) {
		StatusType = statusType;
	}
	public String getDiscription() {
		return Discription;
	}
	public void setDiscription(String discription) {
		Discription = discription;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
	public String getNumber() {
		return Number;
	}
	public void setNumber(String number) {
		Number = number;
	}
}
