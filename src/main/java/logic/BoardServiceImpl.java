package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BestDao;
import dao.BoardDao;
import dao.RecommentDao;
import dao.ShopDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Autowired
    private BestDao bestDao;
	
	@Autowired
	private RecommentDao recommentDao;
	
	@Override
	public int boardcount(Integer board_type,String searchType, String searchContent) {
		return boardDao.count(board_type,searchType,searchContent);
	}

	@Override
	public List<Board> boardList(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit) {
		return boardDao.list(board_type,searchType,searchContent,pageNum,limit);
	}

	@Override
	public int boardinsert(Board board, HttpServletRequest request) {
		if(board.getFilename() != null && !board.getFilename().isEmpty()) {
			uploadFileCreate(board.getFilename(),request); //파일 생성
			board.setFileurl(board.getFilename().getOriginalFilename());
		}
		int num = boardDao.maxNum();
		board.setNum(++num);
		return boardDao.insert(board);
	}

	private void uploadFileCreate(MultipartFile filename, HttpServletRequest request) {
		// picture : 업로드된 파일의 내용 저장 왜냐? 매개변수로 오기전에 item.getPicture()라는 값을 넣어줬기 때문 
		// ↓ 파일 업로드 위치 저장
		String uploadPath = request.getServletContext().getRealPath("/") + "/img/"; // 진짜 파일 경로 
		System.out.println(uploadPath);
		String orgFile = filename.getOriginalFilename(); // 원래 파일 이름
		try {
			//new File (uploadPath + orgFile) : 파일 객체 설정 \
			// transferTo : 안에 내용을 파일로 만들어주는 함수 Api
			filename.transferTo(new File(uploadPath + orgFile)); // 파일이름과 진짜 파일 경로를 합친 file 생성
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Board getBoard(Integer num) {
		return boardDao.getBoard(num);
	}

	@Override
	public void updatereadcnt(Integer num) {
		boardDao.readcnt(num);
	}

	@Override
	public int boardDelete(Integer num) {
		return boardDao.delete(num);
	}

	@Override
	public int boardupdate(Board board, HttpServletRequest request) {
		return boardDao.update(board,request);
	}

	@Override
	public int boardrecommand(Recomment recomment,Integer board_type) {
		int co_no = recommentDao.maxco_Num();
		recomment.setCo_no(++co_no);
		return recommentDao.recommand(recomment,board_type);
	}

	@Override
	public int best(Best best,Integer num) {
		boardDao.recommand(num);
	 	return bestDao.best(best);
	}

	@Override
	public List<Board> totalboardList(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit) {
		return boardDao.totallist(board_type,searchType,searchContent,pageNum,limit);
	}


	@Override
	public List<Recomment> recommentList(Integer board_type,int num) {
		return recommentDao.recommentlist(board_type,num);
	}

	@Override
	public void apply(Integer co_no,Integer num) {
		recommentDao.apply(co_no,num);
		boardDao.board_applyupdate(num);
	}

	@Override
	public void noapply(Integer num) {
		recommentDao.noapply(num);
	}

	@Override
	public int recount(Integer num) {
		return recommentDao.recount(num);
	}

	@Override
	public int Hrecommand(Recomment recomment, Integer board_type) {
		int co_no = recommentDao.maxco_Num();
		recomment.setCo_no(++co_no);
		return recommentDao.Hrecommand(recomment, board_type);
	}

	@Override
	public int bestcnt(Best best) {
		return bestDao.bestcnt(best);
		
	}

	/*@Override
	public List<Best> getbest(int num) {
		return bestDao.getbest(num);
	}*/

	@Override
	public Recomment getapply(int num) {
		return recommentDao.getapply(num);
	}

	@Override
	public List<Board> Bestlist(Board board) {
		return boardDao.bestlist(board);
	}

	@Override
	public List<Board> totalBestlist(Board board) {
		return boardDao.totalbestlist(board);
	}
	
	@Override
	public int totalbest(Best best, Integer num) {
		boardDao.totalrecommand(num);
	 	return bestDao.best(best);
	}

	@Override
	public void fileUpload(int num, String originalfileName, String saveFileName, long fileSize) {
		num = boardDao.maxNum();
		boardDao.fileUpload(++num, originalfileName, saveFileName, fileSize);
	}

	@Override
	public List<UploadFile> getFileList(int num) {
		return boardDao.getFileList(num);
	}

	@Override
	public int bestinsert(String board_userid, Integer num, Integer board_type) {
		Best list = getBestlist(board_userid,num);
		if(list == null || list.getNum() != num) {
		boardDao.recommand(num);
		Best best = new Best();
		best.setNum(num);
		best.setRec_board_type(board_type);
		best.setRec_user(board_userid);
		return bestDao.bestinsert(best);
		} else {
			boardDao.deleterecommand(num);
			bestDao.bestdelete(list);
			return 2;
		}
	}

	private Best getBestlist(String board_userid, Integer num) {
		return bestDao.bestlist(board_userid,num);
	}

	public String getApplyId(Integer num) {
		return recommentDao.getApplyId(num);
	}
	public int totalbestinsert(String board_userid, Integer num, Integer board_type) {
		Best list = getBestlist(board_userid,num);
		if(list == null || list.getNum() != num) {
		boardDao.totalrecommand(num);
		Best best = new Best();
		best.setNum(num);
		best.setRec_board_type(board_type);
		best.setRec_user(board_userid);
		return bestDao.bestinsert(best);
		} else {
			boardDao.totaldeleterecommand(num);
			bestDao.bestdelete(list);
			return 2;
		}
	}

	@Override
	public void afterfileUpload(int num, String originalfileName, String saveFileName, long fileSize) {
		num = boardDao.maxNum();
		boardDao.afterfileUpload(++num, originalfileName, saveFileName, fileSize);
	}

}
