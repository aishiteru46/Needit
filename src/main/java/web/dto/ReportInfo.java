package web.dto;

public class ReportInfo {
	
	private String reportType;
	private String reportName;

	public ReportInfo() {}

	public ReportInfo(String reportType, String reportName) {
		super();
		this.reportType = reportType;
		this.reportName = reportName;
	}

	@Override
	public String toString() {
		return "ReportInfo [reportType=" + reportType + ", reportName=" + reportName + "]";
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	
}
