package dao;

import java.util.List;

import logic.Shop;

public interface ShopDao {
	
	// 게시물의 최대 글 번호
	int maxNo();
	
	// 게시물 작성
	void shopWrite(Shop shop);

	
	int shopCount(String searchType, String searchContent);

	List<Shop> shopList(String searchType, String searchContent, Integer pageNum, int limit);

	Shop getShop(Integer shop_no);

	// 게시물 수정
	void shopUpdate(Shop shop);

	// 판매자 아이디 추가
	void shopBuyerUpdate(Integer shop_no, String shop_buyer_id);
	
	void shopDelete(int shop_no);

	
}
