package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.InfoCalendar;

public interface InfoCalendarMapper {
	@Insert("insert into info_calendar (regdate, user_id, in_type, name, carbohydrate, "
			+ "fat, protein, amount, calorie, nutri_memo, work_memo) "
			+ "values (#{regdate}, #{user_id}, #{in_type}, #{name}, #{carbohydrate}, "
			+ "#{fat}, #{protein}, #{amount}, #{calorie}, #{nutri_memo}, #{work_memo})")
	int insert(InfoCalendar myinfo);

}
