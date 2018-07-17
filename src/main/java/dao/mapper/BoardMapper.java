package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Insert("insert into totalboard (num,board_userid,subject,board_apply,content,filename,regdate,board_count,board_type)" + 
			"values(#{num},#{board_userid},#{subject},0,#{content},#{fileurl},now(),0,#{board_type})")
	int insert(Board board);

	@Update("update totalboard set board_count=board_count+1 where num=#{value}")	
	void readcnt(Integer num);

	@Select("select ifnull(max(num),0) from totalboard")
	int maxNum();

	@Delete("delete from totalboard where num=#{num}")
	int delete(Integer num);

	@Update("update totalboard set board_userid=#{board_userid},subject=#{subject},content=#{content},moddate=now(),filename=#{fileurl} where num=#{num}")
	int update(Board board);

	@Update("update totalboard set board_apply=1 where num=#{num}")
	void applyupdate(Integer num);
	
	@Update("update totalboard set recommand=recommand+1 where num=#{num}")
	int recommand(Integer num);

	@Update("update totalboard set totalrecommand=totalrecommand+1 where num=#{num}")
	void totalrecommand(Integer num);

	@Update("update totalboard set recommand=recommand-1 where num=#{num}")
	void deleterecommand(Integer num);

	

	

	


}
