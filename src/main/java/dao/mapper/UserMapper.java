package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.User;

public interface UserMapper {
	@Insert("insert into zipsuser"
			+"(id, pw, name, email, nickname, tel, address, gender, height, weight, bodyfat, muscle, blacklist, point, coin, regdate, logdate, picture)"
			+"values(#{id}, #{pw}, #{name}, #{email}, #{nickname}, #{tel}, #{address}, #{gender}, #{height}, #{weight}, #{bodyfat}, #{muscle}, #{blacklist}, #{point}, #{coin}, now(), #{logdate}, #{picture})")
	void insert(User user);

	@Select("select * from zipsuser where id=#{id}")
	User select(String id);

}
