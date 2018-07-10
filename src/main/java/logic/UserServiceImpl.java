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
	public void updateBuyerCoin(Integer dealcoin, String shop_buyer_id) {
		userDao.updateBuyerCoin(dealcoin, shop_buyer_id);
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


	// 코인 사용

}
