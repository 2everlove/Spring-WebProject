package web.spring.mapper;

import java.util.List;

import web.spring.vo.UserVO;

public interface UserMapper {

	  public UserVO getUser(String user_id);
	  
	  public String getUser_type(String User_id);
	  
	  public List<UserVO> getUserList();
	  
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
}
