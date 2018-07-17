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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSubscribe_id() {
		return subscribe_id;
	}

	public void setSubscribe_id(String subscribe_id) {
		this.subscribe_id = subscribe_id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Subscription [num=").append(num).append(", user_id=").append(user_id).append(", subscribe_id=")
				.append(subscribe_id).append("]");
		return builder.toString();
	}
	
}
