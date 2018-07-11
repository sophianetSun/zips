package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ciper.CiperUtil;
import exception.LoginException;
import logic.User;
import logic.UserService;

@Controller
public class Usercontroller {

	@Autowired
	private UserService userService;
	
	@RequestMapping("user/join")//view를 띄워주는 메소드
	public ModelAndView join() {
	ModelAndView mav = new ModelAndView();
	mav.addObject(new User());
	return mav;
	}
	
	@RequestMapping("user/userEntry")
	public ModelAndView userEntry(@Valid User user, BindingResult bindingResult, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/join");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		} 
		String pass = user.getPw();//user의 비밀번호를 가져옴(이 때는 String타입)
		String dbpass = CiperUtil.encrypt(pass, "secretpw");//암호화할 user의 비밀번호를 secretpw라는 키값에 저장->현재 암호화가 된 상태
		user.setPw(dbpass);
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		user.setAddress(addr1 + " " + addr2 + " " + addr3);
		try {
			if(user.getEmail().isEmpty()) {
				throw new LoginException("이메일은 반드시 입력해 주세요. ID/PW분실시 반드시 필요합니다.", "join.zips?id="+user.getId());
			}
			userService.userCreate(user, request);
			mav.setViewName("user/login");
			mav.addObject("user",user);
			} catch (DataIntegrityViolationException e) {
				bindingResult.reject("error.duplicate.user");
		}
		return mav;
	}
	
	@RequestMapping(value="user/login", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		User user = new User();
		mav.addObject("user",user);
		return mav;
	}
	
	@RequestMapping(value="user/login", method=RequestMethod.POST)
	public ModelAndView login(@Valid User user, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/login");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		String pass = user.getPw();//user의 비밀번호를 가져옴(이 때는 String타입)
		String dbpass = CiperUtil.encrypt(pass, "secretpw");//암호화할 user의 비밀번호를 secretpw라는 키값에 저장->현재 암호화가 된 상태
		user.setPw(dbpass);
		try {
			User dbUser = userService.getUser(user.getId());
			if(dbUser.getPw().equals(user.getPw())) {
				mav.addObject("dbUser", dbUser);
				mav.setViewName("main");
				session.setAttribute("loginUser", dbUser);
			} else {
				bindingResult.reject("error.login.password");
				mav.getModel().putAll(bindingResult.getModel());
				return mav;
				}
			} catch (Exception e) {
				bindingResult.reject("error.login.id");
				mav.getModel().putAll(bindingResult.getModel());
		}
		return mav;
	}
	
	@RequestMapping("user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/main";
	}
	
