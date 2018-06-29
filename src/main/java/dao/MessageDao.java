package dao;

import java.util.List;

import logic.Message;

public interface MessageDao {

	public List<Message> getMsgList(String userId);

	public Message getMsgById(String num);

	public void hideMsg(Message msg);

	public void insert(Message msg);

}
