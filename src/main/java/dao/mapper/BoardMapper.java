package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {

	@Insert("insert into totalboard (num,board_userid,subject,content,filename,regdate,board_count,board_type)" + 
			"values(#{num},#{board_userid},#{subject},#{content},#{fileurl},now(),0,#{board_type})")
	int insert(Board board);

	@Update("update totalboard set board_count=board_count+1 where num=#{value}")	
	void readcnt(Integer num);

	@Select("select ifnull(max(num),0) from totalboard")
	int maxNum();

	@Delete("delete from totalboard where num=#{num}")
	int delete(Board board);

	@Update("update totalboard set board_userid=#{board_userid},subject=#{subject},content=#{content},moddate=now(),filename=#{fileurl} where num=#{num}")
	int update(Board board);

	@Insert("insert into zipscomment (co_no,num,co_userid,ref_board_no,co_regdate,co_modate,co_content,co_apply)" +
			" values(10,#{num},#{userid},2,now(),now(),#{content},0)")
	int recommandinsert(Board board, String userid, String content, Integer board_type);
	
	

	

	


}
