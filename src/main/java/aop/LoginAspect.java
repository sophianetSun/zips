package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

// 1. 로그인이 안된 경우 : 로그인이 필요합니다. /user/login.shop
// 2. 카트가 비어있는 경우 : 장바구니가 비었습니다. /item/list.shop

@Component
@Aspect 
public class LoginAspect {
	// UserController.mypage(String id, HttpSession session)
	// 메서드가 호출전에 userLoginCheck(..) 메서드가 호출
	/*
   @Around("execution(* controller.User*.my*(..))")
   public Object userLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable{      
      String id = null;
      HttpSession session = null;
      User paramUser = null;
      
      if(joinPoint.getArgs()[0] instanceof User) {
    	  paramUser = (User)joinPoint.getArgs()[0];
    	  session = (HttpSession)joinPoint.getArgs()[2];
    	  id = paramUser.getUserId();
      } else {
    	  id = (String)joinPoint.getArgs()[0];
    	  session = (HttpSession)joinPoint.getArgs()[1];
      } 
      
      User loginUser = (User)session.getAttribute("loginUser");
      if(loginUser == null) {
         throw new LoginException("로그인 후 거래하세요.","../user/login.shop");
      }
      if(!id.equals(loginUser.getUserId()) && !loginUser.getUserId().equals("admin")) {
         throw new LoginException("본인만 거래 가능합니다.", "../user/mypage.shop?id="+loginUser.getUserId());
      }
      Object ret = joinPoint.proceed();
      return ret;
   
   }
   
   // 1. 로그인이 안된 경우 : 로그인이 필요합니다. /user/login.shop
   // 2. 카트가 비어있는 경우 : 장바구니가 비었습니다. /item/list.shop
   
   @Around("execution(* controller.Cart*.check*(..))")
   public Object cartUserLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable{      
      HttpSession session = (HttpSession)joinPoint.getArgs()[0];  
      Cart cart = (Cart)session.getAttribute("CART");
      User loginUser = (User)session.getAttribute("loginUser");
      if(loginUser == null) {
    	  throw new LoginException("로그인 후 거래하세요.","../user/login.shop");
      }
      
      if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException("장바구니에 계산할 상품이 없습니다.","../item/list.shop");
      }
      
      Object ret = joinPoint.proceed();
      return ret;
   }
   
   
   @Around("execution(* controller.Admin*.admin*(..))")
   public Object adminLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
	   HttpSession session = null;
	   User loginUser = null;
	   boolean adminable = false;
	   for(int i=0; i<joinPoint.getArgs().length; i++) {
		   if(joinPoint.getArgs()[i] instanceof HttpSession) {
			   session = (HttpSession)joinPoint.getArgs()[i];
			   loginUser = (User)session.getAttribute("loginUser");
			   if(loginUser == null) {
				   throw new LoginException("관리자로 로그인 하세요", "../user/login.shop");
			   }
			   if(!loginUser.getUserId().equals("admin")) {
			       throw new LoginException("관리자만 가능한 거래 가능합니다.", "../user/mypage.shop?id="+loginUser.getUserId());
			   }
			   adminable = true;
			   break;
		   }
	   }
	   if(!adminable) {
		   throw new LoginException("전산부로 전화 하세요. 세션 객체 요구됩니다", "../user/mypage.shop?id="+loginUser.getUserId());
	   }
	   Object ret = joinPoint.proceed();
	   return ret;
   }
   */
}
