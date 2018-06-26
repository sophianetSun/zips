package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.BoardService;

@Controller
public class BoardController {

	@Autowired 
	private BoardService service;
	
	@RequestMapping("board/*")
	public ModelAndView list(Integer pageNum, String searchType, String searchContent) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
}
