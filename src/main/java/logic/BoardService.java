package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {

	int boardcount(String searchType, String searchContent);

	List<Board> boardList(Integer board_type, String searchType, String searchContent, Integer pageNum, int limit);

	int boardinsert(Board board, HttpServletRequest request);

	Board getBoard(Integer num);

	void updatereadcnt(Integer num);

	int boardDelete(Board board, HttpServletRequest request);

	int boardupdate(Board board, HttpServletRequest request);

	int boardrecommand(Recomment recomment, String co_userid, String content, Integer board_type);

	int bestcnt(Board board, String userid);

	List<Board> totalboardList(Integer board_type, String searchType, String searchContent, Integer pageNum, int limit);




	
}
