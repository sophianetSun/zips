package logic;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class MainServiceImpl implements MainService {

	@Override
	public Map<String, List<Board>> getMainBoards() {

		return null;
	}

	@Override
	public List<Shop> getShopList() {
		// TODO Auto-generated method stub
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
}
