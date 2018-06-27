package controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Shop;
import logic.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value="shop/write", method=RequestMethod.GET)
	public ModelAndView write() {
		System.out.println("게시물 작성 GET 방식 호출입니다.");
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Shop());
		return mav;
	}
	
	@RequestMapping(value="shop/write", method=RequestMethod.POST)
	public ModelAndView write(@Valid Shop shop, BindingResult bindingResult, HttpServletRequest request) {
		System.out.println("게시물 작성 POST 방식 호출입니다.");
		ModelAndView mav = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			System.out.println("게시물 작성 검증 오류입니다.");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		try { 
			shopService.shopWrite(shop, request);
			mav.setViewName("redirect:list.shop");
			
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 등록 실패", "write.zips");
		}
		return mav;
	}
}
 