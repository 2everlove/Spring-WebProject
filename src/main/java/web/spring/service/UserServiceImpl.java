package web.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import web.spring.mapper.UserMapper;
import web.spring.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_= @Autowired)
	private UserMapper userMapper;

	@Override
	public UserVO getUser(String user_id) {
		return userMapper.getUser(user_id);
	}

}
