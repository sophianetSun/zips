package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Shop;
import logic.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopservice;
	
	@RequestMapping("shop/*")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Shop());
		return mav;
	}
}
 