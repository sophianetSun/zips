package dao;

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

}
