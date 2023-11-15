package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Booking;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
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
	public List<Map<String, Object>> selectAll(Paging paging);
	
	/**
	 * 상세조회시 필요한 boardno 가져오기
	 * 
	 * @param board boardno
	 * @return 해당 게시글 boardno 
	 */
	public Board selectByBoardNo(Board board);
	
	/**
	 * 조회수 조회
	 * 
	 * @param boardNo 전달 파라미터
	 */
	public void updateHit(int boardNo);
	
	/**
	 * 사용자가 입력한 글작성 정보를 DB에 insert
	 * 
	 * @param writerContent 사용자가 작성한 데이터
	 */
	public void insertBoard(Board writerContent);
	
	/**
	 * 파일 업로드
	 * 
	 * @param fileTb 사용자가 업로드할 파일
	 */
	public void insertFile(FileTb fileTb);
	
	/**
	 * 메뉴 번호
	 * 
	 * @param writerContent 메뉴번호
	 * @return 메뉴번호
	 */
	public List<Board> selectByMenu(Board writerContent);
	
	/**
	 * 사용자가 업로드한 이미지
	 * 
	 * @param file 이미지
	 * @return file 이미지
	 */
	public List<FileTb> selectFileImg(FileTb file);
	
	/**
	 * 게시판에 새로운 정보 삽입
	 * 
	 * @param updateParam 사용자가 입력한 정보
	 */
	public void updateBoard(Board updateParam);

	public List<FileTb> selectBoardfileByBoardNo(Board updateParam);

	public void deleteFiles(int[] delFileno);
	
	/**
	 * 첨부파일 삭제
	 * 
	 * @param deleteParam 파일 삭제
	 */
	public void deleteFileByBoardNo(Board deleteParam);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param deleteParam 게시글 삭제
	 */
	public void deleteByBoardNo(Board deleteParam);
	
	/**
	 * 추천수가 있는지 없는지 확인
	 * 
	 * @param like 추천수
	 * @return 추천수가 있으면 1 없으면 0 
	 */
	public int selectByLike(Like like);
	
	/**
	 * 총 추천수 조회
	 * 
	 * @param like 조회된 추천수
	 * @return 추천수
	 */
	public int selectLikeByBoardNo(Like like);
	
	/**
	 * 추천이있으면 삭제
	 * 
	 * @param like 추천
	 */
	public void deleteLike(Like like);
	
	/**
	 * 추천이 있으면 insert
	 * 
	 * @param like 추천
	 */
	public void insertLike(Like like);
	
	/**
	 * 댓글 입력
	 * 
	 * @param comment 사용자가 입력한 댓글
	 */
	public void cmtWrite(Comment comment);

	/**
	 * 댓글 목록
	 * 
	 * @param comment 댓글 리스트
	 * @return 댓글 리스트
	 */
	public List<Comment> cmtList(Comment comment);
	
	/**
	 * 댓글 삭제
	 * 
	 * @param commentDelete
	 */
	public void deleteComment(Comment commentDelete);
	
	
	
	/**
	 * 예약 DB에 넣기
	 * 
	 * @param book 예약 정보
	 */
	public void makeBook(Booking book);
	
	/**
	 * 예약 정보 확인
	 * 
	 * @param book 예약 정보
	 * @return false 예약 가능 true 예약 불가능
	 */
	public int checkBook(Booking book);
	

}
