package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import logic.User;
import logic.UserService;

@Controller
public class Usercontroller {

	@Autowired
	private UserService service;
	
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
			service.userCreate(user, request);
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
        count = service.idcheck(id);
        map.put("cnt", count);
        return map;
    }
	
	@RequestMapping("user/login")
	public ModelAndView login(@Valid User user, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/login");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		try {
			User dbUser = service.getUser(user.getId());
			if(dbUser.getPw().equals(user.getPw())) {
				mav.addObject("dbUser", dbUser);
				mav.setViewName("main");
				session.setAttribute("loginUser", dbUser);
			} else {
				bindingResult.reject("error.login.password");
				mav.getModel().putAll(bindingResult.getModel());
				return mav;
				}
			} catch (EmptyResultDataAccessException e) {
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
}