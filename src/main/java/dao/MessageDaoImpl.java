package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MessageMapper;
import logic.Message;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.MessageMapper.";
	
	@Override
	public List<Message> getMsgList(String receiverId, String senderId) {
		Map<String, String> map = new HashMap<>();
		if (!(receiverId == null || receiverId.equals("")))
			map.put("receiver", receiverId);
		if (!(senderId == null || senderId.equals("")))
			map.put("sender", senderId);
		return sqlSession.selectList(NS + "msgList", map);
	}

	@Override
	public Message getMsgById(String num) {
		Map<String, String> map = new HashMap<>();
		map.put("num", num);
		return sqlSession.selectOne(NS + "msgList", map);
	}

	@Override
	public void hideMsg(Message msg) {
		sqlSession.getMapper(MessageMapper.class).update(msg);
	}

	@Override
	public void insert(Message msg) {
		sqlSession.getMapper(MessageMapper.class).insert(msg);
	}

}
