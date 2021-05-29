package web.spring.mapper;

import java.util.List;

import web.spring.vo.UserVO;

public interface UserMapper {

	public UserVO getUser(String user_id); 
	
	public List<UserVO> getUserList(); 
}
