package logic;

import java.io.Serializable;

public class Best implements Serializable {

	private int num;
	private String rec_user;
	private int rec_board_type;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRec_user() {
		return rec_user;
	}
	public void setRec_user(String rec_user) {
		this.rec_user = rec_user;
	}
	public int getRec_board_type() {
		return rec_board_type;
	}
	public void setRec_board_type(int rec_board_type) {
		this.rec_board_type = rec_board_type;
	}
	@Override
	public String toString() {
		return "Best [num=" + num + ", rec_user=" + rec_user + ", rec_board_type=" + rec_board_type + "]";
	}
	
	
	
}
