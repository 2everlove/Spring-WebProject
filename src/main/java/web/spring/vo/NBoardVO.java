package web.spring.vo;

import java.sql.Date;

public class NBoardVO {

	int nboard_no;			//Í≥µÏ?Í∏? Î≤àÌò∏
	String nboard_title;		//Í≥µÏ?Í∏? ?†úÎ™?
	String nboard_content;	//Í≥µÏ?Í∏? ?Ç¥?ö©
	Date nboard_regDate;		//Í≥µÏ?Í∏? ?ì±Î°ùÏùº
	Date nboard_updateDate; 	//Í≥µÏ?Í∏? ?àò?†ï?ùº
	String nboard_category;	//Í≥µÏ?Í∏? Î∂ÑÎ•ò 'E' : ?ù¥Î≤§Ìä∏ 'N' : Í≥µÏ? 'O'  : Í∏∞Ì?
	String nboard_public;	//?û†Í∏¥Í? Ï≤òÎ¶¨ 'Y' : ?û†Íπ? 'N' : Í≥µÍ∞ú
	String user_id;			//?ú†?? ?ïÑ?ù¥?îî
	String file_pictureId;	//?ç∏?Ñ§?ùº ?ïÑ?ù¥?îî
	public int getNboard_no() {
		return nboard_no;
	}
	public void setNboard_no(int nboard_no) {
		this.nboard_no = nboard_no;
	}
	public String getNboard_title() {
		return nboard_title;
	}
	public void setNboard_title(String nboard_title) {
		this.nboard_title = nboard_title;
	}
	public String getNboard_content() {
		return nboard_content;
	}
	public void setNboard_content(String nboard_content) {
		this.nboard_content = nboard_content;
	}
	public Date getNboard_regDate() {
		return nboard_regDate;
	}
	public void setNboard_regDate(Date nboard_regDate) {
		this.nboard_regDate = nboard_regDate;
	}
	public Date getNboard_updateDate() {
		return nboard_updateDate;
	}
	public void setNboard_updateDate(Date nboard_updateDate) {
		this.nboard_updateDate = nboard_updateDate;
	}
	public String getNboard_category() {
		return nboard_category;
	}
	public void setNboard_category(String nboard_category) {
		this.nboard_category = nboard_category;
	}
	public String getNboard_public() {
		return nboard_public;
	}
	public void setNboard_public(String nboard_public) {
		this.nboard_public = nboard_public;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFile_pictureId() {
		return file_pictureId;
	}
	public void setFile_pictureId(String file_pictureId) {
		this.file_pictureId = file_pictureId;
	}
	
	
}
