package web.spring.vo;

import java.util.Date;

public class PBoardVO {
	private String num;
	private String pboard_unit_no;
	private String pboard_unit_price;
	private String pboard_unit_condition;
	private String pboard_unit_stocks;
	private Date pboard_unit_regdate;
	private Date pboard_unit_updateDate;
	private String each_rank;
	private String product_id;
	private String user_id;
	private String file_pictureId;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
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
	public Date getPboard_unit_updateDate() {
		return pboard_unit_updateDate;
	}
	public void setPboard_unit_updateDate(Date pboard_unit_updateDate) {
		this.pboard_unit_updateDate = pboard_unit_updateDate;
	}
	public String getEach_rank() {
		return each_rank;
	}
	public void setEach_rank(String each_rank) {
		this.each_rank = each_rank;
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
	public String getFile_pictureId() {
		return file_pictureId;
	}
	public void setFile_pictureId(String file_pictureId) {
		this.file_pictureId = file_pictureId;
	}
	
	
}