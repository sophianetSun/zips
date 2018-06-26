package logic;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Shop implements Serializable {
	private Integer shop_no;
	
	private String shop_seller_id;
	
	private String shop_buyer_id;
	
	// null + 빈 문자열 : 파라미터 자체에 name 속성이 없으면 null, 파라미터에 값이 없으면 빈 문자열 => @NotEmpty
	@NotEmpty(message="상품명을 등록하세요") 
	private String shop_subject;
	
	@NotEmpty(message="상품 내용을 등록하세요")
	private String shop_content;
	
	@NotNull(message="상품 가격을 등록하세요")
	@Min(value=10, message="상품 가격은 10원 이상 가능합니다.")
	@Max(value=500000, message="상품 가격은 50만원 이하만 가능합니다.")
	private Integer shop_price;
	
	private Integer shop_selller_confirm;
	
	private Integer shop_buyer_confirm;
	
	private String shop_status;
	
	private Date shop_regdate;

	
	
	public Integer getShop_no() {
		return shop_no;
	}

	public void setShop_no(Integer shop_no) {
		this.shop_no = shop_no;
	}

	public String getShop_seller_id() {
		return shop_seller_id;
	}

	public void setShop_seller_id(String shop_seller_id) {
		this.shop_seller_id = shop_seller_id;
	}

	public String getShop_buyer_id() {
		return shop_buyer_id;
	}

	public void setShop_buyer_id(String shop_buyer_id) {
		this.shop_buyer_id = shop_buyer_id;
	}

	public String getShop_subject() {
		return shop_subject;
	}

	public void setShop_subject(String shop_subject) {
		this.shop_subject = shop_subject;
	}

	public String getShop_content() {
		return shop_content;
	}

	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}

	public Integer getShop_price() {
		return shop_price;
	}

	public void setShop_price(Integer shop_price) {
		this.shop_price = shop_price;
	}

	public Integer getShop_selller_confirm() {
		return shop_selller_confirm;
	}

	public void setShop_selller_confirm(Integer shop_selller_confirm) {
		this.shop_selller_confirm = shop_selller_confirm;
	}

	public Integer getShop_buyer_confirm() {
		return shop_buyer_confirm;
	}

	public void setShop_buyer_confirm(Integer shop_buyer_confirm) {
		this.shop_buyer_confirm = shop_buyer_confirm;
	}

	public String getShop_status() {
		return shop_status;
	}

	public void setShop_status(String shop_status) {
		this.shop_status = shop_status;
	}

	public Date getShop_regdate() {
		return shop_regdate;
	}

	public void setShop_regdate(Date shop_regdate) {
		this.shop_regdate = shop_regdate;
	}

	@Override
	public String toString() {
		return "Shop [shop_no=" + shop_no + ", shop_seller_id=" + shop_seller_id + ", shop_buyer_id=" + shop_buyer_id
				+ ", shop_subject=" + shop_subject + ", shop_content=" + shop_content + ", shop_price=" + shop_price
				+ ", shop_selller_confirm=" + shop_selller_confirm + ", shop_buyer_confirm=" + shop_buyer_confirm
				+ ", shop_status=" + shop_status + ", shop_regdate=" + shop_regdate + "]";
	}
}
