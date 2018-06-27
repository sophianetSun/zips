package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.User;

public interface UserMapper {
	@Insert("insert into zipsuser"
			+"(id, pw, name, email, nickname, tel, address, gender, height, weight, bodyfat, muscle, blacklist, point, coin, regdate, logdate, picture)"
			+"values(#{id}, #{pw}, #{name}, #{email}, #{nickname}, #{tel}, #{address}, #{gender}, #{height}, #{weight}, #{bodyfat}, #{muscle}, #{blacklist}, #{point}, #{coin}, #{regdate}, #{logdate}, #{picture})")
	void insert(User user);
}
