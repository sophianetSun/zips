package logic;

public interface UserService {

	void userCreate(User user);

	int idcheck(String id);

	User getUser(String id);




}
