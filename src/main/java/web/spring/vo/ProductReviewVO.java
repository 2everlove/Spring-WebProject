package web.spring.vo;


import lombok.Data;

@Data
public class ProductReviewVO {
	
	
	private int review_num;
	private String review_content;
	private String review_regdate;
	private int review_rate;
	private int pboard_unit_no;
	private String user_id;
	private int replycount;
	
	
	
}
