package logic;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import dao.MessageDao;
import dao.SearchInfoDao;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private SearchInfoDao searchInfoDao;
	@Autowired
	private MessageDao msgDao;
	
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
		String login = (String)session.getAttribute("login");
		if (login != null && login.equals("")) {
			info.setId(login);
		}
		info.setId("guest");
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
		msgDao.insert(msg);
	}

	@Override
	public List<Message> getMsgList(String userId) {
		if (userId != null || !userId.equals("")) {
			return null;
		}		
		
		return msgDao.getMsgList(userId);	
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
}
