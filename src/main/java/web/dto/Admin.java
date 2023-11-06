package web.dto;

public class Admin {
	
	private String adminId;
	private String adminPw;

	public Admin() {}

	public Admin(String adminId, String adminPw) {
		super();
		this.adminId = adminId;
		this.adminPw = adminPw;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPw=" + adminPw + "]";
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	
	
}
