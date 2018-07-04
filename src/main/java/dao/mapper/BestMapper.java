package dao.mapper;

import org.apache.ibatis.annotations.Update;

import logic.Best;
import logic.Board;

public interface BestMapper {

	@Update("insert into best (num,rec_user,rec_board_type)"+
			"values(#{num},#{userid},#{board_type})")
			int bestinsert(Board board, String userid);
	
}
