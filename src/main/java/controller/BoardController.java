package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Board;
import logic.BoardService;
import logic.Recomment;
import logic.User;

@Controller
public class BoardController {

	@Autowired 
	private BoardService service;
	
	
	@RequestMapping(value="board/bestcnt" , method = RequestMethod.POST)
	public ModelAndView best(@Valid Board board , HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String) session.getAttribute("id");
		System.out.println(userid);
		int result = service.bestcnt(board,userid);
		System.out.println(result);
		if(result > 0) {
			mav.setViewName("redirect:homeTraininglist.zips");
		} 
		return mav;
	}
	
	@RequestMapping("board/homeTraininglist")
	public ModelAndView list(Integer board_type ,Integer num,Integer pageNum, String searchType, String searchContent) {
		if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
			ModelAndView mav = new ModelAndView();
			int limit = 9;
			int listcount = service.boardcount(searchType,searchContent);
			List<Board> boardlist = service.boardList(board_type,searchType,searchContent,pageNum,limit);
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
	
	@RequestMapping("board/totallist")
	public ModelAndView totallist(Integer board_type,Integer num,Integer pageNum, String searchType, String searchContent) {
			if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
			ModelAndView mav = new ModelAndView();
			int limit = 9;
			int listcount = service.boardcount(searchType,searchContent);
			List<Board> boardlist = service.totalboardList(board_type,searchType,searchContent,pageNum,limit);
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;
			int endpage = startpage + 9;
			if(endpage > maxpage) endpage = maxpage;
			int boardcnt = listcount - (pageNum - 1) * limit;
			mav.addObject("pageNum2",pageNum);
			mav.addObject("maxpage2",maxpage);
			mav.addObject("startpage2",startpage);
			mav.addObject("endpage2",endpage);
			mav.addObject("listcount2",listcount);
			mav.addObject("boardlist2",boardlist);
			mav.addObject("boardcnt2",boardcnt);
			
			return mav;
	}

/*	@RequestMapping(value="board/zipscomment" , method = RequestMethod.POST)
	public ModelAndView zipscomment(@Valid Board board , Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		int result = service.boardzipscomment(board);
		if(result > 0) {
			mav.setViewName("redirect:homeTraininglistForm.zips?num="+board.getNum()+"&board_type="+board.getBoard_type());
		}
		return mav;
	}*/
	
	
	@RequestMapping(value="board/zipscomment" , method = RequestMethod.POST)
		public ModelAndView zipscomment(@Valid Recomment recomment ,String content,String num,Integer board_type , Integer pageNum2, HttpSession session) {
		System.out.println("zipscomment컨트롤러 딴ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		ModelAndView mav = new ModelAndView();
			try {
			User loginUser = (User) session.getAttribute("loginUser");
			String co_userid = loginUser.getId();
			System.out.println("보드유저값"+co_userid);
			System.out.println("보드내용값"+content);
			System.out.println("보드타입"+board_type);
			System.out.println("보드num"+num);
			System.out.println("recomment값"+recomment);
			
			/*System.out.println("보드넘값"+board.getNum());
			System.out.println("보드타입값"+board.getBoard_type());*/
			int result = service.boardrecommand(recomment,co_userid,content,board_type);
			if(result > 0) {
				mav.setViewName("redirect:totallistForm.zips?num=1"+"&board_type="+board_type);
			} 
			} catch(Exception e) {
				e.printStackTrace();
			}
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
		int boardtype = board.getBoard_type();
		if(boardtype == 1) {
			if(result > 0) {
				mav.setViewName("redirect:homeTraininglist.zips?num="+board.getNum()+"&board_type="+board.getBoard_type());
			} 
		} else if (boardtype >= 2) {
			if(result > 0) {
				mav.setViewName("redirect:totallist.zips?num="+board.getNum()+"&board_type="+board.getBoard_type());
			} 
		}
		
		return mav;
	}
	
	@RequestMapping("board/homeTraininglistForm")
	public ModelAndView homeTraininglistForm(@Valid int num,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(num);
		String url = request.getServletPath();
		if(url.contains("/board/homeTraininglistForm.zips")) {
			service.updatereadcnt(num);
		}
		mav.addObject("num",num);
		mav.addObject("board",board);
		return mav;
}
	
	@RequestMapping("board/totallistForm")
	public ModelAndView totallistForm(@Valid int num,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(num);
		String url = request.getServletPath();
		if(url.contains("/board/totallistForm.zips")) {
			service.updatereadcnt(num);
		}
		mav.addObject("num",num);
		mav.addObject("board",board);
		return mav;
}
	@RequestMapping(value="board/delete" , method = RequestMethod.POST)
	public ModelAndView delete(@Valid Board board,Integer board_type, BindingResult bindingResult , HttpServletRequest request,Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		Board dbUser = service.getBoard(board.getNum());
		System.out.println("dbUser 의 값 "+dbUser);	
		try {
				int result = service.boardDelete(board,request);
				if(result > 0) {
					mav.setViewName("redirect:homeTraininglist.zips?board_type="+board_type);
				} 
			}catch(Exception e) {
			throw new ShopException("게시물 삭제 실패", "delete.zips?num="+board.getNum()+"&pageNum="+pageNum+"&board_type="+board_type);
		}
		return mav;
	}
	
	@RequestMapping(value="board/update" , method = RequestMethod.POST)
	public ModelAndView update(@Valid Board board,Integer board_type ,BindingResult bindingResult , HttpServletRequest request , HttpSession session,Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		if(board.getFilename() == null || board.getFilename().isEmpty()) {
			board.setFileurl(request.getParameter("file2"));
		}
		try {
				int result = service.boardupdate(board,request);
				if(result > 0) {
					mav.setViewName("redirect:homeTraininglist.zips?board_type="+board_type);
				} 
			} catch(Exception e) {
				throw new ShopException("게시물 수정 실패", "update.zips?num"+board.getNum()+"&pageNum="+pageNum+"&board_type="+board_type);
			}
		return mav;
	}
	
	@RequestMapping(value="board/*" , method = RequestMethod.GET)
	public ModelAndView detail(Integer num,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if(num != null) {
			board = service.getBoard(num);
			
		}
		mav.addObject("board",board);
		return mav;
	}
	
}


