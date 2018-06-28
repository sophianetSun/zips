package logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

@Service
public class UserServiceImpl implements UserService{

	@Autowired 
	private UserDao userDao;
	
	@Override
	public void userCreate(User user) {
		userDao.insert(user);
	}

	@Override
	public int idcheck(String id) {
		return userDao.selectOne(id);
	}

	@Override
	public User getUser(String id) {
		return userDao.select(id);
	}
}
