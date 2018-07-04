package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {
	
	// 글 최대 번호
	Integer maxNo();
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

	// 판매자 아이디 추가
	void shopBuyerUpdate(Integer shop_no, String shop_buyer_id);
	
	// 글 삭제하기
	void shopDelete(Integer shop_no);

	// 파일 업로드
	void fileUpload(Integer ref_no, String originalfileName, String saveFileName, long fileSize);


}
