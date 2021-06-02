package web.spring.vo;

public class InquiryBoardVO {
	
	//寃뚯떆�뙋 �쁺�뿭
	private int iboard_no;			//寃뚯떆湲� 踰덊샇
	private String iboard_title; 	//寃뚯떆湲� �젣紐�
	private String iboard_content;	//寃뚯떆湲� �궡�슜
	private String iboard_regdate;	//寃뚯떆湲� �벑濡앹씪�옄
	private String iboard_regdate_new;	//寃뚯떆湲� �벑濡앹씪�옄 + 7�씪 New �몴�떆瑜� �쐞�븳
	private String iboard_category;	//寃뚯떆湲� 移댄뀒怨좊━
	private int iboard_public;		//寃뚯떆湲� 怨듦컻�뿬遺� 0 �씠硫� 怨듦컻, 1�씠硫� 鍮꾧났媛�
	private String user_id;			//�쑀�� �븘�씠�뵒 Foreign Key
	
	//寃뚯떆�뙋 愿�由ъ옄 �떟湲� �쁺�뿭
	
	private int ireply_no; //�떟湲� 踰덊샇
	private String ireply_content; //�떟湲� �궡�슜
	private String ireply_regdate; //�떟湲� �궇吏�
	public int getIboard_no() {
		return iboard_no;
	}
	public void setIboard_no(int iboard_no) {
		this.iboard_no = iboard_no;
	}
	public String getIboard_title() {
		return iboard_title;
	}
	public void setIboard_title(String iboard_title) {
		this.iboard_title = iboard_title;
	}
	public String getIboard_content() {
		return iboard_content;
	}
	public void setIboard_content(String iboard_content) {
		this.iboard_content = iboard_content;
	}
	public String getIboard_regdate() {
		return iboard_regdate;
	}
	public void setIboard_regdate(String iboard_regdate) {
		this.iboard_regdate = iboard_regdate;
	}
	public String getIboard_regdate_new() {
		return iboard_regdate_new;
	}
	public void setIboard_regdate_new(String iboard_regdate_new) {
		this.iboard_regdate_new = iboard_regdate_new;
	}
	public String getIboard_category() {
		return iboard_category;
	}
	public void setIboard_category(String iboard_category) {
		this.iboard_category = iboard_category;
	}
	public int getIboard_public() {
		return iboard_public;
	}
	public void setIboard_public(int iboard_public) {
		this.iboard_public = iboard_public;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getIreply_no() {
		return ireply_no;
	}
	public void setIreply_no(int ireply_no) {
		this.ireply_no = ireply_no;
	}
	public String getIreply_content() {
		return ireply_content;
	}
	public void setIreply_content(String ireply_content) {
		this.ireply_content = ireply_content;
	}
	public String getIreply_regdate() {
		return ireply_regdate;
	}
	public void setIreply_regdate(String ireply_regdate) {
		this.ireply_regdate = ireply_regdate;
	}
	
	// private String user_id;
	// private int iboard_no;
	
	
}
