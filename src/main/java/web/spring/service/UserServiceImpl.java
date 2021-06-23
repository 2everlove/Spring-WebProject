package web.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	@Override
	public List<UserVO> getUserList() {
		return userMapper.getUserList();
	}
	
	@Override
	public UserVO login(UserVO user) {
		 UserVO tmpVo = userMapper.getUser(user.getUser_id());
		 System.out.println(tmpVo);
		 System.out.println(user);

		 if(tmpVo!=null) {
			 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			 System.out.println(encoder.matches(user.getUser_password(), tmpVo.getUser_password()));
			 if (encoder.matches(user.getUser_password(), tmpVo.getUser_password())) {
				 return this.userMapper.login(user); 
			 }
			 
		 }
		 	return null;
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
	public String searchId(UserVO user) {
		return userMapper.searchId(user);
	}

	@Override
	public UserVO searchPwd(UserVO user) {
		return userMapper.searchPwd(user);
	}


	@Override
	 public boolean updateUser(UserVO user) {
	    UserVO tmpVo = getUser(user.getUser_id());
	    System.out.println("tmpVo:"+tmpVo);
	    System.out.println("user:"+user);
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    if (encoder.matches(user.getTmp_password(), tmpVo.getUser_password())==true) {
	    	String encode = encoder.encode(user.getUser_password());
	    	user.setUser_password(encode);
	    	userMapper.updateUser(user);
	    	return true;
	    } else {
	    	return false;
	    }
	  }

	public String getUser_type(String User_id) {
	    return userMapper.getUser_type(User_id);
	  }
	
	 public int updatePwd(UserVO user) {
		    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		    String encodePwd = encoder.encode(user.getUser_password());
		    user.setUser_password(encodePwd);
		    return userMapper.updatePwd(user);
		  }

	@Override
	public String getFileSeq() {
		return userMapper.getFileSeq();
	}

	@Override
	public UserVO searchUserByEmail(String User_email) {
		return userMapper.searchUserByEmail(User_email);
	}

	@Override
	public UserVO googleLogin(UserVO user) {
		return userMapper.login(user);
	}
}
