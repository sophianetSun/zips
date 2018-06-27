package controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView userEntry(@Valid User user, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView("user/join");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			System.out.println(user);
			return mav;
		}
		try {
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user",user);
			System.out.println("try"+user);
		} catch (DataIntegrityViolationException e) {
			bindingResult.reject("error.duplicate.user");
		}
		return mav;
	}
	
	@RequestMapping("user.idch")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String userid) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = service.idcheck(userid);
        map.put("cnt", count);
 
        return map;
    }
}