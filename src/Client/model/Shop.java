package Client.model;

public class Shop {
	
	private int ShopId;
	private int GoodsId;
	private int ClientId;
	private String AddTime;
	@Override
	public String toString() {
		return "Shop [ShopId=" + ShopId + ", GoodsId=" + GoodsId
				+ ", ClientId=" + ClientId + ", AddTime=" + AddTime + "]";
	}
	public int getShopId() {
		return ShopId;
	}
	public void setShopId(int shopId) {
		ShopId = shopId;
	}
	public int getGoodsId() {
		return GoodsId;
	}
	public void setGoodsId(int goodsId) {
		GoodsId = goodsId;
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
