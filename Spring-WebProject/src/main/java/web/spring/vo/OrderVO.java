package web.spring.vo;

import lombok.Data;

@Data
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

	
	
}