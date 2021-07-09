package web.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String num; //순번
	private String User_id; // 아이디
	private String User_email; // 이메일
	private String User_name; //이름
	private String User_password; //비밀번호
	private String User_contact; //연락처
	private String User_enabled;	//유저 사용시 1
	private String User_type;		//어드민 : 0, 기업 : 1, 고객 : 2
	private String User_regdate; //가입일
	private String User_gender; //성별
	private String User_birth; //생일
	private String User_address; //주소
	private String User_interesting; //관심사
	private String User_enabledContent;	//블록 코멘트 - 잘못한 일이 있어서 블록당하면 블록당한 이유를 저장
	private String file_pictureId; //유저 이미지 파일
	
	private String sessionkey;// 자동로그인에 필요한 키값
	private Date sessionlimit;// 자동로그인의 유효기간
	private String tmp_password; // 임시 비번
	public boolean hasRole(String role_id) {
		if(User_type!=null) {
			return User_type.contains(role_id);	
		}
		return false;
	}
}
