package Message.model;

public class Notice {
	
	private int NoticeId;
	private String Dscripe;
	public int getNoticeId() {
		return NoticeId;
	}
	public void setNoticeId(int noticeId) {
		NoticeId = noticeId;
	}
	public String getDscripe() {
		return Dscripe;
	}
	public void setDscripe(String dscripe) {
		Dscripe = dscripe;
	}
	@Override
	public String toString() {
		return "Notice [NoticeId=" + NoticeId + ", Dscripe=" + Dscripe + "]";
	}
	
	

}
