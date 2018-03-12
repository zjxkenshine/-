package Query.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class GoodsQuery implements Serializable{
	
	private int QueryId;
	private int GoodsTypeId;
	private int Client;
	private int QueryNum;
	public int getQueryId() {
		return QueryId;
	}
	public void setQueryId(int queryId) {
		QueryId = queryId;
	}
	public int getGoodsTypeId() {
		return GoodsTypeId;
	}
	public void setGoodsTypeId(int goodsTypeId) {
		GoodsTypeId = goodsTypeId;
	}
	public int getClient() {
		return Client;
	}
	public void setClient(int client) {
		Client = client;
	}
	public int getQueryNum() {
		return QueryNum;
	}
	public void setQueryNum(int queryNum) {
		QueryNum = queryNum;
	}
	@Override
	public String toString() {
		return "GoodsQuery [QueryId=" + QueryId + ", GoodsTypeId="
				+ GoodsTypeId + ", Client=" + Client + ", QueryNum=" + QueryNum
				+ "]";
	}
	
	

}
