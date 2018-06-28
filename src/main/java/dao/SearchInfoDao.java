package dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import logic.SearchInfo;

public interface SearchInfoDao {
	public void setSearchContent(SearchInfo info);
	public List<SearchInfo> getSearchListById(String id);
	public List<SearchInfo> getSearchListAll();
	public List<Map<String, Integer>> getSearchListGroupBy();
	public List<SearchInfo> getSearchListByDate(String from, String to);
	public void updateSearchContent(SearchInfo info);
	public void deleteSearchContent(SearchInfo info);
}
