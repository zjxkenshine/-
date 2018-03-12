package Goods.model;

public class GoodsType {
	private int TypeId;
	private String TypeName;
	public int getTypeId() {
		return TypeId;
	}
	public void setTypeId(int typeId) {
		TypeId = typeId;
	}
	public String getTypeName() {
		return TypeName;
	}
	public void setTypeName(String string) {
		TypeName = string;
	}
	@Override
	public String toString() {
		return "GoodsType [TypeId=" + TypeId + ", TypeName=" + TypeName + "]";
	}
	
	

}
