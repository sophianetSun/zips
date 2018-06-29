package logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;

public interface MainService {
	
	public Map<String, List<Board>> getMainBoards();
	public List<Shop> getShopList();
	public List<User> getTopUsers();
	public InfoCalendar getMyCalInfo();
	
	public List<Board> searchBoard(String query);
	public List<Shop> searchShop(String query);
	
	public void inputSearch(String query, HttpSession session);
	public List<Map<String, Integer>> getSearchMap();
	public Map<String, Long> analyzeSearchResult();
	
	public void sendMsg(Message msg);
	public List<Message> getMsgList(String userId);
	public Message getMsgById(String num);
	public void hideMsg(Message msg);
	public void deleteMsg(String num);
}
