package Order.model;

public class OrderStatus {
	
	private int OrderStatusId;
	private String OrderStatusName;
	public int getOrderStatusId() {
		return OrderStatusId;
	}
	public void setOrderStatusId(int orderStatusId) {
		OrderStatusId = orderStatusId;
	}
	public String getOrderStatusName() {
		return OrderStatusName;
	}
	public void setOrderStatusName(String orderStatusName) {
		OrderStatusName = orderStatusName;
	}
	@Override
	public String toString() {
		return "OrderStatus [OrderStatusId=" + OrderStatusId
				+ ", OrderStatusName=" + OrderStatusName + "]";
	}
	

}
