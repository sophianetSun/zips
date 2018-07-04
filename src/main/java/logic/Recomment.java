package logic;

import java.io.Serializable;
import java.util.Date;

public class Recomment implements Serializable{
	private int co_no;
	private int num;
	private String co_userid;
	private int ref_board_no;
	private String co_content;
	private Date co_regdate;
	private Date co_moddate;
	private int co_apply;
	private int board_type;
	
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCo_userid() {
		return co_userid;
	}
	public void setCo_userid(String co_userid) {
		this.co_userid = co_userid;
	}
	public int getRef_board_no() {
		return ref_board_no;
	}
	public void setRef_board_no(int ref_board_no) {
		this.ref_board_no = ref_board_no;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public Date getCo_regdate() {
		return co_regdate;
	}
	public void setCo_regdate(Date co_regdate) {
		this.co_regdate = co_regdate;
	}
	public Date getCo_moddate() {
		return co_moddate;
	}
	public void setCo_moddate(Date co_moddate) {
		this.co_moddate = co_moddate;
	}
	public int getCo_apply() {
		return co_apply;
	}
	public void setCo_apply(int co_apply) {
		this.co_apply = co_apply;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	
	@Override
	public String toString() {
		return "Recomment [co_no=" + co_no + ", num=" + num + ", co_userid=" + co_userid + ", ref_board_no="
				+ ref_board_no + ", co_content=" + co_content + ", co_regdate=" + co_regdate + ", co_moddate="
				+ co_moddate + ", co_apply=" + co_apply + ", board_type=" + board_type + "]";
	}
	
	
}
