package dao;

import logic.Board;
import logic.Recomment;

public interface RecommentDao {

	int recommand(Recomment recomment, String co_userid, String content, Integer board_type);


	
	
}
