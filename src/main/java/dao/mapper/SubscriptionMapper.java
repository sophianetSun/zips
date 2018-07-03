package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import logic.Subscription;

public interface SubscriptionMapper {
	@Insert("insert into subscription (user_id, subscribe_id) values (#{userId}, #{subscribeId}")
	int insert(Subscription sub);

	@Delete("delete from subscription where user_id=#{userId} and subsciribe_id=#{subscribeId}")
	int delete(Subscription sub);

}
