package dao;

import java.util.Date;
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

import dao.mapper.ShopMapper;
import dao.mapper.UserMapper;
import logic.Board;
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
		System.out.println("회원 가입 하는 부분입니다.");
		System.out.println(user);
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
	// 구매자 코인 여부 체크
	@Override
	public String checkCoin(Integer coin, String shop_buyer_id) {
		System.out.println("구매자 코인 여부 체크");
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("coin", coin);
		map.put("shop_buyer_id", shop_buyer_id);
		System.out.println(coin);
		System.out.println(shop_buyer_id);
		return sqlSession.selectOne(NS+"checkCoin", map);
	}

	// 판매자 코인 증가
	@Override
	public void updateSellerCoin(Integer coin, String shop_seller_id) {
		System.out.println("판매자 코인 증가");
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("coin", coin);
		map.put("shop_seller_id", shop_seller_id);
		System.out.println(coin);
		System.out.println(shop_seller_id);
		sqlSession.update(NS+"updateSellerCoin", map);
	}

	// 판매자 코인 증가 취소
	@Override
	public void updateSellerCoinCancel(Integer coin, String shop_seller_id) {
		System.out.println("판매자 코인 증가 취소");
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("coin", coin);
		map.put("shop_seller_id", shop_seller_id);
		System.out.println(coin);
		System.out.println(shop_seller_id);
		sqlSession.update(NS+"updateSellerCoinCancel", map);
	}

	// 구매자 코인 사용
	@Override
	public void updateBuyerCoin(Integer coin, String shop_buyer_id) {
		System.out.println("구매자 코인 사용");
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("coin", coin);
		map.put("shop_buyer_id", shop_buyer_id);
		System.out.println(coin);
		System.out.println(shop_buyer_id);
		sqlSession.update(NS+"updateBuyerCoin", map);
	}
	
	// 구매자 코인 사용 취소
	@Override
	public void updateBuyerCoinCancel(Integer coin, String shop_buyer_id) {
		System.out.println("구매자 코인 사용 취소");
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("coin", coin);
		map.put("shop_buyer_id", shop_buyer_id);
		System.out.println(coin);
		System.out.println(shop_buyer_id);
		sqlSession.update(NS+"updateBuyerCoinCancel", map);
	}

	// 포인트, 코인 부여
	@Override
	public void getPointCoin(String id, int pointCoin) {
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("id", id);
		map.put("pointCoin", pointCoin);
		sqlSession.update(NS+"getPointCoin", map);
	}
	
	@Override
	public void sellUpdate() {
		sqlSession.getMapper(ShopMapper.class).sellUpdate();
		
	}
	
	@Override
	public User findEmail(String email) {
		return sqlSession.getMapper(UserMapper.class).findEmail(email);
	}


	

	@Override
	public int count(String searchType, String searchContent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		Integer count = sqlSession.selectOne(NS+"count", map);
		return count;
	}

	@Override
	public List<User> list(String searchType, String searchContent, Integer pageNum, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		int startrow = (pageNum - 1) * limit;
		map.put("searchType", searchType);
		map.put("searchContent", searchContent);
		map.put("startrow", startrow);
		map.put("limit", limit);
		map.put("pageNum", pageNum);
		
		return sqlSession.selectList(NS+"list", map);
	}

	// 최근 접속 시간 수정
	@Override
	public void logDateUpdate(String id) {
		sqlSession.getMapper(UserMapper.class).logDateUpdate(id);
	}

	// 최근 접속시간 가져오기
	@Override
	public Date getlogDate(String id) {
		return sqlSession.getMapper(UserMapper.class).getlogDate(id); 
	}


}
