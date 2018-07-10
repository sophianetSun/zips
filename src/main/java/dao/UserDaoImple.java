package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDaoImple implements UserDao{
	private NamedParameterJdbcTemplate template;
	private RowMapper<User> mapper = new BeanPropertyRowMapper<User>(User.class);
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);
	}

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.UserMapper.";
	
	@Override
	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}

	@Override
	public User select(String id) {
		return sqlSession.getMapper(UserMapper.class).select(id);
	}

	@Override
	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}

	@Override
	public void delete(String id) {
		sqlSession.getMapper(UserMapper.class).delete(id);
	}

	@Override
	public User dbuser(String id) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		return sqlSession.selectOne(NS+"dbuser", map);
	}
	/* 판매자 코인 사용
	@Override
	public void updateSellerCoin(Integer coin, String shop_seller_id) {
		sqlSession.getMapper(UserMapper.class).updateSellerCoin(coin, shop_seller_id);
	}
	*/
	
	// 구매자 코인 사용
	@Override
	public void updateBuyerCoin(Integer dealcoin, String shop_buyer_id) {
		System.out.println("코인 사용");
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("dealcoin", dealcoin);
		map.put("shop_buyer_id", shop_buyer_id);
		System.out.println(dealcoin);
		System.out.println(shop_buyer_id);
		sqlSession.update(NS+"updateBuyerCoin", map);
	}

	@Override
	public void pwchange(String userId, String dbpass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("dbpass", dbpass);
		map.put("userId", userId);
		sqlSession.update(NS+"pwchange", map);
	}

	@Override
	public List<User> list() {
		String sql = "select * from zipsuser";
		return template.query(sql, mapper);
	}
	
	@Override
	public List<User> list(String[] ids) {
		String idlist = "";
		for(int i=0; i<ids.length; i++) {
			idlist += "'" + ids[i] + ((i == ids.length-1)?"'":",");
		}
		String sql = "select * from zipsuser where id in (" + idlist + ") and not id ='admin'";
		return template.query(sql, mapper);
	}

}




















