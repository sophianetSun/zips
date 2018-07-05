package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.FoodDB;

@Repository
public class FoodDaoImpl implements FoodDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.FoodDBMapper.";
	
	@Override
	public List<FoodDB> selectList(String searchText) {
		Map<String, String> map = new HashMap<>();
		map.put("text", searchText);
		return sqlSession.selectList(NS + "list", map);
	}

}
