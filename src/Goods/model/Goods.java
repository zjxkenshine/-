package Goods.model;

public class Goods {
	public int GoodsId;
	public int TypeId;
	public int ClientId;
	public String GoodsName;
	public String Price;
	public String AddTime;
	public String AddDay;
	public String Discripe;
	public String Picture;
	public String SellStatus;          //上下架
	public String Location;
	public String Status="1";         //是否售出
	public int Number;
	public int ColletNum;
	@Override
	public String toString() {
		return "Goods [GoodsId=" + GoodsId + ", TypeId=" + TypeId
				+ ", ClientId=" + ClientId + ", GoodsName=" + GoodsName
				+ ", Price=" + Price + ", AddTime=" + AddTime + ", AddDay="
				+ AddDay + ", Discripe=" + Discripe + ", Picture=" + Picture
				+ ", SellStatus=" + SellStatus + ", Location=" + Location
				+ ", Status=" + Status + ", Number=" + Number + ", ColletNum="
				+ ColletNum + "]";
	}
	public int getGoodsId() {
		return GoodsId;
	}
	public void setGoodsId(int goodsId) {
		GoodsId = goodsId;
	}
	public int getTypeId() {
		return TypeId;
	}
	public void setTypeId(int typeId) {
		TypeId = typeId;
	}
	public int getClientId() {
		return ClientId;
	}
	public void setClientId(int clientId) {
		ClientId = clientId;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getAddTime() {
		return AddTime;
	}
	public void setAddTime(String addTime) {
		AddTime = addTime;
	}
	public String getAddDay() {
		return AddDay;
	}
	public void setAddDay(String addDay) {
		AddDay = addDay;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	public String getPicture() {
		return Picture;
	}
	public void setPicture(String picture) {
		Picture = picture;
	}
	public String getSellStatus() {
		return SellStatus;
	}
	public void setSellStatus(String sellStatus) {
		SellStatus = sellStatus;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public int getNumber() {
		return Number;
	}
	public void setNumber(int number) {
		Number = number;
	}
	public int getColletNum() {
		return ColletNum;
	}
	public void setColletNum(int colletNum) {
		ColletNum = colletNum;
	}
	
	
}
