package web.spring.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NBoardVO {

	int nboard_no;			//공지글 번호
	String nboard_title;		//공지글 제목
	String nboard_content;	//공지글 내용
	String nboard_regDate;		//공지글 등록일
	String nboard_regDate_new;		//공지글 등록일
	String nboard_updateDate; 	//공지글 수정일
	String nboard_category;	//공지글 분류 'E' : 이벤트 'N' : 공지 'O'  : 기타
	String nboard_public;	//잠긴글 처리 'Y' : 잠김 'N' : 공개
	String user_id;			//유저 아이디
	String file_pictureId;	//썸네일 아이디
}
