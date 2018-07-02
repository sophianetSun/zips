package controller;

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
		String id = (String)session.getAttribute("login");
		List<Message> msgList = mainService.getMsgList("test1234", "");
		mav.addObject("msgList", msgList);
		return mav;
	}
	
	// RESTAPI
	@RequestMapping(value="message/list", produces = "application/text; charset=utf8")
	@ResponseBody
	public String msgList(String receiverId, String senderId) {
		return mainService.getMsgList(receiverId, senderId).toString();
	}
	
	@RequestMapping(value="message/send", produces="application/json; charset=utf8")
	@ResponseBody
	public String sendMsg(Message msg, HttpSession session) {
		String senderId = (String)session.getAttribute("login");
		msg.setSender(senderId);
		try {
			mainService.sendMsg(msg);
		} catch (Exception e) {
			return "fail";
		} finally {			
			return "success";
		}
	}
	
	@RequestMapping("message/hide")
	@ResponseBody
	public String hideMsg(Message msg, HttpSession session) {
		String senderId = (String)session.getAttribute("login");
		try {
			mainService.hideMsg(msg);			
		} catch (Exception e) {
			return "fail";
		} finally {
			return "success";
		}
	}
}
