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
	private int reply_count; 		//댓글 유무
	
	private int replycount; //매퍼용 reply 카운트
	


	
	

}
