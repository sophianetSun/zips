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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import exception.ShopException;
import logic.Best;
import logic.Board;
import logic.BoardService;
import logic.Recomment;
import logic.User;

@Controller
public class BoardController {

	@Autowired 
	private BoardService service;
	
	
	@RequestMapping("board/best")
	public ModelAndView chbest(HttpSession session,Best best,Board board, String board_userid) {
		ModelAndView mav = new ModelAndView();
	    User sessionId = (User) session.getAttribute("loginUser");
	    sessionId.getId();
		Integer num = board.getNum();
	   best.setNum(board.getNum());
	   best.setRec_user(board_userid);
	   best.setRec_board_type(board.getBoard_type());
	   List<Best> dbbest = service.getbest(board.getNum());
	   if(dbbest.iterator().hasNext()) {
		 for(int i=0; i<dbbest.size(); i++) {
			 dbbest.iterator().next().getRec_user();
			 if(!dbbest.iterator().next().getRec_user().equals(sessionId.getId())) {
				 int result = service.best(best,num);
				 if(result > 0) {
					 mav.setViewName("redirect:homeTraininglistForm.zips?board_type="+board.getBoard_type()+"&num="+board.getNum());
				 } 
			 } else {
				 throw new BoardException("해당 게시물은 이미 추천을 누르셨습니다", "homeTraininglistForm.zips?board_type="+board.getBoard_type()+"&num="+board.getNum());
			 }
		 }
	   }
			int bestcnt = service.bestcnt(best);
			mav.addObject("bestcnt",bestcnt);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="board/apply")
	public String chapply(HttpSession session,Board board,Integer co_no,Integer num, HttpServletRequest request) {
		
		service.noapply(num);
		service.apply(co_no,num);
		
		return "채택";
	}
	
