package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UserProfileDao;
import web.dto.User;
import web.service.face.UserProfileService;

@Service
public class UserProfileServiceImpl implements UserProfileService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired UserProfileDao userProfileDao;

	
	@Override
	public void updateInfo(User user) {
		
		userProfileDao.infoUpdate(user);
	}


	@Override
	public void userDelete(String userId) {
		
		userProfileDao.deleteUser(userId);
	}


	

	

	
	
	
	
	
	
}
