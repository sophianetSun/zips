package controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import logic.MainService;
import logic.Message;
import logic.Shop;
import logic.ShopService;
import logic.User;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	@Autowired
	private ShopService shopService;
	
	@RequestMapping("main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("main");
		List<Shop> shopList = shopService.shopList("shop_subject", "", 1, 5);
		mav.addObject("shopList", shopList);
		return mav;
	}
	
	@RequestMapping("search")
	public ModelAndView search(String query, HttpSession session) {
		ModelAndView mav = new ModelAndView("main/searchResult");
		if (query != null && !query.equals(""))
			mainService.inputSearch(query, session);
		Map<String, Long> map = mainService.analyzeSearchResult();
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("message")
	public ModelAndView message(HttpSession session) {
		ModelAndView mav = new ModelAndView("main/message");
		User user = (User)session.getAttribute("loginUser");
		if (user == null) {
			mav.setViewName("redirect:/main.zips");
			return mav;
		}
		String id = user.getId();
		List<Message> msgList = mainService.getMsgList(id, "");
		mav.addObject("msgList", msgList);
		mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping("calendar")
	public String calendar() {
		return "main/calendar";
	}
	
	@RequestMapping("myInfoCal")
	public String myInfoCal() {
		return "main/myInfoCal";
	}
	// RestfulAPI
	@RequestMapping(value="myinfo/search", produces="application/text; charset=utf8")
	@ResponseBody
	public String mySearchInfo(String searchType, String searchText) {
		// searchType 에 따라 푸드 디비 or 워크아웃 결정
		return mainService.getFoodDBList(searchText).toString();
	}
	
	@RequestMapping(value="message/list", produces = "application/text; charset=utf8")
	@ResponseBody
	public String msgList(String receiverId, String senderId) {
		return mainService.getMsgList(receiverId, senderId).toString();
	}
	
	@RequestMapping(value="message/send")
	public ModelAndView sendMsg(Message msg, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/message.zips");
		User user = (User)session.getAttribute("loginUser");
		String senderId = user.getId();
		msg.setSender(senderId);
		try {
			mainService.sendMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			return mav;
		} finally {			
			return mav;
		}
	}
	
	@RequestMapping(value="message/hide", produces="application/json; charset=utf8")
	@ResponseBody
	public String hideMsg(Message msg, HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		String userId = user.getId();
		msg = mainService.getMsgById(Integer.toString(msg.getNum()));
		if (msg.getReceiver().equals(userId)) {
			msg.setReceiverStatus(0);
			msg.setSenderStatus(1);
		} else {
			msg.setSenderStatus(0);
			msg.setReceiverStatus(1);
		}
		try {
			mainService.hideMsg(msg);			
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		} 
		return "success";
	}
}
