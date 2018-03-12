package Message.model;

public class Message {
	
	private int MessageId;
	private int FromManagerId;  //发送方
	private int ToManagerId; //接受方
	private String SendTime;
	private String SendDay;
	private int ReadStatus=1;  //阅读状态，已读，未读
	private int Status;  //重要性，通知OR普通邮件
	private int FromStatus=1; //发送方是否删除
	private int ToStatus=1;  //接收方是否删除
	private String Title;
	private String Discripe;   //消息内容
	private String FileAddress;   //文件地址
	@Override
	public String toString() {
		return "Message [MessageId=" + MessageId + ", FromManagerId="
				+ FromManagerId + ", ToManagerId=" + ToManagerId
				+ ", SendTime=" + SendTime + ", SendDay=" + SendDay
				+ ", ReadStatus=" + ReadStatus + ", Status=" + Status
				+ ", FromStatus=" + FromStatus + ", ToStatus=" + ToStatus
				+ ", Title=" + Title + ", Discripe=" + Discripe
				+ ", FileAddress=" + FileAddress + "]";
	}
	public int getMessageId() {
		return MessageId;
	}
	public void setMessageId(int messageId) {
		MessageId = messageId;
	}
	public int getFromManagerId() {
		return FromManagerId;
	}
	public void setFromManagerId(int fromManagerId) {
		FromManagerId = fromManagerId;
	}
	public int getToManagerId() {
		return ToManagerId;
	}
	public void setToManagerId(int toManagerId) {
		ToManagerId = toManagerId;
	}
	public String getSendTime() {
		return SendTime;
	}
	public void setSendTime(String sendTime) {
		SendTime = sendTime;
	}
	public String getSendDay() {
		return SendDay;
	}
	public void setSendDay(String sendDay) {
		SendDay = sendDay;
	}
	public int getReadStatus() {
		return ReadStatus;
	}
	public void setReadStatus(int readStatus) {
		ReadStatus = readStatus;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public int getFromStatus() {
		return FromStatus;
	}
	public void setFromStatus(int fromStatus) {
		FromStatus = fromStatus;
	}
	public int getToStatus() {
		return ToStatus;
	}
	public void setToStatus(int toStatus) {
		ToStatus = toStatus;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDiscripe() {
		return Discripe;
	}
	public void setDiscripe(String discripe) {
		Discripe = discripe;
	}
	public String getFileAddress() {
		return FileAddress;
	}
	public void setFileAddress(String fileAddress) {
		FileAddress = fileAddress;
	}

}
