package web.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.spring.vo.Criteria;
import web.spring.vo.UserVO;

public interface UserMapper {

	public UserVO getUser(String user_id); 
	
	public UserVO checkPwd(@Param("user_id") String id, @Param("user_email") String email); //pwd업데이트하기 위해 먼저 user의 id와 email와 일치하는 user정보 가져오기
	
	public int pwdUdate(@Param("user_password") String pwd, @Param("user_id") String id, @Param("user_email") String email);//pwd 업데이트
	
	public UserVO checkId(UserVO user);
	
	public List<UserVO> getUserList(); 
	
	//admin 전체 유저 목록
	public List<UserVO> getAllUser(); 
	
	public List<UserVO> getAllUserList(Criteria cri);
	
	public int getUserTotal(Criteria cri);
	
	public int updateUserByAdmin(UserVO user);
	
	//-----------------------------
	
	public String getUser_type(String User_id);
	
	public UserVO login(UserVO user);

	public int updateSessionkey(UserVO user);

	public UserVO loginSessionkey(String sessionkey);

	public int insertUser(UserVO user);

	public UserVO checkIdReapet(String User_id);

	public String searchId(UserVO user);

	public UserVO searchPwd(UserVO user);

	public boolean updateUser(UserVO user);

	public int updatePwd(UserVO user);

	public String getFileSeq();

	public UserVO searchUserByEmail(String User_email);
}
