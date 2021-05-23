package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PBoardVO {
	private String product_unit_no;
	private String product_unit_price;
	private String product_unit_condition;
	private String product_unit_stocks;
	private Date product_unit_regdate;
	private Date product_unit_updateDate;
	private String product_id;
	private String user_id;
	private String file_pictureId;
}
