package web.dao.face;

import web.dto.User;

public interface UserDao {

	public void insertJoin(User user);

	public int selectCntByIdPw(User user);

	public User selectByNick(User user);

}
