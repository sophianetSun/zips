package controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Shop;
import logic.ShopService;
import logic.User;
import logic.UserService;
 
@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopservice;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="shop/write", method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시물 작성 GET 방식 호출입니다.");
		System.out.println("로그인 유저 검사");
		System.out.println(request.getSession().getAttribute("loginUser"));
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		
		
		mav.addObject(loginUser);
		mav.addObject(new Shop());
		return mav;
	}
	
	@RequestMapping(value="shop/write", method=RequestMethod.POST)
	public ModelAndView write(@Valid Shop shop, BindingResult bindingResult, HttpServletRequest request) {
		System.out.println("게시물 작성 POST 방식 호출입니다.");
		System.out.println(request.getSession().getAttribute("loginUser"));
		
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
	
	@RequestMapping(value="shop/update", method=RequestMethod.POST)
	public ModelAndView update(@Valid Shop shop, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("수정 POST 방식");
		ModelAndView mav = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		System.out.println(request.getParameter("shop_no"));
		mav.addObject("shop_no", shop.getShop_no());
		mav.addObject("pageNum", pageNum);
		
		if(bindingResult.hasErrors()) {
			System.out.println("수정 오류 진입");
			mav.getModel().putAll(bindingResult.getModel());
			mav.addObject("shop", shop);
			return mav;
		}
		
		Shop dbShop = shopservice.getShop(shop.getShop_no());
		/*
		if(!board.getPass().equals(dbBoard.getPass())) {
			throw new ShopException("비밀번호 틀렸습니다.", "update.shop?num="+board.getNum()+"&pageNum="+request.getParameter("pageNum"));
		} 
		if(board.getFile1() == null || board.getFile1().isEmpty()) {
			board.setFileurl(request.getParameter("file2"));
		}
		*/
		try {  
			shopservice.shopUpdate(shop, request);
			mav.setViewName("redirect:list.zips");
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 수정 실패", "update.zips?shop_no="+shop.getShop_no()+"&pageNum="+pageNum);
		}
		return mav; 
	}
	
	@RequestMapping(value="shop/delete", method=RequestMethod.POST)
	public ModelAndView delete(@RequestParam HashMap<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		int shop_no = Integer.parseInt(map.get("shop_no"));
		String pageNum = map.get("pageNum");
		Shop dbshop = shopservice.getShop(shop_no);
		//String pass = map.get("pass");
/*		if(!pass.equals(dbBoard.getPass())) {
			throw new ShopException("비밀번호가 틀렸습니다", "delete.shop?num="+num+"&pageNum="+pageNum);
		}
*/			
		try {
			shopservice.shopDelete(shop_no);
			mav.setViewName("redirect:list.zips");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("삭제 중 오류 발생", "delete.zips?shop_no="+shop_no+"&pageNum="+pageNum);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="shop/*", method=RequestMethod.GET)
	public ModelAndView detail(Integer shop_no, Integer pageNum, HttpServletRequest request) {
		System.out.println("상세 보기 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = new Shop();
		if (shop_no != null) {
			shop = shopservice.getShop(shop_no);
			String url = request.getServletPath();
		} 
		System.out.println(pageNum);
		System.out.println(shop_no);
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		mav.addObject(loginUser);
		
		return mav;
	}
	
	@RequestMapping(value="shop/deal", method=RequestMethod.GET)
	public ModelAndView deal(Integer shop_no, Integer pageNum, HttpServletRequest request) {
		System.out.println("구매 신청 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopservice.getShop(shop_no);
		
		System.out.println(pageNum);
		System.out.println(shop_no);
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		mav.addObject(loginUser);
		
		return mav;
	}
	
	@RequestMapping(value="shop/dealpage", method=RequestMethod.POST)
	public ModelAndView dealpage(Integer shop_no, Integer pageNum, HttpServletRequest request) {
		System.out.println("구매/판매 진행중 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopservice.getShop(shop_no);
		
		System.out.println(pageNum);
		System.out.println(shop_no);
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		mav.addObject(loginUser);
		
		return mav;
	}
}
 