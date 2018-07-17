package dao;

import java.util.List;

import logic.Board;
import logic.Recomment;

public interface RecommentDao {

	int recommand(Recomment recomment, Integer board_type);

	int maxco_Num();


	List<Recomment> recommentlist(Integer co_no, int num);

	void apply(Integer co_no, Integer num);

	void noapply(Integer num);

	int recount(Integer num);

	int Hrecommand(Recomment recomment, Integer board_type);

	Recomment getapply(int num);

	String getApplyId(Integer num);

	
	
}
