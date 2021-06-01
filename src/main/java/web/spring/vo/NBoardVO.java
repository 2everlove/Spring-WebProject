package web.spring.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NBoardVO {

	int nboard_no;			//공�?�? 번호
	String nboard_title;		//공�?�? ?���?
	String nboard_content;	//공�?�? ?��?��
	Date nboard_regDate;		//공�?�? ?��록일
	Date nboard_updateDate; 	//공�?�? ?��?��?��
	String nboard_category;	//공�?�? 분류 'E' : ?��벤트 'N' : 공�? 'O'  : 기�?
	String nboard_public;	//?��긴�? 처리 'Y' : ?���? 'N' : 공개
	String user_id;			//?��?? ?��?��?��
	String file_pictureId;	//?��?��?�� ?��?��?��
}
