package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Insert("insert into board (name,pass,subject,content,file1,regdate,readcnt,ref,reflevel,refstep)" + 
			"values(#{name},#{pass},#{subject},#{content},#{fileurl},now(),0,#{ref},#{reflevel},#{refstep})")
	int insert(Board board);

	@Update("update board set readcnt=readcnt+1 where num=#{value}")	
	void readcnt(Integer num);

	@Select("select ifnull(max(num),0) from board")
	int maxNum();

	@Update("update board set refstep = refstep + 1" + 
			" where ref = #{ref} and refstep > #{refstep}")
	void refstepadd(Board board);

	@Update("update board set name=#{name},subject=#{subject},content=#{content},regdate=now(),file1=#{fileurl} where num=#{num}")
	int update(Board board);
	
	@Delete("delete from board where num=#{num}")
	int delete(Board board);

	@Delete("delete from board where num=#{num}")
	int mapdelete(Integer integer);

	@Select("select name key1, count(*) value1 from board group by name having count(*) > 0")
	List<Map<String, Object>> graph();


}
