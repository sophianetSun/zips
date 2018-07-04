package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
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
	public ModelAndView userEntry(@Valid User user, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/join");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		try {
			userService.userCreate(user, request);
			mav.setViewName("redirect:/user/login.zips");
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
	
	@RequestMapping("user/mypage")//view를 띄워주는 메소드
	public ModelAndView mypage(HttpSession session) {
	ModelAndView mav = new ModelAndView();
	User loginUser = (User)session.getAttribute("loginUser");//수정시에 xml에 selectOne(값을 하나만 받아옴. 여러개를 받을 수 없음)을 쓰면서 xml조건문에 id != null을 쓰기 때문에 처음에 이 페이지를 띄울 때는 기존에 등록해 놓은 loginUser의 정보로 조회를 함. 그리고 수정한 후에 띄울 때는 수정한 정보를 띄움.-재한이오빠가 알려줌ㅋㅋ
	User dbuser = userService.dbuser(loginUser.getId());
	mav.addObject("dbuser", dbuser);
	return mav;
	}
	
	@RequestMapping("user/update")
	public ModelAndView update(@Valid User user, BindingResult bindingResult, HttpServletRequest request, String id) {
		ModelAndView mav = new ModelAndView("user/mypage");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
		return mav;
		}
		userService.updateUser(user, request);
		mav.addObject("dbuser", user);
		mav.setViewName("redirect:mypage.zips?id="+user.getId());//setViewName은 .jsp가 붙음
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
}