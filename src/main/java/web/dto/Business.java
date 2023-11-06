package web.dto;

public class Business {
	
	private int businessNo;
	private String businessName;
	private String businessPhone;
	private String businessAddr;
	private String businessUrl;

	public Business() {}

	public Business(int businessNo, String businessName, String businessPhone, String businessAddr,
			String businessUrl) {
		super();
		this.businessNo = businessNo;
		this.businessName = businessName;
		this.businessPhone = businessPhone;
		this.businessAddr = businessAddr;
		this.businessUrl = businessUrl;
	}

	@Override
	public String toString() {
		return "Business [businessNo=" + businessNo + ", businessName=" + businessName + ", businessPhone="
				+ businessPhone + ", businessAddr=" + businessAddr + ", businessUrl=" + businessUrl + "]";
	}

	public int getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(int businessNo) {
		this.businessNo = businessNo;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getBusinessPhone() {
		return businessPhone;
	}

	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}

	public String getBusinessAddr() {
		return businessAddr;
	}

	public void setBusinessAddr(String businessAddr) {
		this.businessAddr = businessAddr;
	}

	public String getBusinessUrl() {
		return businessUrl;
	}

	public void setBusinessUrl(String businessUrl) {
		this.businessUrl = businessUrl;
	}
	
	
}
