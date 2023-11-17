package web.dao.face;

import java.util.List;

import web.dto.Booking;

import web.dto.User;
import web.dto.UserPage;

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
	 * @param book 예약 정보
	 */
	public List<Booking> selectBookList(Booking book);


	/**
	 * 회원프로필사진인서트
	 * 
	 * @param userPage
	 */
	public void updateImg(UserPage userPage);


	/**
	 * 뷰에 보여줄 회원프로필사진
	 * 
	 * @param userId
	 * @return
	 */
	public UserPage selectImg(String userId);





	


	

	
	
	
}
