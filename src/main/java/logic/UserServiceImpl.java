package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.UserDao;

@Service
public class UserServiceImpl implements UserService{
 
	@Autowired 
	private UserDao userDao;
	
	@Override
	public void userCreate(User user, HttpServletRequest request) {
		if(user.getPic() != null && !user.getPic().isEmpty()) {
			uploadFileCreate(user.getPic(), request);
			user.setPicture(user.getPic().getOriginalFilename());
		}
		userDao.insert(user);
	}

	private void uploadFileCreate(MultipartFile pic, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/img/";
		String orgFile = pic.getOriginalFilename();//orgFile에는 오리지날파일네임이 있음.
		try {
			pic.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(String id) {
		return userDao.select(id);
	}

	@Override
	public void delete(String id) {
		userDao.delete(id);
	}

	@Override
	public void updateUser(User user, HttpServletRequest request) {
		if(user.getPic() != null && !user.getPic().isEmpty()) {
			uploadFileCreate(user.getPic(), request);
			user.setPicture(user.getPic().getOriginalFilename());
		}
		userDao.update(user);
		
	}

	@Override
	public User dbuser(String id) {
		return userDao.dbuser(id);
	}

	@Override
	public void updatePass(String userId, String dbpass) {
		userDao.pwchange(userId, dbpass);
	}

	@Override
	public List<User> userList(String[] ids) {
		return userDao.list(ids);
	}

	@Override
	public List<User> userList() {
		return userDao.list();
	}

	// 코인 체크
	@Override
	public String checkCoin(Integer coin, String shop_buyer_id ) {
		return userDao.checkCoin(coin, shop_buyer_id);
	}
	
	// 구매자 코인 사용
	public void updateBuyerCoin(Integer coin, String shop_buyer_id) {
		userDao.updateBuyerCoin(coin, shop_buyer_id);
	}

	// 구매자 코인 사용 취소
	@Override
	public void updateBuyerCoinCancel(Integer coin, String shop_buyer_id) {
		userDao.updateBuyerCoinCancel(coin, shop_buyer_id);
	}

	// 판매자 코인 증가
	@Override
	public void updateSellerCoin(Integer coin, String shop_seller_id) {
		userDao.updateSellerCoin(coin, shop_seller_id);
	}

	// 판매자 코인 증가 취소
	@Override
	public void updateSellerCoinCancel(Integer coin, String shop_seller_id) {
		userDao.updateSellerCoinCancel(coin, shop_seller_id);
	}

	@Override
	public User findEmail(String email) {
		return userDao.findEmail(email);
	}

}
