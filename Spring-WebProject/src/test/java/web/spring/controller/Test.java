package web.spring.controller;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import web.spring.mapper.NBoardMapper;
import web.spring.vo.NBoardVO;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Test {

	@Autowired
	NBoardMapper mapper;
	
	@org.junit.Test
	public void sequenceTest() {
		NBoardVO vo = new NBoardVO();
		//vo.setNboard_no("183");
		vo.setUser_id("testuser");
		vo.setFile_pictureId("testfile");
		vo.setNboard_category("E");
		vo.setNboard_content("content");
		/* vo.setNboard_public("1"); */
		vo.setNboard_title("title");
		int res = mapper.insertNboard(vo);
		System.out.println("res=============="+res);
	}
	
}
