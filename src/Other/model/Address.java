package Other.model;

public class Address {
	
	private int AddressId;
	private int ClientId;
	private String Address;
	private String Name;
	public int getAddressId() {
		return AddressId;
	}
	public void setAddressId(int addressId) {
		AddressId = addressId;
	}
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int clientId) {
		ClientId = clientId;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	@Override
	public String toString() {
		return "Address [AddressId=" + AddressId + ", ClientId=" + ClientId
				+ ", Address=" + Address + ", Name=" + Name + "]";
	}
	

}
