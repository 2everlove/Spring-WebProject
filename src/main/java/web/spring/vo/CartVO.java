package web.spring.vo;

public class CartVO {

	String num;
	String cart_id;
	String user_id;
	String user_name;
	String product_id;
	String product_name;
	String pboard_unit_no;
	String cart_totalprice;
	String cart_totalcount;
	String user_address;
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPboard_unit_no() {
		return pboard_unit_no;
	}
	public void setPboard_unit_no(String pboard_unit_no) {
		this.pboard_unit_no = pboard_unit_no;
	}
	public String getCart_totalprice() {
		return cart_totalprice;
	}
	public void setCart_totalprice(String cart_totalprice) {
		this.cart_totalprice = cart_totalprice;
	}
	public String getCart_totalcount() {
		return cart_totalcount;
	}
	public void setCart_totalcount(String cart_totalcount) {
		this.cart_totalcount = cart_totalcount;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
}