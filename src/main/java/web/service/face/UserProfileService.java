package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Like;
import web.dto.User;
import web.dto.UserFile;

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
	public List<Map<String,Object>> rentList(User user);

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
	public int cntLike(Like like);
	
	/**
	 * 추천수에 따른 회원등급
	 * 
	 * @param likeCount 추천수
	 * @param grade 
	 * @return 
	 */
	public User updateGrade(int likeCount, User user);
	
	/**
	 * 유저 등급 조회
	 * 
	 * @param userPage 유저 정보
	 * @return
	 */
	public User selectUserGrade(User user);

	
	/**
	 * 프로필사진 삭제
	 * 
	 * @param userPage
	 */
	public void imgDelete(UserFile userFile);

	

	

	
	
	
	
	

}
