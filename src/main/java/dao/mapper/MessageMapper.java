package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.Message;

public interface MessageMapper {
	@Insert("insert into message (sender, sender_status, receiver, receiver_status, content, regdate)"
			+ " values (#{sender}, #{senderStatus}, #{receiver}, #{receiverStatus}, #{content}, #{regdate}")
	void insert(Message msg);
	
	@Update("update message set sender=#{sender}, sender_status=#{senderStatus}, "
			+ "receiver=#{receiverStatus}, content=#{content} where #{num}")
	void update(Message msg);

}
