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
	public int maxco_Num() {
		return sqlSession.getMapper(RecommentMapper.class).maxco_Num();
	}


	@Override
	public Recomment getRecomment(int co_no) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("co_no", co_no);
		map.put("startrow", 0);
		map.put("limit", 1);
		return sqlSession.selectOne(NS+"co_list",map);
	}

	@Override
	public List<Recomment> recommentlist(Integer board_type,int num) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ref_board_no", board_type);
		map.put("num", num);
		return sqlSession.selectList(NS+"recommentlist",map);
	}

	@Override
	public void apply(Integer co_no) {
		sqlSession.getMapper(RecommentMapper.class).apply(co_no);
	}

	@Override
	public void noapply(Integer num) {
		sqlSession.getMapper(RecommentMapper.class).noapply(num);
	}

	@Override
	public int recount() {
		Map<String,String> map = new HashMap<String,String>();
		return sqlSession.selectOne(NS+"recount",map);
	}

	@Override
	public int Hrecommand(Recomment recomment, Integer board_type) {
		return sqlSession.getMapper(RecommentMapper.class).Hrecommandinsert(recomment,board_type);
	}
	
}
