package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.InfoCalendarMapper;
import logic.InfoCalendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.InfoCalendarMapper.";
	
	@Override
	public int save(InfoCalendar myinfo) {
		return sqlSession.getMapper(InfoCalendarMapper.class).insert(myinfo);
	}

	@Override
	public List<InfoCalendar> load(String userId) {
		Map<String, String> map = new HashMap<>();
		map.put("id", userId);
		return sqlSession.selectList(NS + "list", map);
	}

	@Override
	public List<InfoCalendar> load(String userId, String regdate) {
		Map<String, String> map = new HashMap<>();
		map.put("id", userId);
		map.put("regdate", regdate);
		return sqlSession.selectList(NS + "list", map);
	}
}
