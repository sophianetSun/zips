package dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import logic.Board;
import logic.Recomment;

public interface BoardDao {

	int insert(Board board);

	int count(String searchType, String searchContent);

	List<Board> list(Integer board_type, String searchType, String searchContent, Integer pageNum, int limit);

	Board getBoard(Integer num);

	void readcnt(Integer num);

	int maxNum();


	int update(Board board, HttpServletRequest request);

	List<Board> totallist(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit);

	int delete(Integer num);




	

}
