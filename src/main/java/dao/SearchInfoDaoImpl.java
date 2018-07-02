package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SearchInfoMapper;
import logic.SearchInfo;

@Repository
public class SearchInfoDaoImpl implements SearchInfoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.SearchInfoMapper.";

	@Override
	public void setSearchContent(SearchInfo info) {
		sqlSession.getMapper(SearchInfoMapper.class).insert(info);
	}

	@Override
	public List<SearchInfo> getSearchListById(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return sqlSession.selectList(NS + "searchList", map);
	}

	@Override
	public List<SearchInfo> getSearchListAll() {
		return sqlSession.selectList(NS + "searchList");
	}

	@Override
	public List<Map<String, Integer>> getSearchListGroupBy() {
		return sqlSession.getMapper(SearchInfoMapper.class).listGroupBy();
	}
	
	@Override
	public List<SearchInfo> getSearchListByDate(String from, String to) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date fromDate = sdf.parse(from);
			Date toDate = sdf.parse(to);
			Map<String, Date> map = new HashMap<String, Date>();
			map.put("from", fromDate);
			map.put("to", toDate);
			return sqlSession.selectList(NS + "searchList", map);			
		} catch (ParseException pe) {
			
		} finally {
			return null;
		}
	}

	@Override
	public void updateSearchContent(SearchInfo info) {
		sqlSession.getMapper(SearchInfoMapper.class).update(info);
	}

	@Override
	public void deleteSearchContent(SearchInfo info) {
		sqlSession.getMapper(SearchInfoMapper.class).delete(info);
	}

}
