package logic;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CalendarDao;
import dao.FoodDao;
import dao.MessageDao;
import dao.SearchInfoDao;
import dao.SubscriptionDao;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private SearchInfoDao searchInfoDao;
	@Autowired
	private MessageDao msgDao;
	@Autowired
	private SubscriptionDao subDao;
	@Autowired
	private FoodDao foodDao;
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public Map<String, List<Board>> getMainBoards() {
		Map<String, List<Board>> map = new HashMap<String, List<Board>>();
		map.put("homeTraining", getHomeTrainingList());
		map.put("beforeAndAfter", getBeforeAndAfterList());
		map.put("qna", getQnAList());
		map.put("freeboard", getFreeBoard());
		return map;
	}

	@Override
	public List<Shop> getShopList() {
		return null;
	}

	@Override
	public List<User> getTopUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InfoCalendar getMyCalInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> searchBoard(String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Shop> searchShop(String query) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Board> getHomeTrainingList() {
		return null;
	}
	public List<Board> getBeforeAndAfterList() {
		return null;
	}
	public List<Board> getQnAList() {
		return null;
	}
	public List<Board> getFreeBoard() {
		return null;
	}

	@Override
	public void inputSearch(String query, HttpSession session) {
		SearchInfo info = new SearchInfo();
		User user = (User)session.getAttribute("loginUser");
		if (user != null) {
			String id = user.getId();
			if (id != null && !id.equals("")) {
				info.setId(id);
			} 
		} else {
			info.setId("guest");			
		}
		info.setContent(query);
		info.setRegdate(new Date());
		searchInfoDao.setSearchContent(info);
	}
	
	@Override
	public List<Map<String, Integer>> getSearchMap() {
		return searchInfoDao.getSearchListGroupBy();
	}

	@Override
	public Map<String, Long> analyzeSearchResult() {
		Map<String, Long> map = searchInfoDao.getSearchListAll().stream()
				.collect(Collectors.groupingBy(
						SearchInfo::getContent,
						Collectors.counting()));
		return map;
	}

	@Override
	public void sendMsg(Message msg) {
		msg.setSenderStatus(1);
		msg.setReceiverStatus(1);
		msg.setRegdate(new Date());
		msgDao.insert(msg);
	}

	@Override
	public List<Message> getMsgList(String receiverId, String senderId) {
		return msgDao.getMsgList(receiverId, senderId);	
	}

	@Override
	public Message getMsgById(String num) {
		return msgDao.getMsgById(num);
	}

	@Override
	public void hideMsg(Message msg) {
		msgDao.hideMsg(msg);
	}

	@Override
	public void deleteMsg(String num) {
		
	}
	// Subscription

	@Override
	public int subscribe(String userId, String subId) {
		Subscription sub = new Subscription();
		sub.setUserId(userId);
		sub.setSubscribeId(subId);
		return subDao.insert(sub);
	}

	@Override
	public List<Subscription> getSubscriptionList(String id) {
		return subDao.selectListByUserId(id, "user");
	}

	@Override
	public List<Subscription> getFollowerList(String id) {
		return subDao.selectListByUserId(id, "subscribe");
	}

	@Override
	public int update(Subscription sub) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cancelSubsciription(String userId, String subId) {
		Subscription sub = new Subscription();
		sub.setUserId(userId);
		sub.setSubscribeId(subId);
		return subDao.delete(sub);
	}
	
	@Override
	public List<FoodDB> getFoodDBList(String searchText) {
		return foodDao.selectList(searchText);
	}

	@Override
	public int saveMyInfoCalendar(InfoCalendar myinfo) {
		return calendarDao.save(myinfo);
	}

	@Override
	public List<InfoCalendar> loadMyInfoCalendar(String userId) {
		return calendarDao.load(userId);
	}

	@Override
	public Map<String, Double> myInfoMap(String userId) {
		List<InfoCalendar> myInfoList = calendarDao.load(userId);
		return myInfoListToMap(myInfoList);
	}

	@Override
	public Map<String, Double> myInfoMap(String userId, String regdate) {
		List<InfoCalendar> myInfoList = calendarDao.load(userId, regdate);
		return myInfoListToMap(myInfoList);
	}

	private Map<String, Double> myInfoListToMap(List<InfoCalendar> myInfoList) {
		Map<String, Double> map = new HashMap<>();
		Double calorie = myInfoList.stream().
				collect(Collectors.summingDouble(InfoCalendar::getCalorie));
		Double carbohydrate = myInfoList.stream().
				collect(Collectors.summingDouble(InfoCalendar::getCarbohydrate));
		Double fat = myInfoList.stream().
				collect(Collectors.summingDouble(InfoCalendar::getFat));
		Double protein = myInfoList.stream().
				collect(Collectors.summingDouble(InfoCalendar::getProtein));
		map.put("calorie", calorie);
		map.put("carbohydrate", carbohydrate);
		map.put("fat", fat);
		map.put("protein", protein);
		return map;
	}
	
	
}
