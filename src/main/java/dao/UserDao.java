package dao;

import logic.User;

public interface UserDao {

	void insert(User user);

	int selectId(String userid);
}
