package web.spring.vo;

import lombok.Data;

@Data
public class CartVO {

	private String num;
	private String stocks;
	private String cart_id;
	private String user_id;
	private String user_name;
	private String product_id;
	private String product_name;
	private String pboard_unit_no;
	private String cart_totalprice;
	private String cart_totalcount;
	private String user_address;
	private String pboard_unit_stocks;
	
}