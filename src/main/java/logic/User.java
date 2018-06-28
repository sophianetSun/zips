package logic;

import java.io.Serializable;
import java.sql.Date;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

public class User implements Serializable{
	@Size(min=3, max=10, message="아이디를 입력해 주세요")
	private String id;
	@Size(min=3, max=12, message="비밀번호를 입력해 주세요")
	private String pw;
	@NotEmpty(message="이름을 입력해 주세요")
	private String name;
	private String email;
	private String nickname;
	private String tel;
	private String address;
	private String gender;
	private double height;
	private double weight;
	private double bodyfat;
	private int blacklist;
	private int point;
	private int coin;
	private Date regdate;
	private Date logdate;
	private String picture;
	private double muscle;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public double getBodyfat() {
		return bodyfat;
	}
	public void setBodyfat(double bodyfat) {
		this.bodyfat = bodyfat;
	}
	public int getBlacklist() {
		return blacklist;
	}
	public void setBlacklist(int blacklist) {
		this.blacklist = blacklist;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getLogdate() {
		return logdate;
	}
	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public double getMuscle() {
		return muscle;
	}
	public void setMuscle(double muscle) {
		this.muscle = muscle;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", nickname=" + nickname
				+ ", tel=" + tel + ", address=" + address + ", gender=" + gender + ", height=" + height + ", weight="
				+ weight + ", bodyfat=" + bodyfat + ", blacklist=" + blacklist + ", point=" + point + ", coin=" + coin
				+ ", regdate=" + regdate + ", logdate=" + logdate + ", picture=" + picture + ", muscle=" + muscle + "]";
	}
}
