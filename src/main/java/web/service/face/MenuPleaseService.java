package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
import web.util.Paging;

public interface MenuPleaseService {

   
   /**
    * 게시글 목록 조회
    * 
    * @param paging - 페이징 정보 객체 
    * @return 게시글 목록
    */
   public List<Board> list(Paging paging);
   
   
   
   /**
    * 게시글 목록을 위한 페이징 객체를 생성한다
    * 
    * 전달파라미터 객체의 curPage - 현재 페이지
    * DB에서 조회한 totalCount - 총 게시글 수
    * 
    * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
    * 
    * @param param - curPage정보를 담고 있는 객체
    * @return 페이징 계산이 완료된 객체
    */
   public Paging getPaging(Paging param);



   /**
    * 게시글 상세보기
    * 
    * @param viewBoard - 상세 조회할 게시글 번호 객체
    * @return 조회된 상세 게시글 정보
    */
   public Board view(Board viewBoard);

   

   /**
    * 게시글 작성 처리 
    * + 첨부 파일을 처리한다
    * (첨부 파일은 여러 개 가능)
    * 
    * @param writeParam - 게시글 정보 객체
    * @param file - 첨부 파일 리스트
    */
   public void write(Board writeParam, List<MultipartFile> file);
   

   
   /**
    * 게시글 번호를 이용하여 업로드된 파일의 정보를 조회한다
    * 
    * @param viewBoard - 조회할 게시글 번호를 가진 객체
    * @return 첨부파일 정보
    */
   public List<FileTb> getAttachFile(Board viewBoard);

   
   /**
    * 파일 번호를 이용하여 업로드된 파일의 정보를 조회한다
    * 
    * @param fileTb - 조회할 파일 번호를 가진 객체
    * @return 파일 정보
    */
   public FileTb getFile(FileTb boardfile);
   

	
   
   /**
    * 게시글 수정 처리
    * + 첨부파일을 처리한다
    *  (첨부파일은 여러 개 가능)
    *  + 삭제할 첨부 파일을 처리한다
    *  
    * @param updateParam - 게시글 정보 객체
    * @param file - 첨부 파일 리스트
    * @param delFileno - 삭제할 첨부파일 번호
    */
   public void update(Board updateParam, List<MultipartFile> file, int[] delFileno);
   
   
   

	/**
	 * 게시글을 삭제한다
	 * +첨부파일을 먼저 삭제해준다
	 * 
	 * @param deleteParam - 삭제하려는 게시글 번호 객체
	 */
	public void delete(Board deleteParam);

	
	
	/**
	 * 따봉했는지 안했는지
	 * 
	 * @param like
	 * @return
	 */
	public boolean isLike(Like like);


	



	/** 
	 * 메뉴목록
	 * 
	 * @param writeParam
	 * @return
	 */
	public List<Board> getMenu(Board writeParam);



	/**
	 * 새로운 댓글을 삽입한다
	 * 
	 * @param comment - 입력된 댓글 정보
	 */
	public void insertComment(Comment comment);



	/**
	 * 추천 상태를 확인하고 추천을 토글(넣고뺴기) 작업
	 * 
	 * @param like - 추천 대상 정보
	 * @return true - 추천함, false - 추천 취소함
	 */
	public boolean like(Like like);



	/**
	 * 총 추천 수를 구한다
	 * 
	 * @param like - 추천수를 파악할 게시글 정보
	 * @return 총 추천 수
	 */
	public int getTotalCntLike(Like like);








}




