package web.service.face;

import org.springframework.stereotype.Service;

import web.dto.User;

@Service
public interface UserService {
	public void join(User user);

	public boolean login(User user);

	public User infoNick(User user);

}
