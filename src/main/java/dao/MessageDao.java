package dao;

import java.util.List;

import logic.Message;

public interface MessageDao {

	public List<Message> getMsgList(String receiverId, String senderId);

	public Message getMsgById(String num);

	public void hideMsg(Message msg);

	public void insert(Message msg);

}
