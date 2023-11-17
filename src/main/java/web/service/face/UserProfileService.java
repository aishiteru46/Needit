package web.service.face;

import java.util.List;

import web.dto.Booking;
import web.dto.User;

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
	 * 예약 목록
	 * 
	 * @param book 예약 정보
	 * @return 
	 */
	public List<Booking> bookList(Booking book);

	

	
	
	
	
	

}
