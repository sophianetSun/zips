package logic;

import java.io.Serializable;

public class Subscription implements Serializable {
	private Integer num;
	private String userId;
	private String subscribeId;
	
	// Constructor
	public Subscription(Integer num, String userId, String subscribeId) {
		this.num = num;
		this.userId = userId;
		this.subscribeId = subscribeId;
	}
	
	public Subscription() { }

	// Getter, Setter, toString
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSubscribeId() {
		return subscribeId;
	}

	public void setSubscribeId(String subscribeId) {
		this.subscribeId = subscribeId;
	}
	
}
