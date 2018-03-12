package Other.model;

public class City {
	private int CityId;
	private String CityName;
	public int getCityId() {
		return CityId;
	}
	public void setCityId(int cityId) {
		CityId = cityId;
	}
	public String getCityName() {
		return CityName;
	}
	public void setCityName(String cityName) {
		CityName = cityName;
	}
	@Override
	public String toString() {
		return "City [CityId=" + CityId + ", CityName=" + CityName + "]";
	}
	
	

}
