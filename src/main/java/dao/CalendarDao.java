package dao;

import java.util.List;

import logic.InfoCalendar;

public interface CalendarDao {

	int save(InfoCalendar myinfo);

	List<InfoCalendar> load(String userId);
	List<InfoCalendar> load(String userId, String regdate);
}
