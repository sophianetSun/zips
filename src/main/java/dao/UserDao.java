package dao;

import logic.User;

public interface UserDao {

	void insert(User user);

	int selectOne(String id);

	User select(String id);

	void update(User user);

	void delete(String id);
}
