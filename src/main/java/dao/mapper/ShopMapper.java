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
			+ "(, name, pass, subject, content, file1, regdate, readcnt, ref, reflevel, refstep) " 
			+ "values (#{num}, #{name}, #{pass}, #{subject}, #{content}, #{fileurl}, now(), 0, #{ref}, #{reflevel}, #{refstep})" )
	void insert(Shop shop);
	
}
