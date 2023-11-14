package web.service.face;

import org.springframework.stereotype.Service;

import web.dto.User;

@Service
public interface UserService {
	
	//회원가입
	public void join(User user);

	//로그인
	public boolean login(User user);

	//닉네임 정보
	public User infoNick(User user);

	//아이디 체크
	public boolean idCheck(User user);

	//닉네임 체크
	public boolean ncikCheck(User user);


}
