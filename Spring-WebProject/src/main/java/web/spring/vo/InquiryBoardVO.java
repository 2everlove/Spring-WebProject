package web.spring.vo;

import lombok.Data;

@Data
public class InquiryBoardVO {
	
	//게시판 영역
	private int iboard_no;			//게시글 번호
	private String iboard_title; 	//게시글 제목
	private String iboard_content;	//게시글 내용
	private String iboard_regdate;	//게시글 등록일자
	private String iboard_regdate_new;	//게시글 등록일자 + 7일 New 표시를 위한
	private String iboard_category;	//게시글 카테고리
	private int iboard_public;		//게시글 공개여부 0 이면 공개, 1이면 비공개
	private String user_id;			//유저 아이디 Foreign Key
	
	//게시판 관리자 답글 영역
	
	private int ireply_no; //답글 번호
	private String ireply_content; //답글 내용
	private String ireply_regdate; //답글 날짜
	
	// private String user_id;
	// private int iboard_no;
	

	
	

}
