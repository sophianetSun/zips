package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
	public ModelAndView write(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시물 작성 GET 방식 호출입니다.");
		
		mav.addObject(new Shop()); 
		return mav;
	} 
	
	// 중고 장터 글 작성 호출
	@RequestMapping(value="shop/write", method=RequestMethod.POST)
	public ModelAndView write(HttpSession session, MultipartHttpServletRequest mhsq, @Valid Shop shop, BindingResult bindingResult) throws IllegalStateException, IOException {
		System.out.println("게시물 작성 POST 방식 호출입니다.");
		
		ModelAndView mav = new ModelAndView();

		if(bindingResult.hasErrors()) {
			System.out.println("게시물 작성 검증 오류입니다.");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		
		String realFolder = session.getServletContext().getRealPath("/") + "/shopfile/";
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
               
               shopService.fileUpload(++shop_no, originalfileName, saveFileName, fileSize);
           }
       }
       
       try { 
			shopService.shopWrite(shop, mhsq);
			mav.setViewName("redirect:list.zips");
			
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 등록 실패", "write.zips");
		}
		return mav;
	}
	
	// 중고 장터 게시물 리스트 호출
	@RequestMapping("shop/list")
	public ModelAndView list(HttpSession session, Integer pageNum, String searchType, String searchContent) {
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
	 
	// 중고 장터 게시물 상세 보기
	@RequestMapping(value="shop/detail")
	public ModelAndView detail(HttpSession session, Integer shop_no) {
		System.out.println("중고장터 상세 보기 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = new Shop();
		
		shop = shopService.getShop(shop_no);
		List<UploadFile> uploadFileList = shopService.getFileList(shop_no);
		
		mav.addObject("uploadFileList", uploadFileList);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		
		return mav;
	}

	// 중고 장터 통합 보기 
	@RequestMapping(value="shop/*")
	public ModelAndView total(HttpSession session, Integer shop_no) {
		System.out.println("중고장터 통합 보기 호출");
		ModelAndView mav = new ModelAndView();
		
		Shop shop = shopService.getShop(shop_no);
		List<UploadFile> uploadFileList = shopService.getFileList(shop_no);
		
		mav.addObject("uploadFileList", uploadFileList);
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		
		return mav;
	}	
	
	// 중고 장터 게시물 수정
	@RequestMapping(value="shop/update", method=RequestMethod.POST)
	public ModelAndView update(HttpSession session, MultipartHttpServletRequest mhsq, @Valid Shop shop, BindingResult bindingResult) throws IllegalStateException, IOException {
		System.out.println("중고 장터 수정 POST 방식");
		ModelAndView mav = new ModelAndView();
		
		List<UploadFile> uploadFileList = shopService.getFileList(shop.getShop_no());
		
		if(bindingResult.hasErrors()) {
			System.out.println("중고 장터 수정 오류 진입");
			mav.getModel().putAll(bindingResult.getModel());
			mav.addObject("shop", shop);
			mav.addObject("shop_no", shop.getShop_no());
			mav.addObject("uploadFileList", uploadFileList);
			return mav;
		}
		
		String realFolder = session.getServletContext().getRealPath("/") + "/shopfile/";
		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		List<MultipartFile> mf = mhsq.getFiles("file");
		System.out.println(mf);
		
		System.out.println("기존에 있는 파일 모두 삭제");
		
		shopService.fileDelete(shop.getShop_no());
		
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
 
               Integer shop_no = shop.getShop_no();
               
               shopService.fileUploadUpdate(shop_no, originalfileName, saveFileName, fileSize);
           }
       }
		
		try {  
			shopService.shopUpdate(shop, mhsq);
			mav.setViewName("redirect:list.zips"); 
		} catch (Exception e) {
			e.printStackTrace();
			new ShopException("게시물 수정 실패", "update.zips?shop_no="+shop.getShop_no());
		}
		
		return mav; 
	}
	
	// 중고 장터 게시물 삭제
	@RequestMapping(value="shop/delete", method=RequestMethod.POST)
	public ModelAndView delete(HttpSession session, @RequestParam HashMap<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		Integer shop_no = Integer.parseInt(map.get("shop_no"));
		Shop dbshop = shopService.getShop(shop_no);
		
		try {
			shopService.shopDelete(shop_no);
			mav.setViewName("redirect:list.zips");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("삭제 중 오류 발생", "delete.zips?shop_no="+shop_no);
		}
		
		return mav;
	}
	
	// 중고 장터 게시물 구매 신청
	@RequestMapping(value="shop/deal", method=RequestMethod.GET)
	public ModelAndView deal(HttpSession session, Integer shop_no) {
		System.out.println("구매 신청 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopService.getShop(shop_no);
		
		System.out.println(shop_no);
		 
		User loginUser = (User) session.getAttribute("loginUser");

		User sellerUser = userService.getUser(shop.getShop_seller_id());
		
		User buyerUser = userService.getUser(loginUser.getId());
		
		mav.addObject("sellerUser", sellerUser);
		mav.addObject("buyerUser", buyerUser);
		
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		
		return mav;
	} 
	
	@RequestMapping(value="shop/dealpage", method=RequestMethod.GET)
	public ModelAndView dealpage(HttpSession session, Integer shop_no) {
		System.out.println("구매/판매 진행중 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopService.getShop(shop_no);
		
		System.out.println(shop_no);
		 
		User sellerUser = userService.getUser(shop.getShop_seller_id());
		User buyerUser = userService.getUser(shop.getShop_buyer_id());
		
		mav.addObject("sellerUser", sellerUser);
		mav.addObject("buyerUser", buyerUser);
		
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		
		return mav;
	}
	
	// 중고 장터 게시물 구매 진행 페이지 
	@RequestMapping(value="shop/dealpage", method=RequestMethod.POST)
	public ModelAndView dealpage(HttpSession session, Integer shop_no, Integer coin) {
		System.out.println("구매/판매 진행중 페이지 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopService.getShop(shop_no);
		
		System.out.println(coin);
		System.out.println(shop_no);
		
		
		User loginUser = (User) session.getAttribute("loginUser");
		System.out.println(loginUser);

		if(shop.getShop_status().equals("0")) {
			try {
				System.out.println("판매자, 구매자 코인 사용");
				String shop_buyer_id = loginUser.getId();
				
				// 코인 체크
				String coinCheck = userService.checkCoin(coin, shop_buyer_id);
				System.out.println("코인 체크 " + coinCheck);
				if(coinCheck.equals("0")) {
					System.out.println("코인 부족");
					throw new Exception();
				} 
				
				shopService.shopBuyerUpdate(shop.getShop_no(), shop_buyer_id);
				
				userService.updateBuyerCoin(coin, loginUser.getId());
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new ShopException("코인이 부족합니다", "../shop/list.zips");
			}
		}    
		
		shop = shopService.getShop(shop_no);
		User sellerUser = userService.getUser(shop.getShop_seller_id());
		User buyerUser = userService.getUser(shop.getShop_buyer_id());
		
		mav.addObject("sellerUser", sellerUser);
		mav.addObject("buyerUser", buyerUser);
		
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		mav.addObject("coin");
		mav.addObject(loginUser);
		return mav;
	}
	
	@RequestMapping(value="shop/dealcancel", method=RequestMethod.POST)
	public ModelAndView dealcancel(HttpSession session, Integer shop_no, String shop_id, Integer coin) {
		System.out.println("구매/판매 취소 호출");
		ModelAndView mav = new ModelAndView();
		Shop shop = shopService.getShop(shop_no);
		
		System.out.println(shop_no);
		
		if(shop_id.equals(shop.getShop_seller_id())) {
			String shop_seller_id = shop_id;
			if(shop.getShop_buyer_confirm().equals(1)) {
				userService.updateSellerCoinCancel(coin, shop_seller_id);
			}
			userService.updateBuyerCoinCancel(coin, shop.getShop_buyer_id());
			shopService.shopDealCancel(shop_no);
		
		} else if (shop_id.equals(shop.getShop_buyer_id())) {
			if(shop.getShop_buyer_confirm().equals(1)) {
				userService.updateSellerCoinCancel(coin, shop.getShop_seller_id());
			}
			String shop_buyer_id = shop_id;
			userService.updateBuyerCoinCancel(coin, shop_buyer_id);
			shopService.shopDealCancel(shop_no);
		}
		
		mav.setViewName("redirect:list.zips");
		mav.addObject("shop_no",shop_no);
		mav.addObject("shop", shop);
		
		return mav;
	}
	
	
	// AJAX 인수인계 확인 체크 
	@ResponseBody
	@RequestMapping(value="shop/checkConfirm")
	public String checkconfirm(HttpSession session, Integer shop_no, String confirmType) {
		System.out.println("AJAX 인수 인계 확인 체크");
		return shopService.checkConfirm(shop_no, confirmType);
	}
	
	// AJAX 인수 인계 확인
	@ResponseBody
	@RequestMapping(value="shop/confirmShop")
	public String confirmShop(HttpSession session, Integer shop_no, String confirmType, Integer coin, String shop_seller_id) {
		System.out.println("AJAX 인수 인계 확인");
		shopService.confirmShop(shop_no, confirmType);
		
		System.out.println(shop_no+ confirmType+ coin+ shop_seller_id);
		// 인수시 나옴
		if(confirmType.equals("shop_buyer_confirm")) {
			userService.updateSellerCoin(coin, shop_seller_id);
		}
		return "완료";
	}
}
 