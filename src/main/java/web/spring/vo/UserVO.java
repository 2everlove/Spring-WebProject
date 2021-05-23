package web.spring.vo;

import lombok.Data;

@Data
public class UserVO {
	private String User_id;//
	private String User_email;
	private String User_name;
	private String User_password;
	private String User_contact;
	private String User_enabled;
	private String User_type;
	private String User_regdate;//
	private String User_gender;
	private String User_birth;
	private String User_address;
	private String User_interesting;
	private String User_enabledContent;
	private String file_pictureId;
}
