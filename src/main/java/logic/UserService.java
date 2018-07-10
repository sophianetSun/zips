package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

	void userCreate(User user, HttpServletRequest request);

	User getUser(String id);

	void delete(String id);

	void updateUser(User user, HttpServletRequest request);

	User dbuser(String id);
	// 코인 사용
	void updateBuyerCoin(Integer dealcoin, String shop_seller_id);

	void updatePass(String userId, String dbpass);

	List<User> userList(String[] idchks);

	List<User> userList();

	

}
