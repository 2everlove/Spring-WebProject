package web.spring.vo;

import java.util.Date;

public class ProductVo {

	String pboard_unit_no;
	String pboard_unit_price;
	String pboard_unit_condition;
	String pboard_unit_stocks;
	Date pboard_unit_regdate;
	Date pboard_unit_updatedate;
	String product_id;
	String user_id;
	String file_pictureid;
	public String getPboard_unit_no() {
		return pboard_unit_no;
	}
	public void setPboard_unit_no(String pboard_unit_no) {
		this.pboard_unit_no = pboard_unit_no;
	}
	public String getPboard_unit_price() {
		return pboard_unit_price;
	}
	public void setPboard_unit_price(String pboard_unit_price) {
		this.pboard_unit_price = pboard_unit_price;
	}
	public String getPboard_unit_condition() {
		return pboard_unit_condition;
	}
	public void setPboard_unit_condition(String pboard_unit_condition) {
		this.pboard_unit_condition = pboard_unit_condition;
	}
	public String getPboard_unit_stocks() {
		return pboard_unit_stocks;
	}
	public void setPboard_unit_stocks(String pboard_unit_stocks) {
		this.pboard_unit_stocks = pboard_unit_stocks;
	}
	public Date getPboard_unit_regdate() {
		return pboard_unit_regdate;
	}
	public void setPboard_unit_regdate(Date pboard_unit_regdate) {
		this.pboard_unit_regdate = pboard_unit_regdate;
	}
	public Date getPboard_unit_updatedate() {
		return pboard_unit_updatedate;
	}
	public void setPboard_unit_updatedate(Date pboard_unit_updatedate) {
		this.pboard_unit_updatedate = pboard_unit_updatedate;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFile_pictureid() {
		return file_pictureid;
	}
	public void setFile_pictureid(String file_pictureid) {
		this.file_pictureid = file_pictureid;
	}
	
}