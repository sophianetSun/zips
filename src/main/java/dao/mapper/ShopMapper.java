package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Shop;

public interface ShopMapper {
	
	// 게시물의 최대 글 번호를 구해주는 메소드
	@Select("select ifnull(max(shop_no), 0) from zips_shop")
	int maxNo();
	
	// 게시물의 개수

	// DB에 넣어주는 게시물 작성 메소드
	@Insert("insert into zips_shop "
			+ "(shop_no,shop_seller_id,shop_subject,shop_content,shop_price,shop_regdate) " 
			+ "values (#{shop_no},#{shop_seller_id},#{shop_subject},#{shop_content},#{shop_price},now())" )
	void insert(Shop shop);

	@Update("update zips_shop set "
			+ "shop_subject=#{shop_subject}, shop_price=#{shop_price}, shop_regdate=now(), shop_content=#{shop_content} where shop_no=#{shop_no}")
	void update(Shop shop);

	@Delete("delete from zips_shop where shop_no=#{shop_no}")
	void delete(int shop_no);

	@Update("update zips_shop set shop_status='2' where shop_seller_confirm = 1 and shop_buyer_confirm = 1")
	void sellUpdate();
	
	
	@Delete("delete from uploadfile where shop_no=#{shop_no}")
	void fileDelete(Integer shop_no);

	
	@Update("update zips_shop set shop_buyer_id='null', shop_status='0', shop_seller_confirm = '0', shop_buyer_confirm = '0' where shop_no = #{shop_no}")
	void shopDealCancel(Integer shop_no);

}
