package dao;

import java.util.List;

import logic.WorkoutDB;

public interface WorkoutDao {

	List<WorkoutDB> getList(String searchText);

}
