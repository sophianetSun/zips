package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	
	@RequestMapping("/search")
	public ModelAndView search(String query, HttpSession session) {
		ModelAndView mav = new ModelAndView("main/searchResult");
		if (query != null && !query.equals(""))
			mainService.inputSearch(query, session);
		Map<String, Long> map = mainService.analyzeSearchResult();
		mav.addObject("map", map);
		return mav;
	}
	
}
