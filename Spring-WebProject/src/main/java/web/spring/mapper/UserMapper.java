package web.spring.mapper;

import web.spring.vo.UserVO;

public interface UserMapper {

	public UserVO login(UserVO user);
	
	public int updateSessionkey(UserVO user);
	
	public UserVO loginSessionkey (String sessionkey);
	
	public int insertUser(UserVO user);
	
	public UserVO checkIdReapet (String User_id);
	
	public UserVO checkId(UserVO user);
	
	public UserVO checkPwd(UserVO user);
	
	public UserVO updateUser(UserVO user);
}