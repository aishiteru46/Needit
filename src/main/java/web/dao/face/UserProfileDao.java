package web.dao.face;

import web.dto.User;

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


	

	
	
	
}
