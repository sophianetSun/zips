package dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import logic.Board;

public interface BoardDao {

	int insert(Board board);

	int count(String searchType, String searchContent);

	List<Board> list(String searchType, String searchContent, Integer pageNum, int limit);

	Board getBoard(Integer num);

	void readcnt(Integer num);

	

}
