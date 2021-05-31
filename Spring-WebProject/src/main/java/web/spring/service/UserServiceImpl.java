package web.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import web.spring.mapper.UserMapper;
import web.spring.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserVO login(UserVO user) {
		return  mapper.login(user);
	}


	@Override
	public int updateSessionkey(UserVO user) {
		return mapper.updateSessionkey(user);
	}

	@Override
	public UserVO loginSessionkey(String sessionkey) {
		UserVO user =  mapper.loginSessionkey(sessionkey);
		return user;
	}

	@Override
	public int insertUser(UserVO user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// TODO Auto-generated method stub
		String encode = encoder.encode(user.getUser_password());
		user.setUser_password(encode);
		return mapper.insertUser(user);
	}

	@Override
	public UserVO checkIdReapet(String User_id) {
		UserVO user = mapper.checkIdReapet(User_id);
		return user;
	}

	@Override
	public UserVO checkId(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.checkId(user);
	}

	@Override
	public UserVO checkPwd(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.checkPwd(user);
	}


	@Override
	public UserVO updateUser(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.updateUser(user);
	}

}
