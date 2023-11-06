package web.dto;

import java.util.Date;

public class AccessLog {
	
	private String id;
	private Date accessDate;
	
	public AccessLog() {}

	public AccessLog(String id, Date accessDate) {
		super();
		this.id = id;
		this.accessDate = accessDate;
	}

	@Override
	public String toString() {
		return "AccessLog [id=" + id + ", accessDate=" + accessDate + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getAccessDate() {
		return accessDate;
	}

	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
	}

	
}
