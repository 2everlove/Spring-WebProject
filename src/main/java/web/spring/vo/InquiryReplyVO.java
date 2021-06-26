package web.spring.vo;

import lombok.Data;

@Data
public class InquiryReplyVO {
	
	//게시판 관리자 답글 영역
	
	private int ireply_no; //답글 번호
	private String ireply_content; //답글 내용
	private String ireply_regdate; //답글 날짜
	
	//Foreign Key
	
	private String user_id;	//유저 아이디
	private int iboard_no;	//게시글 번호
	

	
	

}
