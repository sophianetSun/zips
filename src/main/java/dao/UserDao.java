package dao;

import logic.User;

public interface UserDao {

	void insert(User user);

	int selectOne(String id);

	User select(String id);

	void update(User user);

	void delete(String id);

	/* 판매자 코인 사용
	void updateSellerCoin(Integer coin, String shop_seller_id);
	*/
	
	// 구매자 코인 사용
	void updateBuyerCoin(Integer coin, String shop_buyer_id);
}
