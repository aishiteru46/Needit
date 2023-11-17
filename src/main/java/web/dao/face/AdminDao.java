package web.dao.face;

import java.util.List;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;

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
	 * @param writeParam - 삽입할 게시글 정보
	 */
	public void insertBoard(Board writeParam);

	
	public void insertFile(FileTb fileTb);

	
	
}
