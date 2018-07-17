package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.Best;
import logic.Board;

public interface BestMapper {

	@Insert("insert into best (num,rec_user,rec_board_type) values(#{num},#{rec_user},#{rec_board_type})")
			int bestinsert(Best best);
	
	@Delete("delete from best where num=#{num} and rec_user=#{rec_user}")
	void bestdelete(Best list);
	
}
