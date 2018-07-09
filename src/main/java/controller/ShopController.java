package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Shop;
import logic.ShopService;
import logic.UploadFile;
import logic.User;
import logic.UserService;
 
@Controller 
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private UserService userService;
	
	// 중고 장터 글쓰기 호출
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
	
	// 중고 장터 글 작성 호출
	@RequestMapping(value="shop/write", method=RequestMethod.POST)
	public ModelAndView write(@Valid Shop shop, BindingResult bindingResult, HttpServletRequest request, MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {
		System.out.println("게시물 작성 POST 방식 호출입니다.");
		System.out.println(request.getSession().getAttribute("loginUser"));
		System.out.println(request.getServletContext().getRealPath("/"));
		ModelAndView mav = new ModelAndView();

		if(bindingResult.hasErrors()) {
			System.out.println("게시물 작성 검증 오류입니다.");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		String realFolder = request.getServletContext().getRealPath("/") + "/shopfile/";
		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		List<MultipartFile> mf = mhsq.getFiles("file");
		System.out.println(mf);
		
	   if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
            
       } else {
           for (int i = 0; i < mf.size(); i++) {
               // 파일 중복명 처리
        	   String genId = UUID.randomUUID().toString(); 

               // 본래 파일명
               String originalfileName = mf.get(i).getOriginalFilename();
                
               String saveFileName = genId + "." + FilenameUtils.getExtension(originalfileName);
               // 저장되는 파일 이름

               String savePath = realFolder + saveFileName; // 저장 될 파일 경로

               long fileSize = mf.get(i).getSize(); // 파일 사이즈

               mf.get(i).transferTo(new File(savePath)); // 파일 저장

               Integer shop_no = shopService.maxNo();
               
               System.out.println(shop_no);
               
               shopService.fileUpload(shop_no, originalfileName, saveFileName, fileSize);
           }
       }
       
       try { 
			shopService.shopWrite(shop, request);
			mav.setViewName("redirect:list.zips");
			
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 등록 실패", "write.zips");
		}
		return mav;
	}
	
	// 중고 장터 게시물 통합 메소드
		@RequestMapping(value="shop/detail")
		public ModelAndView detail(Integer shop_no, Integer pageNum, HttpServletRequest request) {
			System.out.println("상세 보기 호출");
			ModelAndView mav = new ModelAndView();
			Shop shop = new Shop();
			
			shop = shopService.getShop(shop_no);
			List<UploadFile> uploadFileList = shopService.getFileList(shop_no);
			
			System.out.println("업로드 파일 리스트");
			System.out.println(uploadFileList); 
			
			String url = request.getServletPath(); 
			
			System.out.println(pageNum);
			System.out.println(shop_no);
			
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			System.out.println(loginUser);
			
			mav.addObject("uploadFileList", uploadFileList);
			mav.addObject("pageNum", pageNum);
			mav.addObject("shop_no",shop_no);
			mav.addObject("shop", shop);
			mav.addObject(loginUser);
			
			return mav;
		}
		
	@RequestMapping(value="shop/*")
		public ModelAndView total(Integer shop_no, Integer pageNum, HttpServletRequest request) {
			System.out.println("상세 보기 호출");
			ModelAndView mav = new ModelAndView();
			Shop shop = new Shop();
			
			shop = shopService.getShop(shop_no);
			List<UploadFile> uploadFileList = shopService.getFileList(shop_no);
			
			System.out.println("업로드 파일 리스트");
			System.out.println(uploadFileList); 
			String url = request.getServletPath(); 
			
			System.out.println(pageNum);
			System.out.println(shop_no);
			
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			System.out.println(loginUser);
			
			mav.addObject("uploadFileList", uploadFileList);
			mav.addObject("pageNum", pageNum);
			mav.addObject("shop_no",shop_no);
			mav.addObject("shop", shop);
			mav.addObject(loginUser);
			
			return mav;
		}	
	// 중고 장터 게시물 리스트 호출
	@RequestMapping("shop/list")
	public ModelAndView list(Integer pageNum, String searchType, String searchContent) {
		System.out.println("게시물 리스트 호출입니다.");
		
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		} 
		ModelAndView mav = new ModelAndView();
		int limit = 10;
		int shoplistcount = shopService.shopCount(searchType, searchContent);
		shopService.sellUpdate();
		List<Shop> shoplist = shopService.shopList(searchType, searchContent, pageNum, limit);
		
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
	
	// 중고 장터 게시물 수정
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
		
		Shop dbShop = shopService.getShop(shop.getShop_no());
		
		try {  
			shopService.shopUpdate(shop, request);
			mav.setViewName("redirect:list.zips");
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 수정 실패", "update.zips?shop_no="+shop.getShop_no()+"&pageNum="+pageNum);
		}
		return mav; 
	}
	
	// 중고 장터 게시물 삭제
	@RequestMapping(value="shop/delete", method=RequestMethod.POST)
	public ModelAndView delete(@RequestParam HashMap<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		Integer shop_no = Integer.parseInt(map.get("shop_no"));
		String pageNum = map.get("pageNum");
		Shop dbshop = shopService.getShop(shop_no);
		
		try {
			shopService.shopDelete(shop_no);
			mav.setViewName("redirect:list.zips");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("삭제 중 오류 발생", "delete.zips?shop_no="+shop_no+"&pageNum="+pageNum);
		}
		
		return mav;
	}
	
	// 중고 장터 게시물 구매 신청
	@RequestMapping(value="shop/deal*", method=RequestMethod.GET)
	public ModelAndView deal(Integer shop_no, Integer pageNum, HttpServletRequest request) {
		System.out.println("구매 신청 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopService.getShop(shop_no);
		
		System.out.println();
		System.out.println(pageNum);
		System.out.println(shop_no);
		 
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);
		User sellerUser = userService.getUser(shop.getShop_seller_id());
		User buyerUser = userService.getUser(loginUser.getId());
		
		mav.addObject("sellerUser", sellerUser);
		mav.addObject("buyerUser", buyerUser);
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		mav.addObject(loginUser);
		
		return mav;
	}
	
	// 중고 장터 게시물 구매 진행 페이지 
	@RequestMapping(value="shop/dealpage", method=RequestMethod.POST)
	public ModelAndView dealpage(Integer shop_no, Integer pageNum, Integer dealcoin, HttpServletRequest request) {
		System.out.println("구매/판매 진행중 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopService.getShop(shop_no);
		
		System.out.println(dealcoin);
		System.out.println(pageNum);
		System.out.println(shop_no);
		System.out.println(shop.getShop_buyer_id());
		
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser);

		if(shop.getShop_status().equals("판매중")) {
			try {
				System.out.println("판매자, 구매자 코인 사용");
				String shop_buyer_id = loginUser.getId();
				shopService.shopBuyerUpdate(shop.getShop_no(), shop_buyer_id);
				userService.updateBuyerCoin(dealcoin, loginUser.getId());
				
			} catch (Exception e) {
				e.printStackTrace();
			
			}
		} 
		
		shop = shopService.getShop(shop_no);
		User sellerUser = userService.getUser(shop.getShop_seller_id());
		User buyerUser = userService.getUser(shop.getShop_buyer_id());
		
		mav.addObject("sellerUser", sellerUser);
		mav.addObject("buyerUser", buyerUser);
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		mav.addObject("dealcoin");
		mav.addObject(loginUser);
		return mav;
	}
	
	// AJAX 인수인계 확인 체크 
	@ResponseBody
	@RequestMapping(value="shop/checkConfirm")
	public String checkconfirm(Integer shop_no, String confirmType, HttpServletRequest request) {
		System.out.println("AJAX 인수 인계 확인 체크");
		return shopService.checkConfirm(shop_no, confirmType);
	}
	
	// AJAX 인수 인계 확인
	@ResponseBody
	@RequestMapping(value="shop/confirmShop")
	public String confirmShop(Integer shop_no, String confirmType, HttpServletRequest request) {
		System.out.println("AJAX 인수 인계 확인");
		shopService.confirmShop(shop_no, confirmType);
		return "완료";
	}
}
 