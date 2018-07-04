package controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("user/idcheck")
    @ResponseBody
    public Map<String, Integer> idcheck(@RequestBody String id) {
        int count = 0;
        Map<String, Integer> map = new HashMap<String, Integer>();
        count = userService.idcheck(id);
        map.put("cnt", count);
        return map;
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
	public ModelAndView mypage() {
	ModelAndView mav = new ModelAndView();
	mav.addObject(new User());
	return mav;
	}
	
	/*@RequestMapping(value="user/update", method=RequestMethod.POST)
	public ModelAndView update(@Valid User user, BindingResult bindingResult, HttpSession session, HttpServletRequest request) {
	ModelAndView mav = new ModelAndView("user/mypage");
	if(bindingResult.hasErrors()) {
		mav.getModel().putAll(bindingResult.getModel());
		return mav;
	}
	User loginUser = (User) session.getAttribute("loginUser");
	User dbUser = userService.getUser(user.getId());
	if(loginUser.getPw().equals("admin")) {
		if(!loginUser.getPw().equals(user.getPw())) {
			throw new LoginException("관리자 비밀번호가 올바르지 않습니다.", "mypage.zips?id="+user.getId()); 
		}
	} else {
		if(!user.getPw().equals(dbUser.getPw())) {
			throw new LoginException("비밀번호가 틀리죠^^?", "mypage.user?id="+user.getId());
		}
	}
	try {
		userService.updateUser(user);
		mav.setViewName("redirect:/user/mypage.zips");
	} catch (Exception e) {
		e.printStackTrace();
	}
		return mav;
	}*/
	
	@RequestMapping("user/update")
	public ModelAndView update(@Valid User user, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/mypage");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
		return mav;
		}
		userService.updateUser(user, request);
		mav.addObject("upuser", user);
		mav.setViewName("redirect:/user/update.zips");
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
		ModelAndView mav = new ModelAndView("user/delete.zips?id="+user.getId());
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("user/delete.zips?id=" + user.getId());
			return mav;
		}
		User dbUser = userService.getUser(user.getId());
		User loginUser = (User)session.getAttribute("loginUser");
		if (!user.getPw().equals(dbUser.getPw())) {
			throw new LoginException("비밀번호가 틀립니다.", "delete.zips?id="+user.getId());
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