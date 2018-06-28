package controller;

import java.util.List;

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
	private ShopService shopservice;
	
	@RequestMapping(value="shop/write", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request) {
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
			shopservice.shopWrite(shop, request);
			mav.setViewName("redirect:list.zips");
			
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 등록 실패", "write.zips");
		}
		return mav;
	}
	
	@RequestMapping("shop/list")
	public ModelAndView list(Integer pageNum, String searchType, String searchContent) {
		System.out.println("게시물 리스트 호출입니다.");
		
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		} 
		ModelAndView mav = new ModelAndView();
		int limit = 10;
		int shoplistcount = shopservice.shopCount(searchType, searchContent);
		List<Shop> shoplist = shopservice.shopList(searchType, searchContent, pageNum, limit);
		int maxpage = (int)((double)shoplistcount/limit + 0.95);
		int startpage = ((int)((pageNum/10.0 + 0.9)-1))*10+1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		int shopcnt = shoplistcount - (pageNum - 1) * limit;
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", shoplistcount);
		mav.addObject("shoplist", shoplist);
		mav.addObject("shopcnt", shopcnt);
		
		return mav;
	}
	
	@RequestMapping("shop/detail")
	public ModelAndView detail(Integer shop_no, Integer pageNum, HttpServletRequest request) {
		System.out.println("상세 보기 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = new Shop();
		if (shop_no != null) {
			shop = shopservice.getShop(shop_no);
		} 
		mav.addObject("pageNum", pageNum);
		mav.addObject("shop", shop);
		return mav;
	}
	
}
 