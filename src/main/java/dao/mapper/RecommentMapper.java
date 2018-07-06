package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Recomment;

public interface RecommentMapper {

	@Insert("insert into zipscomment (co_no,num,co_userid,ref_board_no,co_regdate,co_modate,co_content,co_apply)" +
			" values(#{co_no},#{num},#{co_userid},#{ref_board_no},now(),null,#{co_content},0)")
			int recommandinsert(Recomment recomment);
	
	@Select("select ifnull(max(co_no),0) from zipscomment")
	int maxco_Num();

	@Update("update zipscomment set co_apply=1 where co_no = #{co_no}")
	void apply(Integer co_no);

	@Update("update zipscomment set co_apply=2 where num = #{num} and co_apply=0")
	void noapply(Integer num);

	@Insert("insert into zipscomment (co_no,num,co_userid,ref_board_no,co_regdate,co_modate,co_content,co_apply)" +
			" values(#{co_no},#{num},#{co_userid},#{ref_board_no},now(),null,#{co_content},null)")
	int Hrecommandinsert(Recomment recomment, Integer board_type);



}
