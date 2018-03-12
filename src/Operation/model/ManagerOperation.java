package Operation.model;

public class ManagerOperation {
	
	private int OperationId;
	private String OperationType;  //操作类型
	private int ManagerId;			//操作人
	private String OperatList;    //操作对象表
	private String OperationTime;
	private String OperationDay;
	private String Discripe;     //备注
	public int getOperationId() {
		return OperationId;
	}
	public void setOperationId(int operationId) {
		OperationId = operationId;
	}
	public String getOperationType() {
		return OperationType;
	}
	public void setOperationType(String operationType) {
		OperationType = operationType;
	}
	public int getManagerId() {
		return ManagerId;
	}
	public void setManagerId(int managerId) {
		ManagerId = managerId;
	}
	public String getOperatList() {
		return OperatList;
	}
	public void setOperatList(String operatList) {
		OperatList = operatList;
	}
	public String getOperationTime() {
		return OperationTime;
	}
	public void setOperationTime(String operationTime) {
		OperationTime = operationTime;
	}
	public String getOperationDay() {
		return OperationDay;
	}
	public void setOperationDay(String operationDay) {
		OperationDay = operationDay;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	@Override
	public String toString() {
		return "ManagerOperation [OperationId=" + OperationId
				+ ", OperationType=" + OperationType + ", ManagerId="
				+ ManagerId + ", OperatList=" + OperatList + ",  OperationTime=" + OperationTime
				+ ", OperationDay=" + OperationDay + ", Discripe=" + Discripe
				+ "]";
	}
	
	

}
