package web.service.face;

import web.dto.Report;

public interface ReportService {
	
	/**
	 * 신고 정보 insert
	 * 
	 * @param report 신고 정보
	 * @return true false
	 */
	boolean insertReport(Report report);

}
