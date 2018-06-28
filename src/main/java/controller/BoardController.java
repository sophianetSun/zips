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
	
	@RequestMapping("board/homeTraininglist")
	public ModelAndView list(Integer pageNum, String searchType, String searchContent) {
			if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
			ModelAndView mav = new ModelAndView();
			int limit = 9;
			int listcount = service.boardcount(searchType,searchContent);
			List<Board> boardlist = service.boardList(searchType,searchContent,pageNum,limit);
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;
			int endpage = startpage + 9;
			if(endpage > maxpage) endpage = maxpage;
			int boardcnt = listcount - (pageNum - 1) * limit;
			mav.addObject("pageNum",pageNum);
			mav.addObject("maxpage",maxpage);
			mav.addObject("startpage",startpage);
			mav.addObject("endpage",endpage);
			mav.addObject("listcount",listcount);
			mav.addObject("boardlist",boardlist);
			mav.addObject("boardcnt",boardcnt);
			return mav;
			
			
	}
	
	@RequestMapping(value="board/boardwrite" , method = RequestMethod.POST)
	public ModelAndView detailform(@Valid Board board, BindingResult bindingResult , HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		int result = service.boardinsert(board,request);
		System.out.println(result);
		if(result > 0) {
			mav.setViewName("redirect:homeTraininglist.zips?num="+board.getNum()+"&board_type="+board.getBoard_type());
		} 
		
		return mav;
	}
	
	@RequestMapping(value="board/*" , method = RequestMethod.GET)
	public ModelAndView detail(Integer num,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if(num != null) {
			board = service.getBoard(num);
			String url = request.getServletPath();
			if(url.contains("/board/homeTraininglistForm.zips")) {
				service.updatereadcnt(num);
			}
		}
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping("board/homeTraininglistForm")
	public ModelAndView homeTraininglistForm(@Valid int num,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(num);
		mav.addObject("board",board);
		mav.addObject("num",num);
		System.out.println(num);
		System.out.println(board);
		return mav;
	
}
}

