package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BestMapper;
import logic.Best;
import logic.Board;
@Repository
public class BestDaolmpl implements BestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BestMapper.";
	

	@Override
	public int best(Best best) {
	return sqlSession.getMapper(BestMapper.class).bestinsert(best);
		
	}


	@Override
	public int bestcnt(Best best) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", best.getNum());
		return sqlSession.selectOne(NS+"bestcount",map);
		
	}


/*	@Override
	public List<Best> getbest(int num) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num);
		return sqlSession.selectList(NS+"bestlist",map);
	}*/


	@Override
	public int bestinsert(Best best) {
		return sqlSession.getMapper(BestMapper.class).bestinsert(best);
	}


	@Override
	public Best bestlist(String board_userid, Integer num) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num", num);
		map.put("rec_user", board_userid);
		return sqlSession.selectOne(NS+"bestlist",map);
	}


	@Override
	public void bestdelete(Best list) {
		sqlSession.getMapper(BestMapper.class).bestdelete(list);
	}

}
