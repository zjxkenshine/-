package Other.model;

public class Province {
	
	private int ProId;
	private String ProName;
	public int getProId() {
		return ProId;
	}
	public void setProId(int proId) {
		ProId = proId;
	}
	public String getProName() {
		return ProName;
	}
	public void setProName(String proName) {
		ProName = proName;
	}
	@Override
	public String toString() {
		return "Province [ProId=" + ProId + ", ProName=" + ProName + "]";
	}
	
	

}
