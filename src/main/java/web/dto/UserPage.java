package web.dto;

public class UserPage {
	
	private String id;
	private int fileNo;
	private String grade;
	private int businessNo;
	private String intro;

	public UserPage() {}

	public UserPage(String id, int fileNo, String grade, int businessNo, String intro) {
		super();
		this.id = id;
		this.fileNo = fileNo;
		this.grade = grade;
		this.businessNo = businessNo;
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "UserPage [id=" + id + ", fileNo=" + fileNo + ", grade=" + grade + ", businessNo=" + businessNo
				+ ", intro=" + intro + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(int businessNo) {
		this.businessNo = businessNo;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}
