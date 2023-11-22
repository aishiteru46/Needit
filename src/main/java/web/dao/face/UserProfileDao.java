package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Comment;
import web.dto.Like;
import web.dto.Rent;
import web.dto.User;
import web.dto.UserFile;

public interface UserProfileDao {

	
	/**
	 * 회원정보 업데이트
	 * 
	 * @param user
	 */
	public void infoUpdate(User user);

	
	/**
	 * 회원탈퇴
	 * 
	 * @param userId
	 */
	public void deleteUser(String userId);

	/**
	 * 예약 정보 확인
	 * 
	 * @param rent 예약 정보
	 */
	public List<Map<String,Object>> selectMyRentList(User user);
	
	/**
	 * 내가 예약한 정보 확인
	 * 
	 * @param user 예약 정보
	 * @return 내가 예약한 리스트 
	 */
	public List<Map<String, Object>> selectRentList(User user);

	/**
	 * 회원프로필사진인서트
	 * 
	 * @param userPage
	 */
	public void updateImg(UserFile userFile);


	/**
	 * 뷰에 보여줄 회원프로필사진
	 * 
	 * @param userId
	 * @return
	 */
	public UserFile selectImg(String userId);

	/**
	 * 추천수 조회
	 * 
	 * @param like 조회수
	 * @return 추천수
	 */
	public int selectLikeByBoardNo(User user);
	
	/**
	 * 추천수가 5 이상이면 회원등급
	 * CrackEgg로 변경
	 * 
	 * @param grade 추천수
	 * @return 
	 */
	public int updateCrackEgg(User user);

	/**
	 * 추천수가 10이상이면 회원등급
	 * Chick으로 변경
	 * 
	 * @param likeCount 추천수
	 * @return 
	 */
	public int updateChick(User user);

	/**
	 * 추천수가 20이상이면 회원등급
	 * Chicken으로 변경
	 * 
	 * @param likeCount 추천수
	 * @return 
	 */
	public int updateChicken(User user);

	/**
	 * 추천수가 30이상이면 회원등급
	 * FriedChicken으로 변경
	 * 
	 * @param likeCount
	 * @return 
	 */
	public int updateFriedChicken(User user);

	/**
	 * 유저 등급 조회
	 * 
	 * @param userPage 유저 등급
	 * @return
	 */
	public User selectGrade(User user);


	/**
	 * 자기소개 수정
	 * 
	 * @param userPage
	 */
	public void updateIntroduce(User user);


	/**
	 * 회원프로필 삭제
	 * 
	 * @param userPage
	 */
	public void deleteImg(UserFile userFile);

	/**
	 * 예약 상태 변경 승인
	 * 
	 * @param rent rent_no, board_no
	 * @return 
	 */
	public int updateRentStatus(Rent rent);

	/**
	 * 예약 상태 변경 취소 
	 * 
	 * @param rent rent_no , board_no
	 * @return 
	 */
	public int updateCancel(Rent rent);
	
	/**
	 * confirm 예약 상태 조회
	 * 
	 * @param rent 예약 
	 * @return true false
	 */
	public int selectConfirm(Rent rent);

	/**
	 * cancel 예약 상태 조회
	 * 
	 * @param rent rent_status
	 * @return 
	 */
	public int selectCancel(Rent rent);

	/**
	 * 유저테이블 전체 조회
	 * 
	 * @return
	 */
	public User selectUserAll(User user);

	/**
	 * 로그인한 아이디가 쓴 글 목록 조회
	 * 
	 * @param user
	 * @return
	 */
	public List<Board> selectBoardById(Board board);


	/**
	 * 로그인한 아이디가 쓴 댓글 목록 조회
	 * 
	 * @param comment
	 * @return
	 */
	public List<Map<String, Object>> selectCommentById(Comment comment);

}
