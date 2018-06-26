package logic;

import java.io.Serializable;

public class Subscription implements Serializable {
	private Integer num;
	private String userId;
	private String SubscribeId;
	
	// Constructor
	public Subscription(Integer num, String userId, String subscribeId) {
		this.num = num;
		this.userId = userId;
		SubscribeId = subscribeId;
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
		return SubscribeId;
	}

	public void setSubscribeId(String subscribeId) {
		SubscribeId = subscribeId;
	}
	
}
