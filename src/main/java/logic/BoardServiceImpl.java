package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public int boardcount(String searchType, String searchContent) {
		return boardDao.count(searchType,searchContent);
	}

	@Override
	public List<Board> boardList(String searchType, String searchContent, Integer pageNum, int limit) {
		return boardDao.list(searchType,searchContent,pageNum,limit);
	}

	@Override
	public int boardinsert(Board board, HttpServletRequest request) {
		int num = boardDao.maxNum();
		board.setNum(++num);
		return boardDao.insert(board);
	}

	@Override
	public Board getBoard(Integer num) {
		return boardDao.getBoard(num);
	}

	@Override
	public void updatereadcnt(Integer num) {
		System.out.println("보드서비스임플 num:"+num);
		boardDao.readcnt(num);
	}

	@Override
	public int boardDelete(Board board, HttpServletRequest request) {
		return boardDao.delete(board,request);
	}

	@Override
	public int boardupdate(Board board, HttpServletRequest request) {
		return boardDao.update(board,request);
	}
	
		
}
