package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.SearchInfo;

public interface SearchInfoMapper {
	@Insert("insert into search_info (id, content, regdate) values (#{id}, #{content}, #{regdate})")
	public void insert(SearchInfo info);
	
	@Select("select content, count(*) as count from search_info group by content")
	public List<Map<String, Integer>> listGroupBy();
	
	@Update("update search_info set content = '' where id = #{id}")
	public void update(SearchInfo info);
	
	@Delete("delete from searh_info where id = #{id}")
	public void delete(SearchInfo info);

}
