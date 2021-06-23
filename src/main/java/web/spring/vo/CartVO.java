package web.spring.vo;

import lombok.Data;

@Data
public class CartVO {

	String num;
	String stocks;
	String cart_id;
	String user_id;
	String user_name;
	String product_id;
	String product_name;
	String pboard_unit_no;
	String cart_totalprice;
	String cart_totalcount;
	String user_address;
	String pboard_unit_stocks;
	
}