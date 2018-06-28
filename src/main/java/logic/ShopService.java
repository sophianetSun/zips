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
}
