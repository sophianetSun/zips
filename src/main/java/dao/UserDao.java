package dao;

import java.util.List;

import logic.User;

public interface UserDao {

	void insert(User user);

	User select(String userId);

	void update(User user);

	void delete(String userId);

	List<User> list();

	List<User> list(String[] idchks);
}
