package Message.model;

public class WebMessage {
	public int WebMessageId;
	public String WebMessageName;
	public String WebMessageValue;
	@Override
	public String toString() {
		return "WebMessage [WebMessageId=" + WebMessageId + ", WebMessageName="
				+ WebMessageName + ", WebMessageValue=" + WebMessageValue + "]";
	}
	public int getWebMessageId() {
		return WebMessageId;
	}
	public void setWebMessageId(int webMessageId) {
		WebMessageId = webMessageId;
	}
	public String getWebMessageName() {
		return WebMessageName;
	}
	public void setWebMessageName(String webMessageName) {
		WebMessageName = webMessageName;
	}
	public String getWebMessageValue() {
		return WebMessageValue;
	}
	public void setWebMessageValue(String webMessageValue) {
		WebMessageValue = webMessageValue;
	}
	

}