	@RequestMapping("user/create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView("user/add");
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping(value="user/mypage", method=RequestMethod.GET)//view를 띄워주는 메소드
	public ModelAndView mypage(HttpSession session) {
	ModelAndView mav = new ModelAndView();
	User loginUser = (User)session.getAttribute("loginUser");//수정시에 xml에 selectOne(값을 하나만 받아옴. 여러개를 받을 수 없음)을 쓰면서 xml조건문에 id != null을 쓰기 때문에 처음에 이 페이지를 띄울 때는 기존에 등록해 놓은 loginUser의 정보로 조회를 함. 그리고 수정한 후에 띄울 때는 수정한 정보를 띄움.-재한이오빠가 알려줌ㅋㅋ
	User dbuser = userService.dbuser(loginUser.getId());
	mav.addObject("dbuser", dbuser);
	return mav;
	}
	
	@RequestMapping(value="user/update", method=RequestMethod.POST)
	public ModelAndView update(@Valid User user, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/mypage");
		if(bindingResult.hasErrors()) {
			mav.addObject(user);
			mav.getModel().putAll(bindingResult.getModel());
		return mav;
		}
		String pass = user.getPw();//user의 비밀번호를 가져옴(이 때는 String타입)
		String dbpass = CiperUtil.encrypt(pass, "secretpw");//암호화할 user의 비밀번호를 secretpw라는 키값에 저장->현재 암호화가 된 상태
		user.setPw(dbpass);
		User dbUser = userService.getUser(user.getId());
		String addr = dbUser.getAddress();
		int blacklist = dbUser.getBlacklist();
		user.setBlacklist(blacklist);
		int point  = dbUser.getPoint();
		user.setPoint(point);
		int coin = dbUser.getCoin();
		user.setCoin(coin);
		Date regdate  = dbUser.getRegdate();
		user.setRegdate(regdate);
		Date logdate  = dbUser.getLogdate();
		user.setLogdate(logdate);
		if(addr.isEmpty() || addr == null) {
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			user.setAddress(addr1 + " " + addr2 + " " + addr3);
		} else {
			user.setAddress(user.getAddress());
		}
		userService.updateUser(user, request);
		mav.addObject("dbuser", user);
		mav.setViewName("redirect:mypage.zips");//setViewName은 .jsp가 붙음
		return mav;
	}
	
	@RequestMapping(value="user/delete", method=RequestMethod.GET)
	public ModelAndView delete(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = userService.getUser(id);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value="user/delete", method=RequestMethod.POST)
	public ModelAndView delete(@Valid User user, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/delete");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("user/delete");
			return mav;
		}
		String pass = user.getPw();//user의 비밀번호를 가져옴(이 때는 String타입)
		String dbpass = CiperUtil.encrypt(pass, "secretpw");//암호화할 user의 비밀번호를 secretpw라는 키값에 저장->현재 암호화가 된 상태
		user.setPw(dbpass);
		User dbUser = userService.getUser(user.getId());
		User loginUser = (User)session.getAttribute("loginUser");
		if (!user.getPw().equals(dbUser.getPw())) {
			throw new LoginException("비밀번호가 틀립니다.", "delete.zips?id="+user.getId());
		}
		if (user.getPw() == null || user.getPw().isEmpty()) {
			throw new LoginException("비밀번호를 입력해 주세요.", "delete.zips?id="+user.getId());
		}
		try {
			userService.delete(user.getId());
			if(!loginUser.getId().equals("admin")) {
				session.invalidate();
				mav.setViewName("redirect:login.zips");
			} else {
				mav.setViewName("redirect:mypage.zips?id=" + loginUser.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="user/pwchange", method=RequestMethod.GET)
	public String pwchange() {
		return "user/pwchange";
	}
	
	@RequestMapping(value="user/pwchange", method=RequestMethod.POST)
	public ModelAndView pwchange(User user, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/mypage");
		String userId = user.getId();//user의 id정보가 들어있음
		User dbUser = userService.getUser(userId);//user의 아이디를 가져옴./모든 정보를 가져옴./사용자의 모든 정보가 들어있음
		String userpw = user.getPw();//jsp에서 user가 적은 비밀번호
		String userPw = CiperUtil.encrypt(userpw, "secretpw");//jsp에서 user가 적은 비밀번호를 암호화시킨 것
		if (!dbUser.getPw().equals(userPw)) {
			throw new LoginException("비밀번호가 틀립니다.", "pwchange.zips?id="+user.getId());
		}
		String newpw = request.getParameter("newpw");//user가 새로 사용하고자하는 비밀번호
		String dbpass = CiperUtil.encrypt(newpw, "secretpw");//user가 새로 사용하고자 하는 비밀번호를 암호화시킨 것
		dbUser.setPw(dbpass);//그 비밀번호를 비밀번호에 등록시킴
		try {
			userService.updatePass(userId, dbpass);
			mav.addObject("dbuser",dbUser);
			mav.setViewName("redirect:mypage.zips?id="+user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="user/admin", method=RequestMethod.GET)
	public ModelAndView userAdmin(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<User> userList = userService.userList();
		mav.addObject("userList", userList);
		mav.setViewName("/user/userAdmin");
		return mav;
	}
	
	@RequestMapping(value="user/admin", method=RequestMethod.POST)
	public ModelAndView adminUser(String[] idchks, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/userAdmin");
		if(idchks == null || idchks.length == 0) {
			throw new LoginException("메일을 보낼 회원을 선택해 주세요.", "userAdmin.zips");
		}
		List<User> userList = userService.userList(idchks);
		mav.addObject("userList", userList);
		return mav;
	}
	
	@RequestMapping("user/adminUpdate")
	public ModelAndView adminUpdate(String id, User user, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/userAdmin");
		User updateUser = userService.dbuser(user.getId());//user의 모든 정보
		String pass = updateUser.getPw();
		user.setPw(pass);	
		String addr = updateUser.getAddress();
		if(addr.isEmpty() || addr == null) {
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			user.setAddress(addr1 + " " + addr2 + " " + addr3);
		} else {
			user.setAddress(user.getAddress());
		}
		userService.updateUser(user, request);
		mav.addObject("updateUser", user);
		mav.setViewName("redirect:admin.zips");
		return mav;
	}
	
	@RequestMapping("user/adminDelete")
	public ModelAndView adminDelete(String id, User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView("user/userAdmin");
		User deleteUser = userService.getUser(id);//해당하는 아이디의 유저정보를 저장
		userService.delete(user.getId());
		mav.addObject("deleteUser", deleteUser);
		mav.setViewName("redirect:admin.zips");
		return mav;
	}
	
}









