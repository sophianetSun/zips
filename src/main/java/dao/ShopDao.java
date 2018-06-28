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
	
}
