package web.dao.face;

import web.dto.FileTb;
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
	 * 회원프로필사진
	 * 
	 * @param userPage
	 */
	public void updateImg(UserPage userPage);





	


	

	
	
	
}
