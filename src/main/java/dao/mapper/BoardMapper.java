package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Insert("insert into totalboard (board_userid,subject,content,filename,regdate,board_count,board_type)" + 
			"values(#{board_userid},#{subject},#{content},#{fileurl},now(),0,#{board_type})")
	int insert(Board board);

	@Update("update totalboard set board_count=board_count+1 where num=#{value}")	
	void readcnt(Integer num);


}
