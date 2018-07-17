package logic;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;

import dao.BoardDao;
import dao.CalendarDao;
import dao.FoodDao;
import dao.MessageDao;
import dao.SearchInfoDao;
import dao.SubscriptionDao;
import dao.UserDao;
import dao.WorkoutDao;

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
	@Autowired
	private WorkoutDao workoutDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public Map<String, List<Board>> getMainBoards() {
		Map<String, List<Board>> map = new HashMap<String, List<Board>>();
		map.put("bestTraining", getBestTrainingList());
		map.put("homeTraining", getHomeTrainingList());
		map.put("beforeAndAfter", getBeforeAndAfterList());
		map.put("qna", getQnAList());
		map.put("freeboard", getFreeBoard());
		return map;
	}

	private List<Board> getBestTrainingList() {
		Board board = new Board();
		board.setBoard_type(1);
		board.setRecommand(1);
		return boardDao.bestlist(board).stream().limit(3).collect(Collectors.toList());
	}

	@Override
	public List<User> getTopUsers() {
		List<User> list = userDao.list().stream().sorted(Comparator.comparing(User::getPoint).reversed())
			.limit(5).collect(Collectors.toList());
		return list;
	}

	@Override
	public List<Board> searchBoard(String query) {
		List<Board> list = new ArrayList<Board>();
		for(int i=1; i<=8; i++) {
			if(i<=4) {
				list.addAll(boardDao.list(i, "subject", query, 1, 10));							
			} else {
				list.addAll(boardDao.list(i%4, "board_userid", query, 1, 10));
			}
		}
		list = list.stream().distinct().sorted(Comparator.comparing(Board::getRegdate).reversed())
				.collect(Collectors.toList());
		return list;
	}

	@Override
	public List<Shop> searchShop(String query) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Board> getHomeTrainingList() {
		return boardDao.list(1, null, null, 1, 3);
	}
	public List<Board> getBeforeAndAfterList() {
		return boardDao.list(4, null, null, 1, 3);
	}
	public List<Board> getQnAList() {
		return boardDao.list(2, null, null, 1, 5);
	}
	public List<Board> getFreeBoard() {
		return boardDao.list(3, null, null, 1, 3);
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
	public Map<String, Long> analyzeSearchResult() {
		Map<String, Long> map = searchInfoDao.getSearchListAll().parallelStream()
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
		List<Subscription> list = getSubscriptionList(userId);
		Boolean isSubscribe = list.stream().anyMatch(sub -> 
			sub.getUser_id().equals(userId) && sub.getSubscribe_id().equals(subId));
		if (isSubscribe) {
			cancelSubsciription(userId, subId);
			return 2;
		} else {
			Subscription sub = new Subscription();
			sub.setUser_id(userId);
			sub.setSubscribe_id(subId);
			return subDao.insert(sub);
		}
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
		sub.setUser_id(userId);
		sub.setSubscribe_id(subId);
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
	public List<String> myInfoNutriWords(String userId, String regdate) {
		return calendarDao.load(userId, regdate).stream().
			map(info -> info.getNutri_memo()).collect(Collectors.toList());
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
		Double calorie = myInfoList.stream().filter(info -> info.getIn_type().equals(0))
				.collect(Collectors.summingDouble(InfoCalendar::getCalorie));
		Double carbohydrate = myInfoList.stream().filter(info -> info.getIn_type().equals(0))
				.collect(Collectors.summingDouble(InfoCalendar::getCarbohydrate));
		Double fat = myInfoList.stream().filter(info -> info.getIn_type().equals(0))
				.collect(Collectors.summingDouble(InfoCalendar::getFat));
		Double protein = myInfoList.stream().filter(info -> info.getIn_type().equals(0))
				.collect(Collectors.summingDouble(InfoCalendar::getProtein));
		map.put("calorie", calorie);
		map.put("carbohydrate", carbohydrate);
		map.put("fat", fat);
		map.put("protein", protein);
		return map;
	}

	
	@Override
	public List<WorkoutDB> getWorkoutDBList(String searchText) {
		return workoutDao.getList(searchText);
	}

	@Override
	public List<InfoCalendar> getWorkoutList(String userId) {
		List<InfoCalendar> myInfoList = calendarDao.load(userId);
		return myInfoList.stream().filter(
				info -> info.getIn_type().equals(1)).collect(Collectors.toList());
	}

	@Override
	public List<String> myInfoWorkoutWords(String userId, String regdate) {
		return calendarDao.load(userId, regdate).stream().
				map(info -> info.getWork_memo()).collect(Collectors.toList());
	}
	
	
}
