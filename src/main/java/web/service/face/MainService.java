package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;

public interface MainService {

	/**
	 * bannerNo를 통해 storedName을 받아와 썸네일의 띄운다 
	 * 
	 * @return - 사진 저장 배열
	 */
	public List<Banner> getBannerNo();

	/**
	 * 나눔해요 게시판 조회
	 * 
	 * @param board - 게시글 번호
	 * @return - 나눔게시판 배열
	 */
	public List<Map<String, Object>> selectBoardStatus(Board board);

	/**
	 * 메인화면에 사진 썸네일 불러오기  
	 * @param file - 사진 객체
	 * @return - 나눔게시판 배열
	 */
	public List<FileTb> getImg(FileTb file);

}
