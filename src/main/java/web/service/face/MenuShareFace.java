package web.service.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface MenuShareFace {

	/**
	 * 페이징 계산
	 * 
	 * @param param 페이지 수
	 * @return 페이지
	 */
	public Paging getPaging(Paging param);
	
	/**
	 * 나눔 게시판 전체 조회
	 * 
	 * @param paging 페이지수로 리스트 조회
	 * @return 나눔게시판 전체 조회
	 */
	public List<Board> selectBoardStatus(Paging paging,Board board);
	


}
