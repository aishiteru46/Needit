package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
import web.dto.Rent;
import web.util.Paging;

public interface MenuRentDao {

	/**
	 * 
	 * 
	 * @param param
	 * @return
	 */
	public int selectCntAll(Paging param);

	
	/**
	 * 
	 * 
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> selectAll(Paging paging);

	/**
	 * 
	 * 
	 * @param board
	 */
	public void updateHit(Board board);

	/**
	 * 
	 * 
	 * @param board
	 * @return
	 */
	public Board selectByBoardNo(Board board);

	/**
	 * 
	 * 
	 * @param writeParam
	 */
	public void insertBoard(Board writeParam);

	/**
	 * 
	 * 
	 * @param fileTb
	 */
	public void insertFile(FileTb fileTb);

	/**
	 * 
	 * 
	 * @param board
	 * @return
	 */
	public List<FileTb> selectFileByBoardNo(Board board);

	/**
	 * 
	 * 
	 * @param fileTb
	 * @return
	 */
	public FileTb selectFileByFileNo(FileTb fileTb);

	/**
	 * 사용자가 해당 게시글을 추천한 적이 있는지 조회	
	 * 
	 * @param like - 사용자와 게시글 정보를 가지고 있는 객체
	 * @return 1 - 추천한 적 있음, 0 - 추천한 적 없음
	 */
	public int selectCntLike(Like like);
	
	/**
	 * 추천상태 넣기
	 * 
	 * @param recommend - 추천 정보 객체
	 */
	public void insertLike(Like like);

	/**
	 * 추천상태 지우기
	 * 
	 * @param recommend - 추천 정보 객체
	 */
	public void deleteLike(Like like);

	/**
	 * 게시글의 전체 추천 수 조회
	 * 
	 * @param recommend - 추천 수를 조회할 게시글 정보
	 * @return 전체 추천 수
	 */
	public int selectTotalCntLike(Like like);

	/**
	 * 
	 * 
	 * @param commentParam
	 */
	public void insertComment(Comment commentParam);

	/**
	 * 
	 * 
	 * @param commentParam
	 * @return
	 */
	public List<Comment> selectAllComment(Comment commentParam);

	/**
	 * 
	 * 
	 * @param commentDelete
	 */
	public void deleteComment(Comment commentDelete);

	/**
	 * 
	 * 
	 * @param rentParam
	 * @return - 1-대여, 0-대여실패
	 */
	public void makeRent(Rent rentParam);





}
