package dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import logic.Board;
import logic.Recomment;
import logic.UploadFile;

public interface BoardDao {

	int insert(Board board);

	int count(Integer board_type, String searchType, String searchContent);

	List<Board> list(Integer board_type, String searchType, String searchContent, Integer pageNum, int limit);

	Board getBoard(Integer num);

	void readcnt(Integer num);

	int maxNum();

	int update(Board board, HttpServletRequest request);

	List<Board> totallist(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit);

	int delete(Integer num);

	void board_applyupdate(Integer num);

	int recommand(Integer num);

	List<Board> bestlist(Board board);
	
	List<Board> totalbestlist(Board board);

	void totalrecommand(Integer num);

	void fileUpload(int num, String originalfileName, String saveFileName, long fileSize);

	List<UploadFile> getFileList(int num);

	void deleterecommand(Integer num);




	

}
