package dao;

import logic.User;

public interface UserDao {

	void insert(User user);

	User select(String id);

	void update(User user);

	void delete(String id);

	User dbuser(String id);
}
