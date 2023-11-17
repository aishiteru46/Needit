package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Booking;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
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
	 * 나눔 게시판 조회
	 * 
	 * @param paging 페이지수로 리스트 조회
	 * @return 나눔게시판 조회
	 */
	public List<Map<String, Object>> selectBoardStatus(Paging paging,Board board);
	
	/**
	 * 나눔 게시판 상세조회
	 * 
	 * @param board 게시글 번호
	 * @return boardno 에 해당 하는 게시글 상세조회
	 */
	public Board view(Board board);
	
	/**
	 * 게시글 작성
	 * 
	 * @param writerContent DB에 insert할 데이터
	 * @param upFile 
	 */
	public void write(Board writerContent, List<MultipartFile> upFile);
	
	/**
	 * 있던 파일 정보 조회
	 * 
	 * @param updateParam 파일 정보
	 * @return 파일 정보
	 */
	public List<FileTb> getAttachFile(Board updateParam);
	
	/**
	 * 메뉴 번호 가져오기 
	 * 
	 * @param writerContent 메뉴 번호
	 * @return 메뉴 번호
	 */
	public List<Board> menu(Board writerContent);
	
	/**
	 * 사용자가 업로드한 파일 가져오기
	 * 
	 * @param file 파일 정보
	 * @return 
	 */
	public List<FileTb> getImg(FileTb file);
	
	
	/**
	 * 사용자가 새로 작성한 정보
	 * 
	 * @param updateParam 파일을 제외한 정보
	 * @param file 파일
	 * @param delFileno 
	 */
	public void updateBoard(Board updateParam, List<MultipartFile> file, int[] delFileno);
	
	/**
	 * 사용자가 작성 한 글 삭제
	 * 
	 * @param deleteParam 삭제
	 */
	public void delete(Board deleteParam);
	
	/**
	 * 추천이 있는지 없는 지 조회
	 * 
	 * @param like 추천수
	 * @return 추천이 있으면 true 없으면 false
	 */
	public boolean checkLike(Like like);
	
	/**
	 * 추천수 조회
	 * 
	 * @param like 추천수
	 * @return 추천수
	 */
	public int selectLikeCnt(Like like);
	
	/**
	 * 댓글 작성
	 * 
	 * @param comment 사용자가 입력한 댓글
	 */
	public void commentinsert(Comment comment);

	/**
	 * 댓글 리스트 
	 * 
	 * @param comment 모든 댓글 보여줌
	 * @return 댓글 리스트
	 */
	public List<Comment> list(Comment comment);
	
	/**
	 * 댓글 삭제
	 * 
	 * @param commentDelete
	 */
	public void commentdelete(Comment commentDelete);
	
	
	/**
	 * 예약 정보 확인
	 * 
	 * @param book 예약 정보
	 * @return false 예약 가능 true 예약 불가
	 */
	public boolean checkBook(Booking book);

	public boolean checkBooking(Booking book);

	public void bookStatus();
	
	
	


}
