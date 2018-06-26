package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

// resources/dao/mapper/ItemMapper.java
public interface UserMapper {
	@Insert("insert into userAccount "
			+ "(userid}, username}, password}, birthday}, phoneno}, postcode}, address}, email) "
			+ "values (#{userId}, #{userName}, #{password}, #{birthDay}, #{phoneNo}, #{postcode}, #{address}, #{email})")
	void insert(User user);
	
	@Update("update userAccount set username=#{userName}, birthday=#{birthDay}, phoneno=#{phoneNo}, "
			+ "postcode=#{postcode}, address=#{address}, email=#{email}  where userid=#{userId}")
	void update(User user);
	
	@Delete("delete from userAccount where userid=#{value}")
	void delete(String userId);
	
	
}
