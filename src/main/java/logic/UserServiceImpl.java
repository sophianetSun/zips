package logic;

import java.io.File;

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
		if(user.getPic() != null && user.getPic().isEmpty()) {
			uploadFileCreate(user.getPic(), request);
			user.setPicture(user.getPic().getOriginalFilename());
		}
		userDao.insert(user);
	}

	private void uploadFileCreate(MultipartFile pic, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/img/";
		String orgFile = pic.getOriginalFilename();
		try {
			pic.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int idcheck(String id) {
		return userDao.selectOne(id);
	}

	@Override
	public User getUser(String id) {
		return userDao.select(id);
	}
}
