package web.spring.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PBoardVO {
	private String num;
	private String avg;
	private String pboard_unit_no;
	private String pboard_unit_price;
	private String pboard_unit_condition;
	private String pboard_unit_stocks;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pboard_unit_regdate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pboard_unit_updateDate;
	
	private String pboard_unit_enabled;
	private String each_rank;
	private String product_id;
	private String user_id;
	private String file_pictureId;
	private String masterImg; //마스터 상품 이미지
}
