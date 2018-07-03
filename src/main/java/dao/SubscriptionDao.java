package dao;

import java.util.List;

import logic.Subscription;

public interface SubscriptionDao {
	public int insert(Subscription sub);
	public List<Subscription> selectListByUserId(String id, String type);
	public int update(Subscription sub);
	public int delete(Subscription sub);
}
