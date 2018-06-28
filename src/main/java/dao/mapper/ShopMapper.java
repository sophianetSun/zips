package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Shop;

public interface ShopMapper {
	
	// 게시물의 최대 글 번호를 구해주는 메소드
	@Select("select ifnull(max(shop_no), 0) from zips_shop")
	int maxNo();
	
	// 게시물의 개수

	
	// DB에 넣어주는 게시물 작성 메소드
	@Insert("insert into zips_shop "
			+ "(shop_no,shop_seller_id,shop_subject,shop_content,shop_price,shop_regdate) " 
			+ "values (#{shop_no},'chic0004',#{shop_subject},#{shop_content},#{shop_price},now())" )
	void insert(Shop shop);
	
}
