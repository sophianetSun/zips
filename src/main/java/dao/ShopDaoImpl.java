package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ShopMapper;
import logic.Shop;

@Repository
public class ShopDaoImpl implements ShopDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.ShopMapper.";
	
	// 게시물 글 번호
	@Override
	public int maxNo() {
		return sqlSession.getMapper(ShopMapper.class).maxNo();
	}

	// 게시물 작성
	@Override
	public void shopWrite(Shop shop) {	
		sqlSession.getMapper(ShopMapper.class).insert(shop);
	}

	@Override
	public int shopCount(String searchType, String searchContent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		
		Integer count = sqlSession.selectOne(NS+"shopCount", map);
		return count;
	}

	@Override
	public List<Shop> shopList(String searchType, String searchContent, Integer pageNum, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (pageNum - 1) * limit;
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit);
		map.put("pageNum", pageNum);
		
		return sqlSession.selectList(NS+"shopList", map);
	}

	// 글 읽어오기
	@Override
	public Shop getShop(Integer shop_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();	
		map.put("shop_no", shop_no);
		map.put("startrow", 0);
		map.put("limit", 1);
		return sqlSession.selectOne(NS+"shopList", map);
	}

	@Override
	public void shopUpdate(Shop shop) {
		sqlSession.getMapper(ShopMapper.class).update(shop);
	}

	@Override
	public void shopDelete(int shop_no) {
		sqlSession.getMapper(ShopMapper.class).delete(shop_no);
	}

	@Override 
	public void shopBuyerUpdate(Integer shop_no, String shop_buyer_id) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("shop_no", shop_no);
		map.put("shop_buyer_id", shop_buyer_id);
		sqlSession.update(NS+"shopBuyerUpdate", map);
	}

	@Override
	public void fileUpload(Integer ref_no, String originalfileName, String saveFileName, long fileSize) {
	    HashMap<String, Object> map = new HashMap<>();
	    map.put("ref_no", ref_no);
	    map.put("originalfileName", originalfileName);
	    map.put("saveFileName", saveFileName);
	    map.put("fileSize", fileSize);
	     
	    sqlSession.insert(NS+"fileUpload", map);	
	}
	
}
