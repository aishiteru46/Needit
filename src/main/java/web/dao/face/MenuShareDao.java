package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuShareDao {
	
	/**
	 * 페이지수 계산
	 * 
	 * @param param 페이지수 
	 * @return 계산된 페이지 수 
	 */
	public int selectCntAll(Paging param);
	
	/**
	 * 나눔 게시판 전체 조회
	 * @param cate 
	 * 
	 * @return 나눔 게시판 전체 조회 결과
	 */
	public List<Board> selectShareList(Board board);
	

}
