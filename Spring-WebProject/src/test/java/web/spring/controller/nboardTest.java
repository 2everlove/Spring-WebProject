package web.spring.controller;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.spring.vo.PageNavi;
import lombok.extern.log4j.Log4j;
import oracle.sql.DATE;
import web.spring.mapper.NBoardMapper;
import web.spring.service.NBoardService;
import web.spring.vo.Criteria;
import web.spring.vo.NBoardVo;

@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class nboardTest {

	@Autowired
	NBoardMapper mapper;
	
	@Autowired
	NBoardService service;
	
	
	@Test
	public void insertNboardMapperTest() {
		NBoardVo vo = new NBoardVo();
		vo.setFile_pictureId("testfile");
		vo.setNboard_category("E");
		vo.setNboard_content("공지게시판 테스트입니다.");
		vo.setNboard_public("N");
		vo.setNboard_title("공지글 제목");
		vo.setUser_id("testuser");
		mapper.insertNboard(vo);
	}
	@Test
	public void insertNboardServiceTest() {
		NBoardVo vo = new NBoardVo();
		vo.setFile_pictureId("testfile");
		vo.setNboard_category("E");
		vo.setNboard_content("공지게시판 테스트입니다.");
		vo.setNboard_public("N");
		vo.setNboard_title("공지글 제목");
		vo.setUser_id("testuser");
		service.insertNboard(vo);
	}
	@Test
	public void selectNboardService() {
		log.info(service.get(12));
	}
	
	@Test
	public void selectNboardMapper() {
		log.info(mapper.get(12));
	}
	
	@Test
	public void getList() {
		Criteria cri = new Criteria();
		PageNavi pageNavi = new PageNavi(cri, 150);
		List<NBoardVo>list = mapper.getList(cri);
		log.info(list);
	}
	@Test
	public void Update() {
		NBoardVo vo = new NBoardVo();
		vo.setNboard_no(12);
		vo.setNboard_title("junit테스트");
		vo.setNboard_content("수정된 내용");
		vo.setNboard_category("P");
		vo.setFile_pictureId("testfile");
		vo.setUser_id("testuser");
		log.info(vo);
		mapper.update(vo);
	}
	@Test
	public void deleteTest() {
		mapper.delete(15);
	}
	@Test
	public void LockTest() {
		NBoardVo vo= new NBoardVo();
		vo.setNboard_no(14);
		vo.setNboard_public("Y");
		mapper.nboardLock(vo);
	}
	@Test
	public void addList() {
		for(int i=0;i<=100;i++) {
			NBoardVo vo = new NBoardVo();
			vo.setFile_pictureId("testfile");
			vo.setNboard_category("E");
			vo.setNboard_content(i+"번 공지게시판 테스트입니다.");
			vo.setNboard_public("N");
			vo.setNboard_title(i+"번 공지글 제목");
			vo.setUser_id("testuser");
			service.insertNboard(vo);
		}
	}
	
}
