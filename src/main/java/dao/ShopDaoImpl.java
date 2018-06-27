package dao;

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
	
	// 게시물 작성
	@Override
	public void shopWrite(Shop shop) {
		int shop_no = sqlSession.getMapper(ShopMapper.class).maxNo();
		shop.setShop_no(++shop_no);			
		sqlSession.getMapper(ShopMapper.class).insert(shop);
	}
	
	
}
