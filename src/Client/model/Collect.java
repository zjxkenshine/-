package Client.model;

public class Collect {
	
	private int CollectId;
	private int ClientId;
	private int GoodsId;
	private String CollectTime;
	public int getCollectId() {
		return CollectId;
	}
	public void setCollectId(int collectId) {
		CollectId = collectId;
	}
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int clientId) {
		ClientId = clientId;
	}
	public int getGoodsId() {
		return GoodsId;
	}
	public void setGoodsId(int goodsId) {
		GoodsId = goodsId;
	}
	public String getCollectTime() {
		return CollectTime;
	}
	public void setCollectTime(String collectTime) {
		CollectTime = collectTime;
	}
	@Override
	public String toString() {
		return "Collect [CollectId=" + CollectId + ", ClientId=" + ClientId
				+ ", GoodsId=" + GoodsId + ", CollectTime=" + CollectTime + "]";
	}
	
	
}
