package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;
import web.util.Paging;

public interface AdminDao {

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param bannerParam - 삽입하 게시글 정보
	 */
	public void insert(Banner bannerParam);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param banner - 삽입할 첨부파일 정보
	 */
	public void insertBanner(Banner banner);

	/**
	 * DB에서 storedName을 받아와 main.jsp에 썸네일로 띄운다
	 * @return 사진 저장 배열
	 */
	public List<Banner> getStoredName();

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param writeParamNotice - 삽입할 게시글 정보
	 */
	public void insertBoard(Board writeParamNotice);

	
	public void insertFileNotice(FileTb fileTb);
	
	
	/**
	 * 공지 게시글 목록 조회
	 * 
	 * @return 게시글 목록
	 */
	public List<Board> selectAll();

	/**
	 * 전체 게시글 수를 조회한다
	 *  + 검색어 추가
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();
	
}
