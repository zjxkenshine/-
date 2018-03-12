package Message.model;

public class WebPic {
	private int WebPicId;
	private String WebPicture;
	public int getWebPicId() {
		return WebPicId;
	}
	public void setWebPicId(int webPicId) {
		WebPicId = webPicId;
	}
	@Override
	public String toString() {
		return "WebPic [WebPicId=" + WebPicId + ", WebPicture=" + WebPicture
				+ "]";
	}
	public String getWebPicture() {
		return WebPicture;
	}
	public void setWebPicture(String webPicture) {
		WebPicture = webPicture;
	}
	
	

}
