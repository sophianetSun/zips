package dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import logic.WorkoutDB;

@Repository
public class WorkoutDaoImpl implements WorkoutDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.WorkoutDBMapper.";
	
	@Override
	public List<WorkoutDB> getList(String searchText) {
		List<String> txtList = Arrays.stream(searchText.split(" "))
				.distinct().collect(Collectors.toList());
		Map<String, String> map = new HashMap<>();
		if (txtList.size() < 2) {
			map.put("first", txtList.get(0));
			return sqlSession.selectList(NS + "list", map);			
		} else {
			map.put("first", txtList.get(0));
			map.put("second", txtList.get(1));
			return sqlSession.selectList(NS + "listDouble", map);
		}
	}

}
