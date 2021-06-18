package src.main.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import web.spring.mapper.NBoardMapper;
import web.spring.mapper.UserMapper;
import web.spring.service.NBoardService;
import web.spring.vo.NBoardVO;
import web.spring.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class nboardTest {

	@Autowired
	NBoardService nboardService;
	@Autowired
	UserMapper userMapper;
	@org.junit.Test
	public void addNboard() {
		for(int i=0; i<100;i++) {
		NBoardVO vo =new NBoardVO();
		vo.setNboard_category("0");
		vo.setNboard_content(i+"번 테스트입니다.");
		vo.setNboard_public("0");
		vo.setNboard_title(i+"번 테스트입니다.");
		vo.setUser_id("testuser01");
		vo.setFile_pictureId("1");
		nboardService.insertNboard(vo);
		}
	}
	@Test
	public void loginTest() {
		
		UserVO user = new UserVO();
		user.setUser_id("testuser02");
		user.setUser_password("54ce2a1");
		
		 UserVO tmpVo = userMapper.getUser(user.getUser_id());
		 System.out.println(tmpVo);
		 System.out.println(user);

		 if(tmpVo!=null) {
			 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			 System.out.println(encoder.matches(user.getUser_password(), tmpVo.getUser_password()));
			 if (encoder.matches(user.getUser_password(), tmpVo.getUser_password())) {
				 System.out.println(userMapper.login(user)); 
			 }
			 
		 }
	}
	
	@Test
	public void loginTest2() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		UserVO user = new UserVO();
		user.setUser_id("testuser02");
		user.setUser_password(encoder.encode("54ce2a1"));
		user.setUser_email("jado2002@naver.com");
		
		 int tmpVo = userMapper.updatePwd(user);
		 System.out.println(tmpVo);
		 System.out.println(user);

		 
			
	}
}
