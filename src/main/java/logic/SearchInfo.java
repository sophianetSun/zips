package logic;

import java.io.Serializable;
import java.util.Date;

public class SearchInfo implements Serializable {
	private Integer num;
	private String id;
	private String content;
	private Date regdate;
	
	// Constructor
	public SearchInfo(Integer num, String id, String content, Date regdate) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	
	public SearchInfo() { }

	// Getter, Setter, toString
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "SearchInfo [num=" + num + ", id=" + id + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
}
