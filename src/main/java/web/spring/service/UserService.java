package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.UserVO;

@Service
public interface UserService {

	public UserVO getUser(String user_id); 
	
	public List<UserVO> getUserList(); 
	
	public UserVO login(UserVO user);
	
	public int updateSessionkey(UserVO user);
	
	public UserVO loginSessionkey (String sessionkey);
	
	public int insertUser(UserVO user);
	
	public UserVO checkIdReapet (String User_id);
	
	public UserVO checkId(UserVO user);
	
	public UserVO checkPwd(UserVO user);
	
	public UserVO updateUser(UserVO user);
}