	@RequestMapping("board/homeTraininglist")
	public ModelAndView list(Best best,Board board,Integer board_type ,Integer num,Integer pageNum, String searchType, String searchContent) {
		if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
			ModelAndView mav = new ModelAndView();
			best.setNum(board.getNum());
			int bestcnt = service.bestcnt(best);
			int limit = 9;
			int listcount = service.boardcount(board_type, searchType,searchContent);
			int recount = service.recount(num);
			List<Board> Bestlist = service.Bestlist(board);
			List<Board> boardlist = service.boardList(board_type,searchType,searchContent,pageNum,limit);
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;
			List<Best> dbbest = service.getbest(board.getNum());
			int endpage = startpage + 9;
			if(endpage > maxpage) endpage = maxpage;
			int boardcnt = listcount - (pageNum - 1) * limit;
			mav.addObject("Bestlist",Bestlist);
			mav.addObject("dbbest",dbbest);
			mav.addObject("bestcnt",bestcnt);
			mav.addObject("recount",recount);
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
	public ModelAndView totallist(@Valid Recomment recomment, Integer board_type,Integer num,Integer pageNum, String searchType, String searchContent) {
			if(pageNum == null || pageNum.toString().equals("")) {
				pageNum = 1;
			}
			ModelAndView mav = new ModelAndView();
			int limit = 9;
			int listcount = service.boardcount(board_type,searchType,searchContent);
			List<Board> boardlist = service.totalboardList(board_type,searchType,searchContent,pageNum,limit);
			
			int recount = service.recount(num);
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;
			int endpage = startpage + 9;
			if(endpage > maxpage) endpage = maxpage;
			int boardcnt = listcount - (pageNum - 1) * limit;
			mav.addObject("recount",recount);
			mav.addObject("pageNum",pageNum);
			mav.addObject("maxpage2",maxpage);
			mav.addObject("startpage2",startpage);
			mav.addObject("endpage2",endpage);
			mav.addObject("listcount2",listcount);
			mav.addObject("boardlist2",boardlist);
			mav.addObject("boardcnt2",boardcnt);
			return mav;
	}


	@RequestMapping("board/zipscomment")
		public ModelAndView chzipscomment(@Valid HttpSession session, Recomment recomment,Integer board_type , Integer pageNum2) {
		ModelAndView mav = new ModelAndView();
			try {
				
			recomment.setRef_board_no(board_type);
			int result = service.boardrecommand(recomment,board_type);
			if(result > 0) {
				mav.addObject("co_no",recomment.getCo_no());
				mav.setViewName("redirect:totallistForm.zips?num="+recomment.getNum()+"&board_type="+board_type);
			} 
			} catch(Exception e) {
				e.printStackTrace();
			}
			return mav;
		}
	@RequestMapping(value="board/recomment" , method = RequestMethod.POST)
	public ModelAndView chrecomment(@Valid HttpSession session,Recomment recomment,Integer board_type , Integer pageNum2) {
		
	ModelAndView mav = new ModelAndView();
		try {
		recomment.setRef_board_no(board_type);
		int result = service.Hrecommand(recomment,board_type);
		if(result > 0) {
			if(board_type == 1) {
				mav.addObject("co_no",recomment.getCo_no());
				mav.setViewName("redirect:homeTraininglistForm.zips?num="+recomment.getNum()+"&board_type="+board_type);
			} else {
				mav.addObject("co_no",recomment.getCo_no());
				mav.setViewName("redirect:totallistForm.zips?num="+recomment.getNum()+"&board_type="+board_type);
			}
		} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="board/boardwrite" , method = RequestMethod.POST)
	public ModelAndView chdetailform(@Valid HttpSession session, Board board, BindingResult bindingResult , HttpServletRequest request) {
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
	public ModelAndView homeTraininglistForm(@Valid Recomment recomment,Best best,Integer board_type,int num,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(num);
		int recount = service.recount(num);
		best.setNum(num);
		List<Best> dbbest = service.getbest(num);
		int bestcnt = service.bestcnt(best);
		List<Recomment> recommentlist = service.recommentList(board_type,num);
		String url = request.getServletPath();
		if(url.contains("/board/homeTraininglistForm.zips")) {
			service.updatereadcnt(num);
		}
		mav.addObject("dbbest",dbbest);
		mav.addObject("bestcnt",bestcnt);
		mav.addObject("num",num);
		mav.addObject("board",board);
		mav.addObject("recount",recount);
		mav.addObject("recommentlist",recommentlist);
		return mav;
}
	 
	@RequestMapping("board/totallistForm")
	public ModelAndView totallistForm(@Valid Recomment recomment,Integer board_type,int num,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(num);
		int recount = service.recount(num);
		recomment = service.getapply(num);
		List<Recomment> recommentlist = service.recommentList(board_type,num);
		String url = request.getServletPath();
		if(url.contains("/board/totallistForm.zips")) {
			service.updatereadcnt(num);
		}
		mav.addObject("recomment",recomment);
		mav.addObject("num",num);
		mav.addObject("board",board);
		mav.addObject("recount",recount);
		mav.addObject("recommentlist",recommentlist);
		return mav;
}
	@RequestMapping(value="board/delete" , method = RequestMethod.POST)
	public ModelAndView chdelete2(@RequestParam HttpSession session, HashMap<String,String> map) {
		System.out.println(map);
		int result = service.boardDelete(Integer.parseInt(map.get("num")));
		ModelAndView mav = new ModelAndView();
		if(result > 0) {
			if(Integer.parseInt(map.get("board_type")) == 1) {
				mav.setViewName("redirect:homeTraininglist.zips?num="+map.get("num")+"&board_type="+map.get("board_type"));
			} else {
				mav.setViewName("redirect:totallist.zips?num="+map.get("num")+"&board_type="+map.get("board_type"));
			}
		} 
		return mav;
	}
	
	@RequestMapping(value="board/update" , method = RequestMethod.POST)
	public ModelAndView chupdate(@Valid HttpSession session, Board board,Integer board_type ,BindingResult bindingResult , HttpServletRequest request,Integer pageNum) {
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
					if(board_type == 1) {
						mav.setViewName("redirect:homeTraininglist.zips?num="+board.getNum()+"&board_type="+board_type);
					} else {
						mav.setViewName("redirect:totallist.zips?num="+board.getNum()+"&board_type="+board_type);
					}
				} 
			} catch(Exception e) {
				throw new ShopException("게시물 수정 실패", "update.zips?num"+board.getNum()+"&pageNum="+pageNum+"&board_type="+board_type);
			}
		return mav;
	}
	
	@RequestMapping(value="board/*" , method = RequestMethod.GET)
	public ModelAndView detail(HttpSession session ,Integer num,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if(num != null) {
			board = service.getBoard(num);
			
		}
		mav.addObject("board",board);
		return mav;
	}
	
}


