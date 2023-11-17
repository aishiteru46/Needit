package web.dao.face;

import java.util.List;

import web.dto.Booking;
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

	/**
	 * 예약 정보 확인
	 * 
	 * @param book 예약 정보
	 */
	public List<Booking> selectBookList(Booking book);


	

	
	
	
}
