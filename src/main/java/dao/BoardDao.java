package dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import logic.Board;

public interface BoardDao {

	int count(String searchType, String searchContent);

	List<Board> list(String searchType, String searchContent, Integer pageNum, int limit);

	Board getBoard(Integer num);

	int insert(Board board);

	void readcnt(Integer num);

	int maxNum();

	void refstepadd(Board board);

	int update(Board board, HttpServletRequest request);

	int delete(Board board, HttpServletRequest request);

	int mapdelete(Integer integer);

	List<Map<String,Object>> graph();

}
