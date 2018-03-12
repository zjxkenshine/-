package Other.model;

public class School {
	
	private int SchoolId;
	private String SchoolName;
	public int getSchoolId() {
		return SchoolId;
	}
	public void setSchoolId(int schoolId) {
		SchoolId = schoolId;
	}
	public String getSchoolName() {
		return SchoolName;
	}
	public void setSchoolName(String string) {
		SchoolName = string;
	}
	@Override
	public String toString() {
		return "School [SchoolId=" + SchoolId + ", SchoolName=" + SchoolName
				+ "]";
	}
	
	

}
