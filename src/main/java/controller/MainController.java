package controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.BoardService;
import logic.InfoCalendar;
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
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		User user = (User)session.getAttribute("loginUser");
		List<Shop> shopList = shopService.shopList("shop_subject", "", 1, 5);
		mav.addObject("shopList", shopList);
		if (user != null) {
			mav.addObject("userId", user.getId());
		}
		// keys : bestTraining, homeTraining, beforeAndAfter, qna, freeboard 
		mav.addObject("topUserList", mainService.getTopUsers());
		Set<String> keys = mainService.getMainBoards().keySet();
		for(String key : keys) {
			mav.addObject(key, mainService.getMainBoards().get(key));
		}
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
	public ModelAndView myMessage(HttpSession session) {
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
	public ModelAndView myCalendar(HttpSession session) {
		ModelAndView mav = new ModelAndView("main/calendar");
		User user = (User)session.getAttribute("loginUser");
		List<InfoCalendar> list = mainService.loadMyInfoCalendar(user.getId());
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("myInfoCal")
	public String myInfoCal(HttpSession session) {
		return "main/myInfoCal";
	}
	
	@RequestMapping("myinfo/save")
	public ModelAndView mySave(InfoCalendar myinfo, HttpSession session) {
		ModelAndView mav = new ModelAndView("main/calendar");
		User user = (User)session.getAttribute("loginUser");
		myinfo.setUser_id(user.getId());
		int result = mainService.saveMyInfoCalendar(myinfo);
		if (result > 0) {
			List<InfoCalendar> list = mainService.loadMyInfoCalendar(user.getId());
			mav.addObject("list", list);
		}
		return mav;
	}
	
	@RequestMapping("myinfo/graph")
	public ModelAndView myGraph(@RequestParam(value="regdate", required=false) String regdate,
			@RequestParam(value="in_type", required=false) String in_type,
			HttpSession session) {
		User user = (User)session.getAttribute("loginUser");

		if (in_type.equals("0")) {
			ModelAndView mav = new ModelAndView("main/graph");
			Map<String, Double> map;
			if (regdate == null && regdate.equals("")) 	map = mainService.myInfoMap(user.getId());
			else map = mainService.myInfoMap(user.getId(), regdate);
			List<String> words = mainService.myInfoNutriWords(user.getId(), regdate);
			mav.addObject("words", words);
			mav.addObject("map", map);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("main/graph2");
			List<InfoCalendar> list = mainService.getWorkoutList(user.getId());
			List<String> words = mainService.myInfoWorkoutWords(user.getId(), regdate);
			mav.addObject("list", list);
			mav.addObject("words", words);
			return mav;
		}
	}
	
	// RestfulAPI
	@GetMapping(value="user/subscribe", produces="application/json; charset=utf8")
	@ResponseBody
	public String mySubscribeapi(String userId, String subId, HttpSession session) {
		int result = mainService.subscribe(userId, subId); 
		if (result == 1) return "{\"result\" : 1, \"subId\" : \"" + subId + "\"}";
		else if (result == 2) return "{\"result\" : 2, \"subId\" : \"" + subId + "\"}";
		else return "{\"result\" : 0}";
	}
	
	@GetMapping(value="graphapi", produces="application/json; charset=utf8")
	@ResponseBody
	public Map<String, Double> graphapi(String id) {
		Map<String, Double> map;
		map = mainService.myInfoMap(id);
		return map;
	}
	
	@RequestMapping(value="myinfo/search", produces="application/text; charset=utf8")
	@ResponseBody
	public String mySearchInfo(String searchType, String searchText, HttpSession session) {
		// searchType 에 따라 푸드 디비 or 워크아웃 결정
		if (searchText == null || searchText.equals("")) return "";
		if (searchType.equals("food")) {
			return mainService.getFoodDBList(searchText).toString();			
		} else {
			return mainService.getWorkoutDBList(searchText).toString();
		}
	}
	
	@RequestMapping(value="message/list", produces = "application/text; charset=utf8")
	@ResponseBody
	public String msgList(String receiverId, String senderId) {
		return mainService.getMsgList(receiverId, senderId).toString();
	}
	
	@RequestMapping(value="message/get", produces="application/json; charset=utf8")
	@ResponseBody
	public Message getMsg(String num) {
		return mainService.getMsgById(num);
	}
	
	@RequestMapping(value="message/send")
	public ModelAndView mySendMsg(Message msg, HttpSession session) {
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
	public String myHideMsg(Message msg, HttpSession session) {
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
