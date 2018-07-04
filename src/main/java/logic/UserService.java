package logic;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

	void userCreate(User user, HttpServletRequest request);

	int idcheck(String id);

	User getUser(String id);

	void delete(String id);

	void updateUser(User user, HttpServletRequest request);

}
