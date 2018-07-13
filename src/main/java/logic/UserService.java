package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

	void userCreate(User user, HttpServletRequest request);

	User getUser(String id);

	void delete(String id);

	void updateUser(User user, HttpServletRequest request);

	User dbuser(String id);
	
	
	// 구매자 코인 사용
	void updateBuyerCoin(Integer coin, String shop_buyer_id);

	// 코인 여부 체크
	String checkCoin(Integer coin, String shop_buyer_id);

	// 판매자 코인 증가
	void updateSellerCoin(Integer coin, String shop_seller_id);

	// 판매자 코인 증가 취소
	void updateSellerCoinCancel(Integer coin, String shop_seller_id);

	// 구매자 코인 사용 취소
	void updateBuyerCoinCancel(Integer coin, String shop_buyer_id);

	void updatePass(String userId, String dbpass);

	List<User> userList(String[] idchks);

	List<User> userList();

	User findEmail(String email);

	

}
