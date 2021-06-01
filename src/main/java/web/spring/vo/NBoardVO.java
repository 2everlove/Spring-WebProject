package web.spring.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NBoardVO {

	int nboard_no;			//ê³µì?ê¸? ë²ˆí˜¸
	String nboard_title;		//ê³µì?ê¸? ? œëª?
	String nboard_content;	//ê³µì?ê¸? ?‚´?š©
	Date nboard_regDate;		//ê³µì?ê¸? ?“±ë¡ì¼
	Date nboard_updateDate; 	//ê³µì?ê¸? ?ˆ˜? •?¼
	String nboard_category;	//ê³µì?ê¸? ë¶„ë¥˜ 'E' : ?´ë²¤íŠ¸ 'N' : ê³µì? 'O'  : ê¸°í?
	String nboard_public;	//? ê¸´ê? ì²˜ë¦¬ 'Y' : ? ê¹? 'N' : ê³µê°œ
	String user_id;			//?œ ?? ?•„?´?””
	String file_pictureId;	//?¸?„¤?¼ ?•„?´?””
}
