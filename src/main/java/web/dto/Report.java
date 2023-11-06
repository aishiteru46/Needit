package web.dto;

import java.util.Date;

public class Report {
	
	private int reportNo;
	private String reportChk;
	private Date reportDate;
	private String reportType;
	private String reportId;
	private int boardNo;
	private int cmtNo;

	public Report() {}

	public Report(int reportNo, String reportChk, Date reportDate, String reportType, String reportId, int boardNo,
			int cmtNo) {
		super();
		this.reportNo = reportNo;
		this.reportChk = reportChk;
		this.reportDate = reportDate;
		this.reportType = reportType;
		this.reportId = reportId;
		this.boardNo = boardNo;
		this.cmtNo = cmtNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportChk=" + reportChk + ", reportType=" + reportType
				+ ", reportId=" + reportId + ", boardNo=" + boardNo + ", cmtNo=" + cmtNo + "]";
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportChk() {
		return reportChk;
	}

	public void setReportChk(String reportChk) {
		this.reportChk = reportChk;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	
	
}
