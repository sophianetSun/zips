package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BestMapper;
import logic.Board;
@Repository
public class BestDaolmpl implements BestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BestMapper.";
	

	@Override
	public int best(Board board, String userid) {
		return sqlSession.getMapper(BestMapper.class).bestinsert(board,userid);
	}

}
