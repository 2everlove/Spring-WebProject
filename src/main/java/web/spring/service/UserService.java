package web.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.spring.vo.Criteria;
import web.spring.vo.UserVO;

@Service
public interface UserService {

	public UserVO getUser(String user_id); 
	
	public List<UserVO> getUserList(); 
	
	//admin 전체 유저 목록
	public List<UserVO> getAllUser(); 
	
	public List<UserVO> getAllUserList(Criteria cri);
	
	public int getUserTotal(Criteria cri);
	
	public UserVO login(UserVO user);
	
	public int updateSessionkey(UserVO user);
	
	public UserVO loginSessionkey (String sessionkey);
	
	public int insertUser(UserVO user);
	
	public UserVO checkIdReapet (String User_id);
	
	public UserVO checkId(UserVO user);
	
	public UserVO checkPwd(UserVO user); ////비밀번호 변경 후 메일 보내기
	
	public int updateUser(UserVO user);

}
