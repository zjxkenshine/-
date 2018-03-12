package Worker.model;

public class WorkerType {
	private int WorkerTypeId;
	private String WorkerTypeName;
	private String Discripe;
	private String AddTime;
	private String Number;
	private String Status;   //基本or非基本
	
	@Override
	public String toString() {
		return "WorkerType [WorkerTypeId=" + WorkerTypeId + ", WorkerTypeName="
				+ WorkerTypeName + ", Discripe=" + Discripe + ", AddTime="
				+ AddTime + ", Number=" + Number + ", Status=" + Status + "]";
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getNumber() {
		return Number;
	}
	public void setNumber(String number) {
		Number = number;
	}
	public int getWorkerTypeId() {
		return WorkerTypeId;
	}
	public void setWorkerTypeId(int workerTypeId) {
		WorkerTypeId = workerTypeId;
	}
	public String getWorkerTypeName() {
		return WorkerTypeName;
	}
	public void setWorkerTypeName(String workerTypeName) {
		WorkerTypeName = workerTypeName;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
	

}
