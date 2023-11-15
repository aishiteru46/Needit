package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;
import web.util.Paging;

public interface MainDao {

	/**
	 * DB에서 storedName을 받아와 main.jsp에 썸네일로 띄운다
	 * 
	 * @return 사진 저장 배열
	 */
	public List<Banner> getStoredName();

	/**
	 * 메인화면 최신 대여해요 게시글 
	 * @return 사진, 글 제목
	 */
	public List<Map<String, Object>> selectRecentRentBoard();

	/**
	 * 메인화면 최신 나눔해요 게시글 
	 * @return 사진, 글 제목
	 */
	public List<Map<String, Object>> selectRecentShareBoard();

	/**
	 * 페이지수 계산
	 * 
	 * @param - param 페이지수 
	 * @return 계산된 페이지 수 
	 */
	public int selectCntAll(Paging param);

}
