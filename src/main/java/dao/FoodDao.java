package dao;

import java.util.List;

import logic.FoodDB;

public interface FoodDao {

	public List<FoodDB> selectList(String searchText);

}
