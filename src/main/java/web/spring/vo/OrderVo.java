package web.spring.vo;

public class OrderVO {
	
	String order_id;
	String order_address;
	String order_name;
	String order_regdate;
	String order_canceldate;
	String order_status;
	String user_id;
	String product_id;
	String pboard_unit_no;
	String order_totalcount;
	String order_totalprice;
	
	public String getOrder_totalprice() {
		return order_totalprice;
	}
	public void setOrder_totalprice(String order_totalprice) {
		this.order_totalprice = order_totalprice;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(String order_regDate) {
		this.order_regdate = order_regDate;
	}
	public String getOrder_canceldate() {
		return order_canceldate;
	}
	public void setOrder_canceldate(String order_cancelDate) {
		this.order_canceldate = order_cancelDate;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getPboard_unit_no() {
		return pboard_unit_no;
	}
	public void setPboard_unit_no(String pboard_unit_no) {
		this.pboard_unit_no = pboard_unit_no;
	}
	public String getOrder_totalcount() {
		return order_totalcount;
	}
	public void setOrder_totalcount(String order_totalCount) {
		this.order_totalcount = order_totalCount;
	}
	
	
}