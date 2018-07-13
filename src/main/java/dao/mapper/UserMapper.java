package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	@Insert("insert into zipsuser"
			+"(id, pw, name, email, nickname, tel, address, gender, height, weight, bodyfat, muscle, "
			+ "blacklist, point, coin, regdate, logdate, picture)"
			+"values(#{id}, #{pw}, #{name}, #{email}, #{nickname}, #{tel}, #{address}, #{gender}, "
			+ "#{height}, #{weight}, #{bodyfat}, #{muscle}, #{blacklist}, #{point}, #{coin}, now(), "
			+ "#{logdate}, #{picture})")
	void insert(User user);

	@Select("select * from zipsuser where id=#{id}")
	User select(String id);

	@Update("update zipsuser set id=#{id}, pw=#{pw}, name=#{name}, email=#{email}, nickname=#{nickname}, "
			+ "tel=#{tel}, address=#{address}, gender=#{gender}, height=#{height}, weight=#{weight}, "
			+ "bodyfat=#{bodyfat}, muscle=#{muscle}, blacklist=#{blacklist}, point=#{point}, coin=#{coin}, "
			+ "regdate=#{regdate}, logdate=#{logdate}, picture=#{picture}, point=#{point} where id=#{id}")
	void update(User user);

	@Delete("delete from zipsuser where id=#{value}")
	void delete(String id);

	@Select("select * from zipsuser where email=#{value}")
	User findEmail(String email);
}
