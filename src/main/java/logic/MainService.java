package logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;

public interface MainService {
	// Main Board List
	public Map<String, List<Board>> getMainBoards();
	public List<User> getTopUsers();
	
	// Search
	public List<Board> searchBoard(String query);
	public List<Shop> searchShop(String query);
	public void inputSearch(String query, HttpSession session);
	public List<Map<String, Integer>> getSearchMap();
	public Map<String, Long> analyzeSearchResult();
	
	// Message
	public void sendMsg(Message msg);
	public List<Message> getMsgList(String receiverId, String senderId);
	public Message getMsgById(String num);
	public void hideMsg(Message msg);
	public void deleteMsg(String num);
	
	// Subscription
	public int subscribe(String userId, String subId);
	public List<Subscription> getSubscriptionList(String id);
	public List<Subscription> getFollowerList(String id);
	public int update(Subscription sub);
	public int cancelSubsciription(String userId, String subId);
	
	// MyInfoCalendar
	public List<FoodDB> getFoodDBList(String searchText);
	public int saveMyInfoCalendar(InfoCalendar myinfo);
	public List<InfoCalendar> loadMyInfoCalendar(String userId);
	public Map<String, Double> myInfoMap(String userId);
	public Map<String, Double> myInfoMap(String userId, String regdate);
	public List<WorkoutDB> getWorkoutDBList(String searchText);
	public List<InfoCalendar> getWorkoutList(String userId);
	public List<String> myInfoNutriWords(String userId, String regdate);
	public List<String> myInfoWorkoutWords(String userId, String regdate);
}
