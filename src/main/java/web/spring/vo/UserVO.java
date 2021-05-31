package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String User_id; //
	private String User_email; //
	private String User_name;
	private String User_password;
	private String User_contact;
	private String User_enabled;	//유저 사용시 1
	private String User_type;		//어드민 : A, 기업 : E, 고객 : C
	private String User_regdate;
	private String User_gender;
	private String User_birth;
	private String User_address;
	private String User_interesting;
	private String User_enabledContent;	//블록 코멘트 - 잘못한 일이 있어서 블록당하면 블록당한 이유를 저장
	private String file_pictureId;
	
	// 자동로그인에 필요한 키값
	String sessionkey;
	// 자동로그인의 유효기간
	Date sessionlimit;
	public boolean hasRole(String role_id) {
		if(User_type!=null) {
			return User_type.contains(role_id);	
		}
		return false;
	}
}
