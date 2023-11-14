package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;

public interface MainDao {

	/**
	 * DB에서 storedName을 받아와 main.jsp에 썸네일로 띄운다
	 * 
	 * @return 사진 저장 배열
	 */
	public List<Banner> getStoredName();

	/**
	 * 나눔해요 게시판 조회
	 * 
	 * @param board - 게시글 번호
	 * @return - 나눔게시판 게시글 배열
	 */
	public List<Board> selectAll(Board board);

	/**
	 * 사용자가 업로드한 이미지
	 * 
	 * @param file - 이미지
	 * @return - 이미지 배열
	 */
	public List<FileTb> selectFileImg(FileTb file);

}
