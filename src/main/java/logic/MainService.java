package logic;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	public Map<String, List<Board>> getMainBoards();
	public List<Shop> getShopList();
	public List<User> getTopUsers();
	public InfoCalendar getMyCalInfo();
	
	public List<Board> searchBoard(String query);
	public List<Shop> searchShop(String query);
	
	
}
