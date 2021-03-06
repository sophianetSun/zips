package dao;

import java.util.Date;
import java.util.List;

import logic.Board;
import logic.User;

public interface UserDao {

	void insert(User user);

	User select(String id);

	void update(User user);

	void delete(String id);

	User dbuser(String id);
	
	void pwchange(String userId, String dbpass);

	List<User> list(String[] ids);

	List<User> list();

	// 구매자 코인 여부 체크
	String checkCoin(Integer coin, String shop_buyer_id);

	// 판매자 코인 증가
	void updateSellerCoin(Integer coin, String shop_seller_id);

	// 판매자 코인 증가 취소
	void updateSellerCoinCancel(Integer coin, String shop_seller_id);

	// 구매자 코인 사용
	void updateBuyerCoin(Integer coin, String shop_buyer_id);

	// 구매자 코인 사용 취소
	void updateBuyerCoinCancel(Integer coin, String shop_buyer_id);

	// 포인트, 코인 증가
	void getPointCoin(String id, int pointCoin);
	
	User findEmail(String email);

	void sellUpdate();

	int count(String searchType, String searchContent);

	List<User> list(String searchType, String searchContent, Integer pageNum, int limit);

	void logDateUpdate(String id);

	Date getlogDate(String id);


}
