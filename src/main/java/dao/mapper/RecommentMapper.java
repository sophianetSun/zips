package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.Board;
import logic.Recomment;

public interface RecommentMapper {

	@Insert("insert into zipscomment (co_no,num,co_userid,ref_board_no,co_regdate,co_modate,co_content,co_apply)" +
			" values(12,44,#{co_userid},2,now(),now(),'dwadw',0)")
			int recommandinsert(Recomment recomment, String co_userid, String co_content, Integer board_type);



}
