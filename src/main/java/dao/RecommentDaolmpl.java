package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.RecommentMapper;
import logic.Board;
import logic.Recomment;

@Repository
public class RecommentDaolmpl implements RecommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.RecommentMapper.";
	
	@Override
	public int recommand(Recomment recomment,String co_userid,String content,Integer board_type) {
		return sqlSession.getMapper(RecommentMapper.class).recommandinsert(recomment,co_userid,content,board_type);
	}
	
	
		
	
}
