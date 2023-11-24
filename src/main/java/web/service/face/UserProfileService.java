package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Basket;
import web.dto.Board;
import web.dto.Comment;
import web.dto.Like;
import web.dto.Rent;
import web.dto.User;
import web.dto.UserFile;
import web.util.Paging;

public interface UserProfileService {

	
	/**
	 * 회원정보 업데이트
	 * 
	 * @param user
	 */
	public void updateInfo(User user);

	/**
	 * 회원탈퇴
	 * 
	 * @param userId
	 */
	public void userDelete(String userId);
	
	/**
	 * 페이징 계산
	 * 
	 * @param param 페이징 계산
	 * @return 페이징
	 */
	public Paging getPaging(Paging param);

	
	/**
	 * 예약 목록
	 * @param paging 
	 * 
	 * @param book 예약 정보
	 * @return 
	 */
	public List<Map<String,Object>> myRentList(Paging param, User user);
	
	/**
	 * 내가 예약한 리스트
	 * 
	 * @param user 정보
	 * @return 리스트
	 */
	public List<Map<String, Object>> rentList(User user);

	/*
	 * 회원프로필사진
	 * 
	 */
	public void imgUpdate(MultipartFile file, String userId);

	
	/**
	 * 뷰에 보여줄 회원프로필사진
	 * 
	 * @param userId
	 * @return
	 */
	public UserFile imgSelect(String userId);

	
	/**
	 * 자기소개 수정
	 * 
	 * @param userPage
	 */
	public void introduceUpdate(User user);
	
	/**
	 * 회원등급을 위한 추천수 조회
	 * 
	 * @param board
	 * @return
	 */
	public int cntLike(User user);
	
	/**
	 * 추천수에 따른 회원등급
	 * 
	 * @param likeCount 추천수
	 * @param grade 
	 * @return 
	 */
	public void updateGrade(int likeCount, User userGrade);
	
	/**
	 * 유저 등급 조회
	 * 
	 * @param userPage 유저 정보
	 * @return
	 */
	public User selectUserGrade(User user);
	
	/**
	 * 업데이트된 유저 등급 조회
	 * 
	 * @param user
	 * @return 등급
	 */
	public User gradeResult(User user);
	
	/**
	 * 프로필사진 삭제
	 * 
	 * @param userPage
	 */
	public void imgDelete(UserFile userFile);
	
	/**
	 * rentStatus 상태 변경 
	 * 
	 * @param rent rent_no, board_no
	 * @return 
	 */
	public boolean updateRentStatus(Rent rent);
	
	/**
	 * 승인 취소 시 예약상태 0 으로 변경
	 * 
	 * @param rent rent_no , board_no
	 * @return true false
	 */
	public boolean updateRentCancel(Rent rent);
	
	/**
	 * 
	 * @param user 
	 * @return
	 */
	public User userAllSelect(User user);
	
	/**
	 * 예약 상태 확인 confirm
	 * @param rent rent_status
	 * @return true false
	 */
	public boolean checkConfirm(Rent rent);
	
	/**
	 * 예약 상태 확인 cancel
	 * 
	 * @param rent rent_status
	 * @return true false
	 */
	public boolean checkCancel(Rent rent);
	
	

	
	/**
	 * 로그인세션아이디로 글찾기
	 * 
	 * @param board
	 * @return
	 */
	public List<Board> boardSelectById(Board board);

	/**
	 * 로그인세션아이디로 댓글찾기 
	 * 
	 * @param comment
	 * @return
	 */
	public List<Map<String, Object>> commentSelectById(Comment comment);
	
	/**
	 * 내 찜 목록 보여주기
	 * 
	 * @param basket 찜 정보
	 * @return 찜 목록
	 */
	public List<Map<Board, Object>> selectBasketList(Basket basket);

	

	

	

	
	
	
	
	

}
