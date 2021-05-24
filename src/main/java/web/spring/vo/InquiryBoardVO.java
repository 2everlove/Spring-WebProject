package web.spring.vo;

import lombok.Data;

@Data
public class InquiryBoardVO {
	
	private int iboard_no;
	private String iboard_title;
	private String iboard_content;
	private String iboard_regdate;
	private String iboard_category;
	private int iboard_public;
	public String user_id;
	
	
	

}
