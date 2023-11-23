package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;
import web.util.Paging;

public interface MainService {

	/**
	 * bannerNo를 통해 storedName을 받아와 썸네일의 띄운다 
	 * 
	 * @return 사진 저장 배열
	 */
	public List<Banner> getBannerNo();

	/**
	 * 메인화면 최신 대여해요 게시글 
	 * 
	 * @return 사진, 글 제목
	 */
	public List<Map<String, Object>> getBoardRentInfo();

	/**
	 * 메인화면 최신 나눔해요 게시글
	 *  
	 * @return 사진, 글 제목
	 */
	public List<Map<String, Object>> getBoardShareInfo();

	/**
	 * 검색 페이징 계산
	 * 
	 * @param - param 페이지 수
	 * @return 페이지
	 */
	public Paging getPaging(Paging param);

	/**
	 * 메인화면 최신 업체 게시글 
	 * 
	 * @return 사진, 글 제목
	 */
	public List<Map<String, Object>> getBusinessInfo();

	/**
	 * 메인화면 커뮤니티 인기 게시글
	 * + 추천수 많은 순으로 2개 출력
	 *  
	 * @return 글 제목, 글 내용
	 */
	public List<Map<String, Object>> getCommuByLike();

	/**
	 * 검색용
	 * @param param - 페이징
	 * @param query - 검색값
	 * @return 페이징 계산
	 */
	public List<Map<String, Object>> list(Paging paging);


}
