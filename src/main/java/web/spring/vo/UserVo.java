package web.spring.vo;

import java.util.Date;

public class UserVO {
	private String User_id; //
	private String User_email; //
	private String User_name;
	private String User_password;
	private String User_contact;
	private String User_enabled;	//�쑀�� �궗�슜�떆 1
	private String User_type;		//�뼱�뱶誘� : A, 湲곗뾽 : E, 怨좉컼 : C
	private String User_regdate;
	private String User_gender;
	private String User_birth;
	private String User_address;
	private String User_interesting;
	private String User_enabledContent;	//釉붾줉 肄붾찘�듃 - �옒紐삵븳 �씪�씠 �엳�뼱�꽌 釉붾줉�떦�븯硫� 釉붾줉�떦�븳 �씠�쑀瑜� ���옣
	private String file_pictureId;
	
	// �옄�룞濡쒓렇�씤�뿉 �븘�슂�븳 �궎媛�
	String sessionkey;
	// �옄�룞濡쒓렇�씤�쓽 �쑀�슚湲곌컙
	Date sessionlimit;
	public boolean hasRole(String role_id) {
		if(User_type!=null) {
			return User_type.contains(role_id);	
		}
		return false;
	}
	public String getUser_id() {
		return User_id;
	}
	public void setUser_id(String user_id) {
		User_id = user_id;
	}
	public String getUser_email() {
		return User_email;
	}
	public void setUser_email(String user_email) {
		User_email = user_email;
	}
	public String getUser_name() {
		return User_name;
	}
	public void setUser_name(String user_name) {
		User_name = user_name;
	}
	public String getUser_password() {
		return User_password;
	}
	public void setUser_password(String user_password) {
		User_password = user_password;
	}
	public String getUser_contact() {
		return User_contact;
	}
	public void setUser_contact(String user_contact) {
		User_contact = user_contact;
	}
	public String getUser_enabled() {
		return User_enabled;
	}
	public void setUser_enabled(String user_enabled) {
		User_enabled = user_enabled;
	}
	public String getUser_type() {
		return User_type;
	}
	public void setUser_type(String user_type) {
		User_type = user_type;
	}
	public String getUser_regdate() {
		return User_regdate;
	}
	public void setUser_regdate(String user_regdate) {
		User_regdate = user_regdate;
	}
	public String getUser_gender() {
		return User_gender;
	}
	public void setUser_gender(String user_gender) {
		User_gender = user_gender;
	}
	public String getUser_birth() {
		return User_birth;
	}
	public void setUser_birth(String user_birth) {
		User_birth = user_birth;
	}
	public String getUser_address() {
		return User_address;
	}
	public void setUser_address(String user_address) {
		User_address = user_address;
	}
	public String getUser_interesting() {
		return User_interesting;
	}
	public void setUser_interesting(String user_interesting) {
		User_interesting = user_interesting;
	}
	public String getUser_enabledContent() {
		return User_enabledContent;
	}
	public void setUser_enabledContent(String user_enabledContent) {
		User_enabledContent = user_enabledContent;
	}
	public String getFile_pictureId() {
		return file_pictureId;
	}
	public void setFile_pictureId(String file_pictureId) {
		this.file_pictureId = file_pictureId;
	}
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public Date getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(Date sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
}
