package web.spring.vo;

import java.util.Date;

public class ProductVO {
	
	private String product_id;
	private String product_manufacturer;
	private String product_name;
	private String product_description;
	private String product_category;
	private String product_color;
	private Date product_regdate;
	private String file_pictureId;
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_manufacturer() {
		return product_manufacturer;
	}
	public void setProduct_manufacturer(String product_manufacturer) {
		this.product_manufacturer = product_manufacturer;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public Date getProduct_regdate() {
		return product_regdate;
	}
	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}
	public String getFile_pictureId() {
		return file_pictureId;
	}
	public void setFile_pictureId(String file_pictureId) {
		this.file_pictureId = file_pictureId;
	}
	
	
}
