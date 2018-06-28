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

	
	
}
