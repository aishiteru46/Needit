package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Like;
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
	public List<Map<String,Object>> selectBookList(User user);


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
	public int selectLikeByBoardNo(Like like);
	
	/**
	 * 추천수가 5 이상이면 회원등급
	 * CrackEgg로 변경
	 * 
	 * @param grade 추천수
	 */
	public void updateCrackEgg(User user);

	/**
	 * 추천수가 10이상이면 회원등급
	 * Chick으로 변경
	 * 
	 * @param likeCount 추천수
	 */
	public void updateChick(User user);

	/**
	 * 추천수가 20이상이면 회원등급
	 * Chicken으로 변경
	 * 
	 * @param likeCount 추천수
	 */
	public void updateChicken(User user);

	/**
	 * 추천수가 30이상이면 회원등급
	 * FriedChicken으로 변경
	 * 
	 * @param likeCount
	 */
	public void updateFriedChicken(User user);

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







	


	

	
	
	
}
