package web.dto;

import java.util.Date;

public class TermsAgree {
	
	private String id;
	private String agreeChk;
	private Date agreeDate;

	public TermsAgree() {}

	public TermsAgree(String id, String agreeChk, Date agreeDate) {
		super();
		this.id = id;
		this.agreeChk = agreeChk;
		this.agreeDate = agreeDate;
	}

	@Override
	public String toString() {
		return "TermsAgree [id=" + id + ", agreeChk=" + agreeChk + ", agreeDate=" + agreeDate + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAgreeChk() {
		return agreeChk;
	}

	public void setAgreeChk(String agreeChk) {
		this.agreeChk = agreeChk;
	}

	public Date getAgreeDate() {
		return agreeDate;
	}

	public void setAgreeDate(Date agreeDate) {
		this.agreeDate = agreeDate;
	}
	
}
