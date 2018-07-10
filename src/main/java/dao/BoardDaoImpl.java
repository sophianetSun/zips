package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.RecommentMapper;
import logic.Board;
@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BoardMapper.";
	
	@Override
	public int insert(Board board) {
		return sqlSession.getMapper(BoardMapper.class).insert(board);
	}
	
	@Override
	public int count(String searchType, String searchContent) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		return sqlSession.selectOne(NS+"count",map);
	}

	@Override
	public List<Board> list(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit) {
		Map<String,Object> map = new HashMap<String,Object>();
		int startrow = (pageNum -1 ) * limit;
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit); 
		map.put("board_type", board_type);
		return sqlSession.selectList(NS+"list",map);
	}

	@Override
	public Board getBoard(Integer num) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num);
		map.put("startrow", 0);
		map.put("limit", 1);
		return sqlSession.selectOne(NS+"list",map);
	}

	@Override
	public void readcnt(Integer num) {
		sqlSession.getMapper(BoardMapper.class).readcnt(num);
	}

	@Override
	public int maxNum() {
		int a = sqlSession.getMapper(BoardMapper.class).maxNum();
		return a;
	}

	@Override
	public int delete(Integer num) {
		return sqlSession.getMapper(BoardMapper.class).delete(num);
	}

	@Override
	public int update(Board board, HttpServletRequest request) {
		  return sqlSession.getMapper(BoardMapper.class).update(board);
	}

	@Override
	public List<Board> totallist(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit) {
		Map<String,Object> map = new HashMap<String,Object>();
		int startrow = (pageNum -1 ) * limit;
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit); 
		map.put("board_type", board_type);
		return sqlSession.selectList(NS+"totallist",map);
	}


	
	
	
	
}
