package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.Criteria;
import web.spring.vo.UserVO;

@Service
public interface UserService {

	public UserVO getUser(String user_id); 
	
	public List<UserVO> getUserList(); 
	
	public UserVO checkId(UserVO user);
	  
	public UserVO checkPwd(UserVO user); ////비밀번호 변경 후 메일 보내기
	
	//admin 전체 유저 목록
	public List<UserVO> getAllUser(); 
	
	public List<UserVO> getAllUserList(Criteria cri);
	
	public int getUserTotal(Criteria cri);
	
	public int updateUserByAdmin(UserVO user);
	
	//---------------------------------
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
