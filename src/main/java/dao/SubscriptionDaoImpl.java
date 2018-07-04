package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SubscriptionMapper;
import logic.Subscription;

@Repository
public class SubscriptionDaoImpl implements SubscriptionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.SubscriptionMapper.";
	
	@Override
	public int insert(Subscription sub) {
		return sqlSession.getMapper(SubscriptionMapper.class).insert(sub);
	}

	@Override
	public List<Subscription> selectListByUserId(String id, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("type", type);
		return sqlSession.selectList(NS + "list", map);
	}

	@Override
	public int update(Subscription sub) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Subscription sub) {
		return sqlSession.getMapper(SubscriptionMapper.class).delete(sub);
	}

}
