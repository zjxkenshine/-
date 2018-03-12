package Query.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class JobQuery implements Serializable{
	
	private int QueryId;
	private String QueryString;
	private int ClientId;
	private String AddTime;
	@Override
	public String toString() {
		return "JobQuery [QueryId=" + QueryId + ", QueryString="
				+ QueryString + ", ClientId=" + ClientId + ", AddTime="
				+ AddTime + "]";
	}
	public int getQueryId() {
		return QueryId;
	}
	public void setQueryId(int queryId) {
		QueryId = queryId;
	}
	public String getQueryString() {
		return QueryString;
	}
	public void setQueryString(String queryString) {
		QueryString = queryString;
	}
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int clientId) {
		ClientId = clientId;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
}
