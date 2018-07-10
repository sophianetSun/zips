package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.RecommentMapper;
import logic.Recomment;

@Repository
public class RecommentDaolmpl implements RecommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.RecommentMapper.";
	
	@Override
	public int recommand(Recomment recomment,Integer board_type) {
		return sqlSession.getMapper(RecommentMapper.class).recommandinsert(recomment);
	}

	
	@Override
	public int Hrecommand(Recomment recomment, Integer board_type) {
		return sqlSession.getMapper(RecommentMapper.class).Hrecommandinsert(recomment);
	}
	
	@Override
	public int maxco_Num() {
		return sqlSession.getMapper(RecommentMapper.class).maxco_Num();
	}



	@Override
	public List<Recomment> recommentlist(Integer board_type,int num) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ref_board_no", board_type);
		map.put("num", num);
		return sqlSession.selectList(NS+"recommentlist",map);
	}

	@Override
	public void apply(Integer co_no,Integer num) {
		
		sqlSession.getMapper(RecommentMapper.class).apply(co_no);
	}

	@Override
	public void noapply(Integer num) {
		sqlSession.getMapper(RecommentMapper.class).noapply(num);
	}

	@Override
	public int recount(Integer num) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num);
		return sqlSession.selectOne(NS+"recount",map);
	}


	@Override
	public Recomment getapply(int num) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num);
		return sqlSession.selectOne(NS+"applycheck",map);
	}


	
	
}
