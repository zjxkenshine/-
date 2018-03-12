package Client.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Client implements Serializable{
	
	private int ClientId;
	private String ClientName;
	private String RealName;
	private String Idcard;
	private String Tel;
	private String E_mail;
	private String Picture;
	private String Province;
	private String City;
	private String School;
	private String ClientCode;
	private String UserStatus;
	private String Status;
	private String RegisterTime;
	private String RegisterDay;
	private String UpdateTime;
	private String PassWord;
	private int TruhCode;
	
	
	@Override
	public String toString() {
		return "Client [ClientId=" + ClientId + ", ClientName=" + ClientName
				+ ", RealName=" + RealName + ", Idcard=" + Idcard + ", Tel="
				+ Tel + ", E_mail=" + E_mail + ", Picture=" + Picture
				+ ", Province=" + Province + ", City=" + City + ", School="
				+ School + ", ClientCode=" + ClientCode + ", UserStatus="
				+ UserStatus + ", Status=" + Status + ", RegisterTime="
				+ RegisterTime + ", RegisterDay=" + RegisterDay
				+ ", UpdateTime=" + UpdateTime + ", PassWord=" + PassWord
				+ ", TruhCode=" + TruhCode + "]";
	}
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String passWord) {
		PassWord = passWord;
	}
	public int getTruhCode() {
		return TruhCode;
	}
	public void setTruhCode(int truhCode) {
		TruhCode = truhCode;
	}
	public String getUpdateTime() {
		return UpdateTime;
	}
	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int clientId) {
		ClientId = clientId;
	}
	public String getClientName() {
		return ClientName;
	}
	public void setClientName(String clientName) {
		ClientName = clientName;
	}
	public String getRealName() {
		return RealName;
	}
	public void setRealName(String realName) {
		RealName = realName;
	}
	public String getIdcard() {
		return Idcard;
	}
	public void setIdcard(String idcard) {
		Idcard = idcard;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}
	public String getE_mail() {
		return E_mail;
	}
	public void setE_mail(String e_mail) {
		E_mail = e_mail;
	}
	public String getPicture() {
		return Picture;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}
	public String getClientCode() {
		return ClientCode;
	}
	public void setClientCode(String clientCode) {
		ClientCode = clientCode;
	}
	public String getUserStatus() {
		return UserStatus;
	}
	public void setUserStatus(String userStatus) {
		UserStatus = userStatus;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getRegisterTime() {
		return RegisterTime;
	}
	public void setRegisterTime(String registerTime) {
		RegisterTime = registerTime;
	}
	public String getRegisterDay() {
		return RegisterDay;
	}
	public void setRegisterDay(String registerDay) {
		RegisterDay = registerDay;
	}

}
