package Order.model;

public class Order {
	
	private int OrderId;
	private int GoodsId;
	private String GoodsName;
	private int SaleClientId;
	private int BuyClientId;
	private String Status;
	private String ExpressCode;
	private String AddTime;
	private String FinishTime;
	private String Discripe;
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getGoodsId() {
		return GoodsId;
	}
	public void setGoodsId(int goodsId) {
		GoodsId = goodsId;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public int getSaleClientId() {
		return SaleClientId;
	}
	public void setSaleClientId(int saleClientId) {
		SaleClientId = saleClientId;
	}
	public int getBuyClientId() {
		return BuyClientId;
	}
	public void setBuyClientId(int buyClientId) {
		BuyClientId = buyClientId;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getExpressCode() {
		return ExpressCode;
	}
	public void setExpressCode(String expressCode) {
		ExpressCode = expressCode;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
	public String getFinishTime() {
		return FinishTime;
	}
	public void setFinishTime(String finishTime) {
		FinishTime = finishTime;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	@Override
	public String toString() {
		return "Order [OrderId=" + OrderId + ", GoodsId=" + GoodsId
				+ ", GoodsName=" + GoodsName + ", SaleClientId=" + SaleClientId
				+ ", BuyClientId=" + BuyClientId + ", Status=" + Status
				+ ", ExpressCode=" + ExpressCode + ", AddTime=" + AddTime
				+ ", FinishTime=" + FinishTime + ", Discripe=" + Discripe + "]";
	}
	
	

}
