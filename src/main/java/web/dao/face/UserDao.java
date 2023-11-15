package web.dao.face;

import web.dto.User;

public interface UserDao {

	//회원가입 insert
	public void insertJoin(User user);

	//로그인 아이디 비밀번호 확인
	public int selectCntByIdPw(User user);

	//닉네임 정보 조회
	public User selectByNick(User user);

	//아이디 중복체크
	public int selectCntById(User user);

	//닉네임 중복체크
	public int selectCntByNick(User user);


}
