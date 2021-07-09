package web.spring.vo;

import lombok.Data;

@Data
public class OrderVO {
	
	private String num;
	private String order_id;
	private String order_address;
	private String order_name;
	private String order_regdate;
	private String order_canceldate;
	private String order_status;
	private String user_id;
	private String product_id;
	private String product_name;
	private String pboard_unit_no;
	private String order_totalcount;
	private String order_totalprice;
	private String pboard_user_id;
	
}