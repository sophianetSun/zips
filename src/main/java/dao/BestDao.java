package dao;

import java.util.List;

import logic.Best;
import logic.Board;

public interface BestDao {

	int best(Best best);

	int bestcnt(Best best);

	/*List<Best> getbest(int num);*/

	int bestinsert(Best best);

	Best bestlist(String board_userid, Integer num);

	void bestdelete(Best list);

}
