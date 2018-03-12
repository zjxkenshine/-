package Page.model;

public class Page {
	private int PageId;
	private String PageSize="5";
	private String PageName;    //表名
	private int ManagerId;		//
	private int NowPage=1;
	
	
	
	@Override
	public String toString() {
		return "Page [PageId=" + PageId + ", PageSize=" + PageSize
				+ ", PageName=" + PageName + ", ManagerId=" + ManagerId
				+ ", NowPage=" + NowPage + "]";
	}
	public int getNowPage() {
		return NowPage;
	}
	public void setNowPage(int nowPage) {
		NowPage = nowPage;
	}
	public int getPageId() {
		return PageId;
	}
	public void setPageId(int pageId) {
		PageId = pageId;
	}
	public String getPageSize() {
		return PageSize;
	}
	public void setPageSize(String pageSize) {
		PageSize = pageSize;
	}
	public String getPageName() {
		return PageName;
	}
	public void setPageName(String pageName) {
		PageName = pageName;
	}
	public int getManagerId() {
		return ManagerId;
	}
	public void setManagerId(int managerId) {
		ManagerId = managerId;
	}
}
