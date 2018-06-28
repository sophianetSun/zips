package logic;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Board implements Serializable{
	private int num;
	private String board_userid;
	@NotEmpty(message="제목을 입력해주세요")
	private String subject;
	@NotEmpty(message="내용을 입력해주세요")
	private String content;
	private int board_count;
	private String fileurl;
	private Date regdate;
	private Date moddate;
	private int recommand;
	private int admin_alert;
	private int board_type;
	private MultipartFile filename;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoard_userid() {
		return board_userid;
	}
	public void setBoard_userid(String board_userid) {
		this.board_userid = board_userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	public int getRecommand() {
		return recommand;
	}
	public void setRecommand(int recommand) {
		this.recommand = recommand;
	}
	public int getAdmin_alert() {
		return admin_alert;
	}
	public void setAdmin_alert(int admin_alert) {
		this.admin_alert = admin_alert;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public MultipartFile getFilename() {
		return filename;
	}
	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", board_userid=" + board_userid + ", subject=" + subject + ", content=" + content
				+ ", board_count=" + board_count + ", fileurl=" + fileurl + ", regdate=" + regdate + ", moddate="
				+ moddate + ", recommand=" + recommand + ", admin_alert=" + admin_alert + ", board_type=" + board_type
				+ ", filename=" + filename + "]";
	}
	
}
