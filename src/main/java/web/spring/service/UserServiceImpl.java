package web.spring.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import web.spring.mapper.UserMapper;
import web.spring.vo.Criteria;
import web.spring.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_= @Autowired)
	private UserMapper userMapper;
	
	@Setter(onMethod_= {@Autowired})
	MailService ms;
	
	

	@Override
	public UserVO getUser(String user_id) {
		return userMapper.getUser(user_id);
	}

	@Override
	public List<UserVO> getUserList() {
		return userMapper.getUserList();
	}
	
	@Override
	public UserVO login(UserVO user) {
		return  userMapper.login(user);
	}


	@Override
	public int updateSessionkey(UserVO user) {
		return userMapper.updateSessionkey(user);
	}

	@Override
	public UserVO loginSessionkey(String sessionkey) {
		UserVO user =  userMapper.loginSessionkey(sessionkey);
		return user;
	}

	@Override
	public int insertUser(UserVO user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encode = encoder.encode(user.getUser_password());
		user.setUser_password(encode);
		return userMapper.insertUser(user);
	}

	@Override
	public UserVO checkIdReapet(String User_id) {
		UserVO user = userMapper.checkIdReapet(User_id);
		return user;
	}

	@Override
	public UserVO checkId(UserVO user) {
		return userMapper.checkId(user);
	}

	@Override
	public UserVO checkPwd(UserVO user) {
		UserVO dbUser = userMapper.checkPwd(user.getUser_id(), user.getUser_email());
		if(dbUser!=null) {
			String uuid = UUID.randomUUID().toString().substring(0,7);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String postPwd = encoder.encode(uuid);
			userMapper.pwdUdate(postPwd, dbUser.getUser_id(),dbUser.getUser_email());
			ms.sendMailPwd(dbUser.getUser_email(), uuid);
		}
		return dbUser;
	}

	@Override
	public int updateUser(UserVO user) {
		return userMapper.updateUser(user);
	}

	@Override
	public List<UserVO> getAllUserList(Criteria cri) {
		return userMapper.getAllUserList(cri);
	}

	@Override
	public int getUserTotal(Criteria cri) {
		return userMapper.getUserTotal(cri);
	}




}
