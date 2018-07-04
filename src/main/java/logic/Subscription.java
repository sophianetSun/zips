package logic;

import java.io.Serializable;

public class Subscription implements Serializable {
	private Integer num;
	private String user_id;
	private String subscribe_id;
	
	// Constructor
	public Subscription(Integer num, String userId, String subscribeId) {
		this.num = num;
		this.user_id = userId;
		this.subscribe_id = subscribeId;
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
		return user_id;
	}

	public void setUserId(String userId) {
		this.user_id = userId;
	}

	public String getSubscribeId() {
		return subscribe_id;
	}

	public void setSubscribeId(String subscribeId) {
		this.subscribe_id = subscribeId;
	}
	
}
