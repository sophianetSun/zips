package logic;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable {
	private Integer num;
	private String sender;
	private Integer senderStatus;
	private String receiver;
	private Integer receiverStatus;
	private String content;
	private Date regdate;
	
	// Constructor
	public Message() { }
	
	public Message(Integer num, String sender, Integer senderStatus, String receiver, Integer receiverStatus,
			String content, Date regdate) {
		this.num = num;
		this.sender = sender;
		this.senderStatus = senderStatus;
		this.receiver = receiver;
		this.receiverStatus = receiverStatus;
		this.content = content;
		this.regdate = regdate;
	}
	// Getter, Setter, toString
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public Integer getSenderStatus() {
		return senderStatus;
	}

	public void setSenderStatus(Integer senderStatus) {
		this.senderStatus = senderStatus;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Integer getReceiverStatus() {
		return receiverStatus;
	}

	public void setReceiverStatus(Integer receiverStatus) {
		this.receiverStatus = receiverStatus;
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
		return "{\"Message\" : "
				+ "{\"num\":\"" + num + "\", "
				+ "\"sender\":\"" + sender + "\", "
				+ "\"senderStatus\":\"" + senderStatus + "\", "
				+ "\"receiver\":\"" + receiver + "\", "
				+ "\"receiverStatus\":\"" + receiverStatus + "\", "
				+ "\"content\":\"" + content + "\", "
				+ "\"regdate\":\"" + regdate
				+ "\"}"
				+ "}";
	}
	
}
