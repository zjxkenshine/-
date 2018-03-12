package Job.model;

public class JobCollect {
	
	private int JobId;
	private int CollectId;
	private int ClientId;
	private String AddTime;
	@Override
	public String toString() {
		return "JobCollect [JobId=" + JobId + ", CollectId=" + CollectId
				+ ", ClientId=" + ClientId + ", AddTime=" + AddTime + "]";
	}
	public int getJobId() {
		return JobId;
	}
	public void setJobId(int jobId) {
		JobId = jobId;
	}
	public int getCollectId() {
		return CollectId;
	}
	public void setCollectId(int collectId) {
		CollectId = collectId;
	}
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int clirntId) {
		ClientId = clirntId;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}

}
