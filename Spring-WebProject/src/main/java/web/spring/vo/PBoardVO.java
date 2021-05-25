
package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
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
}