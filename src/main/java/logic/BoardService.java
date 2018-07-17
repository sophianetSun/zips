package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {

	int boardcount(Integer board_type, String searchType, String searchContent);

	List<Board> boardList(Integer board_type, String searchType, String searchContent, Integer pageNum, int limit);

	int boardinsert(Board board, HttpServletRequest request);

	Board getBoard(Integer num);

	void updatereadcnt(Integer num);

	int boardupdate(Board board, HttpServletRequest request);

	int boardrecommand(Recomment recomment, Integer board_type);

	List<Board> totalboardList(Integer board_type, String searchType, String searchContent, Integer pageNum, int limit);

	List<Recomment> recommentList(Integer co_no, int num);

	// 채택하기 
	void apply(Integer co_no, Integer num);

	void noapply(Integer num);

	int recount(Integer num);

	int Hrecommand(Recomment recomment, Integer board_type);

	int best(Best best, Integer num);

	int bestcnt(Best best);

	/*List<Best> getbest(int num);*/

	int boardDelete(Integer num);

	Recomment getapply(int num);

	List<Board> Bestlist(Board board);
	
	List<Board> totalBestlist(Board board);

	int totalbest(Best best, Integer num);

	void fileUpload(int num, String originalfileName, String saveFileName, long fileSize);

	List<UploadFile> getFileList(int num);

	int bestinsert(String board_userid, Integer num, Integer board_type);

	int totalbestinsert(String board_userid, Integer num, Integer board_type);






	
}
