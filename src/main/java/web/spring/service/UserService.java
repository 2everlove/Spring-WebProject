package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.UserVO;

@Service
public interface UserService {

	public UserVO getUser(String user_id); 
	
	public List<UserVO> getUserList(); 
}
