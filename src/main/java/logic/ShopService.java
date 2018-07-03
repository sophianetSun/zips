package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {
	// 글쓰기
	void shopWrite(Shop shop, HttpServletRequest request);

	// 글 최대 개수
	int shopCount(String searchType, String searchContent);

	// 작성된 글 리스트 읽어오기
	List<Shop> shopList(String searchType, String searchContent, Integer pageNum, int limit);

	// 글 읽어오기
	Shop getShop(Integer shop_no);

	
	// 글 수정하기
	void shopUpdate(Shop shop, HttpServletRequest request);

	
	// 글 삭제하기
	void shopDelete(int shop_no);
}
