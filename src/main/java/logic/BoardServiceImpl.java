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

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Autowired
    private BestDao bestDao;
	
	@Autowired
	private RecommentDao recommentDao;
	
	@Override
	public int boardcount(String searchType, String searchContent) {
		return boardDao.count(searchType,searchContent);
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
	public int boardDelete(Board board, HttpServletRequest request) {
		return boardDao.delete(board,request);
	}

	@Override
	public int boardupdate(Board board, HttpServletRequest request) {
		return boardDao.update(board,request);
	}

	@Override
	public int boardrecommand(Recomment recomment,String co_userid,String content,Integer board_type) {
		return recommentDao.recommand(recomment,co_userid,content,board_type);
	}

	@Override
	public int bestcnt(Board board, String userid) {
		return bestDao.best(board,userid);
	}

	@Override
	public List<Board> totalboardList(Integer board_type,String searchType, String searchContent, Integer pageNum, int limit) {
		return boardDao.totallist(board_type,searchType,searchContent,pageNum,limit);
	}


	


		
}
